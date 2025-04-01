import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (email == null || password == null || role == null || email.isEmpty() || password.isEmpty() || role.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "";
            
            if ("Delivery".equalsIgnoreCase(role)) {
                sql = "SELECT * FROM delivery_persons WHERE email = ? AND password = ?";
            } else {
                sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
            }

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                
                if (!"Delivery".equalsIgnoreCase(role)) {
                    stmt.setString(3, role); // Add role parameter only for users table
                }

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        HttpSession session = request.getSession();

                        if ("Delivery".equalsIgnoreCase(role)) {
                            session.setAttribute("delivery_persons_id", rs.getInt("id"));
                            session.setAttribute("email", rs.getString("email"));
                            session.setAttribute("role", role);
                        } else {
                            session.setAttribute("userId", rs.getInt("id"));
                            session.setAttribute("email", rs.getString("email"));
                            session.setAttribute("role", rs.getString("role"));

                            if ("Customer".equalsIgnoreCase(role)) {
                                session.setAttribute("customers_id", rs.getInt("id"));
                            }
                        }

                        switch (role) {
                            case "Admin":
                                response.sendRedirect("admin_dashboard.jsp");
                                break;
                            case "Restaurant":
                                response.sendRedirect("restaurant_dashboard.jsp");
                                break;
                            case "Delivery":
                                response.sendRedirect("delivery_dashboard.jsp");
                                break;
                            case "Customer":
                                response.sendRedirect("customer_dashboard.jsp");
                                break;
                            default:
                                throw new IllegalStateException("Unexpected role: " + role);
                        }
                    } else {
                        request.setAttribute("errorMessage", "Invalid email, password, or role.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}
