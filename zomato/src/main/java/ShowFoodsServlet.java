

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.DBConnection;
import com.example.FoodItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ShowFoodsServlet")
public class ShowFoodsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT f.id, f.foodName, f.category, f.price, r.name AS restaurant_name "
                       + "FROM food_items f "
                       + "JOIN restaurants r ON f.restaurants_id = r.id";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                FoodItem foodItem = new FoodItem();
                foodItem.setId(rs.getInt("id"));
                foodItem.setfoodName(rs.getString("foodName"));
                foodItem.setcategory(rs.getString("category"));
                foodItem.setprice(rs.getDouble("price"));
                foodItem.setrestaurantName(rs.getString("restaurant_name"));
                foodItems.add(foodItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("foodItems", foodItems);

        request.getRequestDispatcher("food_list.jsp").forward(request, response);
    }
}
