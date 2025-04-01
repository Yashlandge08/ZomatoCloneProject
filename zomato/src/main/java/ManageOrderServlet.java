

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.DBConnection;
import com.example.Order;

@WebServlet("/ManageOrderServlet")
public class ManageOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || !"Admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, customers_id, quantity, order_date, delivery_persons_id, delivery_status, total FROM orders";
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setCustomerName(getCustomerNameById(rs.getInt("customers_id"))); // Assuming you have a method to get the customer name
                    order.setQuantity(rs.getInt("quantity"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("delivery_status"));
                    order.setTotalAmount(rs.getDouble("total"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving orders: " + e.getMessage());
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("manage_orders.jsp").forward(request, response);
    }

    private String getCustomerNameById(int customerId) {
        String customerName = "";
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT name FROM customers WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, customerId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        customerName = rs.getString("name");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customerName;
    }
}
