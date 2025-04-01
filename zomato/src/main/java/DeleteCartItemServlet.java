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
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteCartItemServlet")
public class DeleteCartItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String cartItemIdParam = request.getParameter("cart_items_id");
        if (cartItemIdParam == null || cartItemIdParam.isEmpty()) {
            out.println("<h3>Error: cart_items_id is missing or invalid.</h3>");
            return;
        }

        int cartItemId;
        try {
            cartItemId = Integer.parseInt(cartItemIdParam);
        } catch (NumberFormatException e) {
            out.println("<h3>Error: Invalid cart_items_id format.</h3>");
            return;
        }

        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String query = "DELETE FROM cart_items WHERE id = ? AND customers_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, cartItemId);
            pstmt.setInt(2, customerId);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h3>Item deleted successfully from the cart!</h3>");
            } else {
                out.println("<h3>Error: Unable to delete the item. Please check if it exists.</h3>");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
