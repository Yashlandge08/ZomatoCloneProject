import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.DBConnection;

@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryName = request.getParameter("name");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM categories WHERE name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoryName);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("ViewCategoriesServlet");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Failed to delete category");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting category");
        }
    }
}
