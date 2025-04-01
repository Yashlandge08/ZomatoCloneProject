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

// Database utility
import com.example.DBConnection;

// FoodItem model class
import com.example.FoodItem;

@WebServlet("/BrowseMenuServlet")
public class BrowseMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<FoodItem> menuItems = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, foodName, description, category, price FROM food_items";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        FoodItem item = new FoodItem();
                        item.setId(rs.getInt("id"));
                        item.setfoodName(rs.getString("foodName"));
                        item.setdescription(rs.getString("description"));
                        item.setcategory(rs.getString("category"));
                        item.setprice(rs.getDouble("price"));
                        menuItems.add(item);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("FoodListServlet").forward(request, response);
    }
}
