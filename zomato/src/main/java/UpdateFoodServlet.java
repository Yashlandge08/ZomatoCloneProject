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

@WebServlet("/UpdateFoodServlet")
public class UpdateFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        String foodName = request.getParameter("foodName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String query = "UPDATE food_items SET foodName = ?, category = ?, description = ?, price = ?, quantity = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, foodName);
            pstmt.setString(2, category);
            pstmt.setString(3, description);
            pstmt.setDouble(4, price);
            pstmt.setInt(5, quantity);
            pstmt.setInt(6, foodId);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Food item updated successfully!</h3>");
                response.setHeader("Refresh", "2; URL=view_foods_update.jsp");
            } else {
                out.println("<h3>Failed to update food item. Please try again.</h3>");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
