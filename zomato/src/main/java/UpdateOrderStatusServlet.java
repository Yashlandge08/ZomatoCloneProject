import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));  // Changed from "orders_id" to "id"
        String status = request.getParameter("delivery_status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String query = "UPDATE orders SET delivery_status = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);
            pstmt.executeUpdate();

            response.sendRedirect("ViewAssignedOrdersServlet");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

