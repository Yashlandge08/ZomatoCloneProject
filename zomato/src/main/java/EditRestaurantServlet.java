import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.DBConnection;
import com.example.Restaurant;

@WebServlet("/EditRestaurantServlet")
public class EditRestaurantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int restaurantId = Integer.parseInt(request.getParameter("restaurants_id"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM restaurants WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, restaurantId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Restaurant restaurant = new Restaurant();
                        restaurant.setId(rs.getInt("id"));
                        restaurant.setName(rs.getString("name"));
                        restaurant.setStreet(rs.getString("street"));
                        restaurant.setCity(rs.getString("city"));
                        restaurant.setPincode(rs.getString("pincode"));
                        restaurant.setContactNo(rs.getString("contact_no"));
                        request.setAttribute("restaurant", restaurant);
                        request.getRequestDispatcher("edit_restaurant.jsp").forward(request, response);
                        return;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ManageRestaurantsServlet"); 
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String contactno = request.getParameter("contact_no");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE restaurants SET name = ?, street = ?, city = ?, pincode = ?,contact_no = ? WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, street);
                ps.setString(3, city);
                ps.setString(4, pincode);
                ps.setString(5, contactno);
                ps.setInt(6, id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ManageRestaurantsServlet");
    }
}
