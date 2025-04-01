import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.CartItem;
// Database utility
import com.example.DBConnection;
import com.example.FoodItem;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("customers_id");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<CartItem> cartItems = new ArrayList<>();
        try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "123456")) {
            String query = "SELECT ci.id, ci.food_id, ci.quantity, f.name, f.price " +
                           "FROM cart_items ci " +
                           "JOIN food_items f ON ci.food_id = f.id " +
                           "WHERE ci.user_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        CartItem cartItem = new CartItem();
                        cartItem.setcartId(rs.getInt("id"));
                        cartItem.setfoodId(rs.getInt("food_id"));
                        cartItem.setquantity(rs.getInt("quantity"));
                        cartItem.setfoodName(rs.getString("foodName"));
                        cartItem.setprice(rs.getDouble("price"));
                        cartItem.setprice(rs.getDouble("total"));

                        cartItems.add(cartItem);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching cart items.");
        }

        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
