import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeliveryRegisterServlet")
public class DeliveryRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    private static List<String> DeliveryPersons = new ArrayList<>();
    
    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contact_no");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection con = null;
        PreparedStatement pscustomers = null;
        PreparedStatement psUsers = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String usersQuery = "INSERT INTO users (email, password, role) VALUES (?, ?, ?)";
            psUsers = con.prepareStatement(usersQuery);
            psUsers.setString(1, email);
            psUsers.setString(2, password); 
            psUsers.setString(3, "Delivery");
            int rowsInsertedInUsers = psUsers.executeUpdate();

            if (rowsInsertedInUsers > 0) {
                String customersQuery = "INSERT INTO delivery_persons (name, email, password, contact_no, street, city, pincode) VALUES (?, ?, ?, ?, ?, ?, ?)";
                pscustomers = con.prepareStatement(customersQuery);
                pscustomers.setString(1, name);
                pscustomers.setString(2, email);
                pscustomers.setString(3, password);
                pscustomers.setString(4, contactNo);
                pscustomers.setString(5, street);
                pscustomers.setString(6, city);
                pscustomers.setString(7, pincode);
                int rowsInsertedIncustomers = pscustomers.executeUpdate();

                if (rowsInsertedIncustomers > 0) {
                	DeliveryPersons.add(name);
                    out.println("<h2>delivery_persons Registered Successfully!</h2>");
                    out.println("<a href='login.jsp'>Go Back</a>");
                } else {
                    out.println("<h2>Error Registering Customer</h2>");
                }
            } else {
                out.println("<h2>Error Registering User</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (pscustomers != null) pscustomers.close();
                if (psUsers != null) psUsers.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
