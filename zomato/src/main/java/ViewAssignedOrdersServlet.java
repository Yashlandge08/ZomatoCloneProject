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

@WebServlet("/ViewAssignedOrdersServlet")
public class ViewAssignedOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer deliveryPersonId = (session != null) ? (Integer) session.getAttribute("delivery_persons_id") : null;

        if (deliveryPersonId == null) {
            response.sendRedirect("login.jsp"); // Redirect if session not set
            return;
        }

        List<Order> orders = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {

            String fetchOrderSQL = "SELECT id, quantity, order_date, total, delivery_status " +
                                   "FROM orders WHERE delivery_persons_id = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(fetchOrderSQL)) {
                ps.setInt(1, deliveryPersonId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setId(rs.getInt("id"));
                        order.setQuantity(rs.getInt("quantity"));
                        order.setOrderDate(rs.getTimestamp("order_date"));
                        order.setTotalAmount(rs.getDouble("total"));
                        order.setStatus(rs.getString("delivery_status"));
                        orders.add(order);
                    }
                }
            }

            System.out.println("Orders fetched: " + orders.size());

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving orders: " + e.getMessage());
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("view_assigned_orders.jsp").forward(request, response);
    }
}

