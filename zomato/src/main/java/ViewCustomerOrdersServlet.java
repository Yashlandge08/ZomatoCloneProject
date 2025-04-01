import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.DBConnection; // Ensure this utility exists to manage database connections
import com.example.CustomerOrder; // Ensure this POJO class exists with proper getters and setters

@WebServlet("/ViewCustomerOrdersServlet")
public class ViewCustomerOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CustomerOrder> orders = new ArrayList<>();
        String orderIdParam = request.getParameter("order_id");
        String sql;
        PreparedStatement stmt = null;

        try (Connection conn = DBConnection.getConnection()) {
            if (orderIdParam == null || orderIdParam.isEmpty()) {
                // No order_id provided: fetch all orders
                sql = "SELECT o.id AS order_id, "
                    + "customers_name AS customer_name, "
                    + "o.order_date, (o.quantity * f.price) AS total, "
                    + "'Pending' AS status "
                    + "FROM orders o "
                    + "JOIN customers c ON o.customers_id = c.id "
                    + "JOIN food_items f ON o.foodId = f.id "
                    + "JOIN restaurants r ON f.restaurant_id = r.id "
                    + "ORDER BY o.order_date DESC";
                stmt = conn.prepareStatement(sql);
            } else {
                // order_id provided: fetch specific order
                sql = "SELECT o.id AS order_id, "
                    + "customers_name AS customer_name, "
                    + "restaurants_name AS restaurant_name, "
                    + "o.order_date, (o.quantity * f.price) AS total, "
                    + "'Pending' AS status "
                    + "FROM orders o "
                    + "JOIN customers c ON o.customer_id = c.id "
                    + "JOIN food_items f ON o.foodId = f.id "
                    + "JOIN restaurants r ON f.restaurant_id = r.id "
                    + "WHERE o.id = ? "
                    + "ORDER BY o.order_date DESC";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(orderIdParam));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CustomerOrder order = new CustomerOrder();
                order.setId(rs.getInt("order_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setRestaurantName(rs.getString("restaurant_name"));
                order.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                order.setTotalAmount(rs.getBigDecimal("total_amount"));
                order.setStatus(rs.getString("delivery_status"));

                orders.add(order);
            }

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("viewrestaurant_customer_orders.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving orders");
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (Exception ignored) {
            }
        }
    }
}
