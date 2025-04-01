<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customer Orders</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/viewcustomerorders.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Customer Orders</h2>

        <div class="mb-4">
            <form action="ViewCustomerOrdersServlet" method="get" class="d-flex justify-content-center">
                <label for="order_id" class="me-2">Search by Order ID:</label>
                <input type="text" name="order_id" id="order_id" class="form-control me-2" placeholder="Enter Order ID">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Customer Contact</th>
                        <th>Food Item</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Order Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

                            String query = "SELECT o.id AS order_id, c.name AS customer_name, c.contact_no AS customer_contact, "
                                    + "f.foodName AS food_name, o.quantity, (o.quantity * f.price) AS total_price, o.order_date "
                                    + "FROM orders o "
                                    + "JOIN customers c ON o.customers_id = c.id "
                                    + "JOIN food_items f ON o.food_id = f.id "
                                    + "WHERE f.restaurants_id = ?";
                            
                            PreparedStatement pstmt = con.prepareStatement(query);
                            int restaurantId = 1; 
                            pstmt.setInt(1, restaurantId);

                            ResultSet rs = pstmt.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("order_id") %></td>
                        <td><%= rs.getString("customer_name") %></td>
                        <td><%= rs.getString("customer_contact") %></td>
                        <td><%= rs.getString("food_name") %></td>
                        <td><%= rs.getInt("quantity") %></td>
                        <td><%= rs.getDouble("total_price") %></td>
                        <td><%= rs.getDate("order_date") %></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            pstmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
