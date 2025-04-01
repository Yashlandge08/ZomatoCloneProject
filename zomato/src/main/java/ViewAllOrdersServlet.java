

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

/**
 * Servlet implementation class ViewAllOrdersServlet
 */
@WebServlet("/ViewAllOrdersServlet")
public class ViewAllOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || !"Admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String query = "SELECT o.id, c.name AS customer_name, o.quantity, o.order_date, o.delivery_status, o.total " +
                           "FROM orders o JOIN customers c ON o.customers_id = c.id";
            
            try (PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("delivery_status"));
                    order.setTotalAmount(rs.getDouble("total"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("admin_view_orders.jsp").forward(request, response);
    }
}
