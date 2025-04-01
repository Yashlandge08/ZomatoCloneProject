import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.DBConnection;

@WebServlet("/ViewCategoriesServlet")
public class ViewCategoriesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> categories = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("Database connection established.");

            String sql = "SELECT name FROM categories";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                categories.add(rs.getString("name"));
            }
            System.out.println("Fetched categories: " + categories);

            request.setAttribute("categories", categories);

            request.getRequestDispatcher("view_categories.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to retrieve categories. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
