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
import java.util.ArrayList;
import java.util.List;

import com.example.Order;

@WebServlet("/CustomerOrdersServlet")
public class CustomerOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String query = "SELECT o.id, o.order_date, o.total, o.delivery_status, fi.foodName, oi.quantity " +
                           "FROM orders o " +
                           "JOIN order_items oi ON o.id = oi.order_id " +
                           "JOIN food_items fi ON oi.foodId = fi.id " +
                           "WHERE o.customers_id = ? " +
                           "ORDER BY o.order_date DESC";

            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, customerId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setId(rs.getInt("id"));
                        order.setOrderDate(rs.getTimestamp("order_date"));
                        order.setTotalAmount(rs.getDouble("total"));
                        order.setStatus(rs.getString("delivery_status"));
                        order.setFoodName(rs.getString("foodName"));
                        order.setQuantity(rs.getInt("quantity"));
                        orders.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("customer_orders.jsp").forward(request, response);
    }
}
