import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;

//import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/CategoriesController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, 
    maxFileSize = 1024 * 1024 * 10,      
    maxRequestSize = 1024 * 1024 * 50    
)
public class CategoriesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/restaurant_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";

    public CategoriesController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            if ("addProduct".equalsIgnoreCase(action)) {
                addProduct(request, connection);
                response.sendRedirect("view_categories.jsp?status=success&action=add");
            } else if ("deleteProduct".equalsIgnoreCase(action)) {
                deleteProduct(request, connection);
                response.sendRedirect("view_categories.jsp.jsp?status=success&action=delete");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action specified.");
            }
        } catch (Exception e) {
            log("Error occurred during operation: ", e);
            response.sendRedirect("view_categories.jsp.jsp?status=error&message=" + e.getMessage());
        }
    }

    private void addProduct(HttpServletRequest request, Connection connection) throws Exception {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
       



    
        String query = "INSERT INTO categories (id,name,description) VALUES ( ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
           
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, description);
     

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Failed to add product. No rows affected.");
            }
        }
    }

    private void deleteProduct(HttpServletRequest request, Connection connection) throws Exception {
        String id = request.getParameter("categories_id");

        String query = "DELETE FROM categories WHERE categories_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Failed to delete product. Product ID not found.");
            }
        }
    }
}
