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
import com.example.deliveryPerson;

@WebServlet("/ViewDeliveryPersonsServlet")
public class ViewDeliveryPersonsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<deliveryPerson> deliveryPersons = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT dp.id AS delivery_person_id, " +
                         "CONCAT(dp.first_name, ' ', dp.last_name) AS delivery_person_name, " +
                         "dp.contact_no AS delivery_person_contact, " +
                         "r.id AS restaurant_id, " +
                         "CONCAT(r.first_name, ' ', r.last_name) AS restaurant_name " +
                         "FROM delivery_persons dp " +
                         "JOIN restaurants r ON dp.restaurant_id = r.id " +
                         "LIMIT 0, 1000";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                deliveryPerson dp = new deliveryPerson();
                dp.setId(rs.getInt("delivery_person_id")); 
                dp.setName(rs.getString("delivery_person_name")); 
                dp.setContactNumber(rs.getString("delivery_person_contact")); 
                dp.setRestaurantId(rs.getInt("restaurant_id")); 
                dp.setRestaurantName(rs.getString("restaurant_name")); 

                deliveryPersons.add(dp); 
            }

            request.setAttribute("deliveryPersons", deliveryPersons);

            request.getRequestDispatcher("view_delivery_persons.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving delivery persons");
        }
    }
}
