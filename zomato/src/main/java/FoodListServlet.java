import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.FoodItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FoodListServlet")
public class FoodListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<FoodItem> foodItems = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

            String query = "SELECT id, foodName, description, category, price FROM food_items";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                FoodItem food = new FoodItem();
                food.setId(rs.getInt("id"));
                food.setfoodName(rs.getString("foodName"));
                food.setdescription(rs.getString("description"));
                food.setcategory(rs.getString("category"));
                food.setprice(rs.getDouble("price"));
                foodItems.add(food);
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("foodItems", foodItems);
        request.getRequestDispatcher("food_list.jsp").forward(request, response);
    }
}
