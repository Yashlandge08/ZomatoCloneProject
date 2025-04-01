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
import com.example.FoodItem;

@WebServlet("/ViewFoodsServlet")
public class ViewFoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT f.id AS food_id, " +
                         "f.foodName AS foodName, " +
                         "f.price AS food_price, " +
                         "f.description AS food_description, " +
                         "r.id AS restaurant_id, " +
                         "CONCAT(r.first_name, ' ', r.last_name) AS restaurant_name " +
                         "FROM food_items f " +
                         "JOIN restaurants r ON f.restaurant_id = r.id";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                FoodItem food = new FoodItem();
                food.setId(rs.getInt("food_id"));
                food.setfoodName(rs.getString("foodName"));
                food.setprice(rs.getDouble("food_price"));
                food.setdescription(rs.getString("food_description"));
                food.setrestaurantId(rs.getInt("restaurant_id"));
                food.setrestaurantName(rs.getString("restaurant_name"));

                foodItems.add(food);
            }

            request.setAttribute("foodItems", foodItems);
            request.getRequestDispatcher("view_foods.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving food items");
        }
    }
}
