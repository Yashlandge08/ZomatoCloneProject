

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import com.example.DBConnection;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE cart_items SET quantity = ? WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                for (String param : parameterMap.keySet()) {
                    if (param.startsWith("quantities[")) {
                        int cartId = Integer.parseInt(param.substring(10, param.length() - 1));
                        int quantity = Integer.parseInt(parameterMap.get(param)[0]);

                        ps.setInt(1, quantity);
                        ps.setInt(2, cartId);
                        ps.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        response.sendRedirect("CartServlet");
    }
}
