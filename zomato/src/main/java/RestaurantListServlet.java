

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Restaurant;

@WebServlet("/RestaurantListServlet")
public class RestaurantListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Restaurant> restaurants = new ArrayList<>();

        
        
        
        
        
        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String query = "SELECT id, name, email, contact_no, street, city, pincode FROM restaurants";
            try (PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Restaurant restaurant = new Restaurant();
                    restaurant.setId(rs.getInt("id"));
                    restaurant.setName(rs.getString("name"));
                    restaurant.setEmail(rs.getString("email"));
                    restaurant.setContactNo(rs.getString("contact_no"));
                    restaurant.setStreet(rs.getString("street"));
                    restaurant.setCity(rs.getString("city"));
                    restaurant.setPincode(rs.getString("pincode"));
                    restaurants.add(restaurant);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("restaurants", restaurants);
        request.getRequestDispatcher("restaurants.jsp").forward(request, response);
    }
}
