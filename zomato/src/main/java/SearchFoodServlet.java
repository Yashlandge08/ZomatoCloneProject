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

@WebServlet("/SearchFoodServlet")
public class SearchFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("search_term");
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT f.id, f.foodName, f.category, f.description, f.price, r.name AS restaurant_name "
                       + "FROM food_items f "
                       + "JOIN restaurants r ON f.restaurants_id = r.id "
                       + "WHERE f.foodName LIKE ? OR f.category LIKE ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchTerm + "%");
            pstmt.setString(2, "%" + searchTerm + "%");

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                FoodItem foodItem = new FoodItem();
                foodItem.setId(rs.getInt("id"));
                foodItem.setfoodName(rs.getString("foodName"));
                foodItem.setcategory(rs.getString("category"));
                foodItem.setdescription(rs.getString("description"));
                foodItem.setprice(rs.getDouble("price"));
                foodItem.setrestaurantName(rs.getString("restaurant_name"));
                foodItems.add(foodItem);
            }

            StringBuilder results = new StringBuilder();
            if (!foodItems.isEmpty()) {
                results.append("<table class='table table-bordered table-striped'>")
                       .append("<thead><tr><th>ID</th><th>Name</th><th>Category</th><th>Description</th><th>Price</th><th>Restaurant</th><th>Action</th></tr></thead>")
                       .append("<tbody>");
                for (FoodItem item : foodItems) {
                    results.append("<tr>")
                           .append("<td>").append(item.getId()).append("</td>")
                           .append("<td>").append(item.getfoodName()).append("</td>")
                           .append("<td>").append(item.getcategory()).append("</td>")
                           .append("<td>").append(item.getdescription()).append("</td>")
                           .append("<td>").append(item.getprice()).append("</td>")
                           .append("<td>").append(item.getrestaurantName()).append("</td>")
                           .append("<td>")
                           .append("<form action='AddToCartServlet' method='post'>")
                           .append("<input type='hidden' name='food_items_id' value='").append(item.getId()).append("'>")
                           .append("<button type='submit' class='btn btn-success btn-sm'>Add to Cart</button>")
                           .append("</form>")
                           .append("</td>")
                           .append("</tr>");
                }
                results.append("</tbody></table>");
            } else {
                results.append("<p>No food items found for the search term: ").append(searchTerm).append("</p>");
            }

            request.setAttribute("searchResults", results.toString());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("searchResults", "<p>Error occurred while searching: " + e.getMessage() + "</p>");
        }

        request.getRequestDispatcher("search_food.jsp").forward(request, response);
    }
}
