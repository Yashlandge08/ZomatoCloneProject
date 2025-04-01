import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.DBConnection;

@WebServlet("/DeleteRestaurantServlet")
public class DeleteRestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int restaurantId = Integer.parseInt(request.getParameter("restaurants_id"));

        try (Connection conn = DBConnection.getConnection()) {
            String deleteFoodItemsQuery = "DELETE FROM food_items WHERE restaurants_id = ?";
            try (PreparedStatement ps1 = conn.prepareStatement(deleteFoodItemsQuery)) {
                ps1.setInt(1, restaurantId);
                ps1.executeUpdate();
            }

            String deleteRestaurantQuery = "DELETE FROM restaurants WHERE id = ?";
            try (PreparedStatement ps2 = conn.prepareStatement(deleteRestaurantQuery)) {
                ps2.setInt(1, restaurantId);
                ps2.executeUpdate();
            }

            response.sendRedirect("ManageRestaurantsServlet?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ManageRestaurantsServlet?error=1");
        }
    }
}
