import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/restaurant_db";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdParam = request.getParameter("orders_id");

        if (orderIdParam == null || orderIdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID is missing");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdParam);
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
                String deleteOrderItemsQuery = "DELETE FROM order_items WHERE order_id = ?";
                try (PreparedStatement ps1 = conn.prepareStatement(deleteOrderItemsQuery)) {
                    ps1.setInt(1, orderId);
                    ps1.executeUpdate();
                }

                String deleteOrderQuery = "DELETE FROM orders WHERE id = ?";
                try (PreparedStatement ps2 = conn.prepareStatement(deleteOrderQuery)) {
                    ps2.setInt(1, orderId);
                    ps2.executeUpdate();
                }
            }

            response.sendRedirect("ManageOrderServlet");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID");
        } catch (Exception e) {
            throw new ServletException("Error deleting order", e);
        }
    }
}
