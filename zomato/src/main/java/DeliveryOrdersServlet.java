

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.DBConnection;
import com.example.DeliveryOrder;

/**
 * Servlet implementation class DeliveryOrdersServlet
 */
@WebServlet("/DeliveryOrdersServlet")
public class DeliveryOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryOrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deliveryPersonId = (int) request.getSession().getAttribute("deliveryPersonId");

        List<DeliveryOrder> deliveryOrders = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT o.id, o.food_name, o.customer_name, o.address, d.delivery_status " +
                           "FROM delivery_orders d " +
                           "JOIN orders o ON d.order_id = o.id " +
                           "WHERE d.delivery_person_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, deliveryPersonId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DeliveryOrder order = new DeliveryOrder();
                order.setId(rs.getInt("id"));
                order.setFoodName(rs.getString("food_name"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setAddress(rs.getString("address"));
                order.setDeliveryStatus(rs.getString("delivery_status"));
                deliveryOrders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("deliveryOrders", deliveryOrders);
        request.getRequestDispatcher("delivery_orders.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
