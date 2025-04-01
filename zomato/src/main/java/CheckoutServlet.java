import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.CartItem;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            conn.setAutoCommit(false);

            String fetchCartSQL = "SELECT ci.id, ci.foodId, ci.quantity, fi.foodName, fi.price " +
                                  "FROM cart_items ci JOIN food_items fi ON ci.foodId = fi.id " +
                                  "WHERE ci.customers_id = ?";
            double total = 0.0;
            List<CartItem> cartItems = new ArrayList<>();
            try (PreparedStatement psFetchCart = conn.prepareStatement(fetchCartSQL)) {
                psFetchCart.setInt(1, customerId);
                try (ResultSet rs = psFetchCart.executeQuery()) {
                    while (rs.next()) {
                        CartItem item = new CartItem();
                        item.setcartId(rs.getInt("id"));
                        item.setfoodId(rs.getInt("foodId"));
                        item.setfoodName(rs.getString("foodName"));
                        item.setprice(rs.getDouble("price"));
                        item.setquantity(rs.getInt("quantity"));
                        cartItems.add(item);
                        total += rs.getDouble("price") * rs.getInt("quantity");
                    }

                    if (cartItems.isEmpty()) {
                        session.setAttribute("message", "Your cart is empty!");
                        response.sendRedirect("cart.jsp");
                        return;
                    }
                }
            }

            
            int totalQuantity = 0;
            for (CartItem item : cartItems) {
                totalQuantity += item.getquantity();
            }
            
            String insertOrderSQL = "INSERT INTO orders (customers_id, total, quantity, order_date, delivery_status) " +
                                     "VALUES (?, ?, ?, NOW(), 'Pending')";
            int orderId;
            try (PreparedStatement psInsertOrder = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS)) {
                psInsertOrder.setInt(1, customerId);
                psInsertOrder.setDouble(2, total);
                psInsertOrder.setInt(3, totalQuantity); 
                psInsertOrder.executeUpdate();

                try (ResultSet rs = psInsertOrder.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    } else {
                        throw new Exception("Failed to retrieve order ID.");
                    }
                }
            }

            String insertOrderItemsSQL = "INSERT INTO order_items (order_id, foodId, quantity, price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement psInsertOrderItems = conn.prepareStatement(insertOrderItemsSQL)) {
                for (CartItem item : cartItems) {
                    psInsertOrderItems.setInt(1, orderId);
                    psInsertOrderItems.setInt(2, item.getfoodId());
                    psInsertOrderItems.setInt(3, item.getquantity());
                    psInsertOrderItems.setDouble(4, item.getprice());
                    psInsertOrderItems.addBatch();
                }
                psInsertOrderItems.executeBatch();
            }

            String clearCartSQL = "DELETE FROM cart_items WHERE customers_id = ?";
            try (PreparedStatement psClearCart = conn.prepareStatement(clearCartSQL)) {
                psClearCart.setInt(1, customerId);
                psClearCart.executeUpdate();
            }

            conn.commit();
            session.setAttribute("message", "Checkout successful!");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Checkout failed. Please try again.");
        }

        response.sendRedirect("CustomerOrdersServlet");
    }
}
