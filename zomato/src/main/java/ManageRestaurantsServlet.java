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
import com.example.Restaurant;

@WebServlet("/ManageRestaurantsServlet")
public class ManageRestaurantsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || !"Admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Restaurant> restaurants = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, name, street, city, pincode, contact_no FROM restaurants";
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Restaurant restaurant = new Restaurant();
                    restaurant.setId(rs.getInt("id"));
                    restaurant.setName(rs.getString("name"));
                    restaurant.setStreet(rs.getString("street"));
                    restaurant.setCity(rs.getString("city"));
                    restaurant.setPincode(rs.getString("pincode"));
                    restaurant.setContactNo(rs.getString("contact_no"));
                    restaurants.add(restaurant);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving restaurants: " + e.getMessage());
        }

        request.setAttribute("restaurants", restaurants);
        request.getRequestDispatcher("admin_manage_restaurants.jsp").forward(request, response);
    }
}
