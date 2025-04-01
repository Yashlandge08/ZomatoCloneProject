

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.FoodItem;

@WebServlet("/RestaurantMenuServlet")
public class RestaurantMenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int restaurantId = Integer.parseInt(request.getParameter("restaurants_id"));
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String query = "SELECT id, foodName, description, price FROM food_items WHERE restaurants_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, restaurantId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        FoodItem food = new FoodItem();
                        food.setId(rs.getInt("id"));
                        food.setfoodName(rs.getString("foodName"));
                        food.setdescription(rs.getString("description"));
                        food.setprice(rs.getDouble("price"));
                        foodItems.add(food);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("foodItems", foodItems);
        request.getRequestDispatcher("food_list.jsp").forward(request, response);
    }
}
