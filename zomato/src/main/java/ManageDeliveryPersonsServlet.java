

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.deliveryPerson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageDeliveryPersonsServlet")
public class ManageDeliveryPersonsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<deliveryPerson> deliverypersons = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String sql = "SELECT id, name, contact_no FROM delivery_persons";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	deliveryPerson deliveryperson = new deliveryPerson();
            	deliveryperson.setId(rs.getInt("id"));
            	deliveryperson.setName(rs.getString("name"));
            	deliveryperson.setContactNumber(rs.getString("contact_no"));
            	deliverypersons.add(deliveryperson);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("deliverypersons", deliverypersons);
        request.getRequestDispatcher("manage_DeliveryPersons.jsp").forward(request, response);
    }
}

       