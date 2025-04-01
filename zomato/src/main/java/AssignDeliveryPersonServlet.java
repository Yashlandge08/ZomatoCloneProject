import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AssignDeliveryPersonServlet")
public class AssignDeliveryPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String orderIdStr = request.getParameter("order_id");
        String deliveryPersonIdStr = request.getParameter("delivery_persons_id");

        if (orderIdStr == null || deliveryPersonIdStr == null || orderIdStr.isEmpty() || deliveryPersonIdStr.isEmpty()) {
            out.println("<h3>Error: Missing order ID or delivery person ID.</h3>");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdStr);
            int deliveryPersonId = Integer.parseInt(deliveryPersonIdStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String query = "UPDATE orders SET delivery_persons_id = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, deliveryPersonId);
            pstmt.setInt(2, orderId);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Delivery person assigned successfully!</h3>");
                response.setHeader("Refresh", "2; URL=assign_delivery_person.jsp");
            } else {
                out.println("<h3>Failed to assign delivery person. Please try again.</h3>");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
