import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartListServlet")
public class CartListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<CartItem> cartItems = new ArrayList<>();
        double total = 0;

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String query = "SELECT ci.id, fi.foodName, fi.price, ci.quantity " +
                           "FROM cart_items ci JOIN food_items fi ON ci.foodId = fi.id " +
                           "WHERE ci.customers_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, customerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setcartId(rs.getInt("id"));
                item.setfoodName(rs.getString("foodName"));
                item.setprice(rs.getDouble("price"));
                item.setquantity(rs.getInt("quantity"));

                double itemTotal = rs.getDouble("price") * rs.getInt("quantity");
                item.settotal(itemTotal); 

                total += itemTotal;  

                cartItems.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);  
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
