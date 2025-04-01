

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDeliveryPersonsServlet")
public class UpdateDeliveryPersonsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String sql = "UPDATE delivery_persons SET name = ?, phone = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setInt(3, id);

            stmt.executeUpdate();
            stmt.close();
            conn.close();

            response.sendRedirect("ManageDeliveryPersonsServlet"); 
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating delivery person.");
        }
    }
}
