

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.DBConnection;

/**
 * Servlet implementation class UpdateDeliveryStatusServlet
 */
@WebServlet("/UpdateDeliveryStatusServlet")
public class UpdateDeliveryStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDeliveryStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int deliveryOrderId = Integer.parseInt(request.getParameter("deliveryOrderId"));
	    String newStatus = request.getParameter("status");

	    try (Connection conn = DBConnection.getConnection()) {
	        String query = "UPDATE delivery_orders SET delivery_status = ? WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setString(1, newStatus);
	        ps.setInt(2, deliveryOrderId);

	        int rowsUpdated = ps.executeUpdate();
	        if (rowsUpdated > 0) {
	            request.setAttribute("message", "Delivery status updated successfully!");
	        } else {
	            request.setAttribute("message", "Failed to update delivery status.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    response.sendRedirect("DeliveryOrdersServlet");
	}


}
