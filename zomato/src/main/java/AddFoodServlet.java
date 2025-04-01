import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.example.DBConnection;
import com.example.FoodItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String Name = request.getParameter("foodName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurants_id"));
        int categoriesId = Integer.parseInt(request.getParameter("categories_id"));
        FoodItem foodItem = new FoodItem(); 
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String query = "INSERT INTO food_items (foodName, category, description, price, quantity,restaurants_id,categories_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, Name);
            pstmt.setString(2, category);
            pstmt.setString(3, description);
            pstmt.setDouble(4, price);
            pstmt.setInt(5, quantity);
            pstmt.setInt(6, restaurantId);
            pstmt.setInt(7, categoriesId);
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Food item added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add food item. Please try again.</h3>");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}