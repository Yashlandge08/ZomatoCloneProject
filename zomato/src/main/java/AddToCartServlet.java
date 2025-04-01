import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int foodId = Integer.parseInt(request.getParameter("food_items_id"));
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customers_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String checkQuery = "SELECT quantity FROM cart_items WHERE customers_id = ? AND foodId = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setInt(1, customerId);
            checkStmt.setInt(2, foodId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");
                String updateQuery = "UPDATE cart_items SET quantity = ? WHERE customers_id = ? AND foodId = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setInt(1, currentQuantity + 1);
                updateStmt.setInt(2, customerId);
                updateStmt.setInt(3, foodId);
                updateStmt.executeUpdate();
            } else {
                String insertQuery = "INSERT INTO cart_items (customers_id, foodId, quantity) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setInt(1, customerId);
                insertStmt.setInt(2, foodId);
                insertStmt.setInt(3, 1);
                insertStmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("CartListServlet");
    }
}
