import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Database utility
import com.example.DBConnection;
// OrderItem model class
import com.example.OrderDetails;

@WebServlet("/ViewMyOrdersServlet")
public class ViewMyOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        List<OrderDetails> orders = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT o.id AS order_id, o.created_at, o.total_amount, "
                       + "f.foodName, f.price, oi.quantity "
                       + "FROM orders o "
                       + "JOIN order_items oi ON o.id = oi.order_id "
                       + "JOIN food_items f ON oi.food_items_id = f.id "
                       + "WHERE o.customers_id = ? "
                       + "ORDER BY o.created_at DESC";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, customerId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                    	OrderDetails order = new OrderDetails();
                        order.setOrderId(rs.getInt("order_id"));
                        order.setOrderDate(rs.getTimestamp("created_at"));
                        order.setFoodName(rs.getString("foodName"));
                        order.setPrice(rs.getDouble("price"));
                        order.setQuantity(rs.getInt("quantity"));
                        order.setTotalAmount(rs.getDouble("total_amount"));
                        orders.add(order);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("view_customer_orders.jsp").forward(request, response);
    }
}
