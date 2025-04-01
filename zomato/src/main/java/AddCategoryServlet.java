import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, description);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("success.jsp"); 
            } else {
                response.sendRedirect("error.jsp"); 
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
        }
    }
}
