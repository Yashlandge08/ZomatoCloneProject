<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList, java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Delivery Person</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/AssignDeliveryPerson.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Assign Delivery Person</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>Quantity</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                        <th>Delivery Person</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

                            String ordersQuery = "SELECT id, quantity, order_date, total FROM orders WHERE delivery_persons_id IS NULL";
                            PreparedStatement ordersStmt = con.prepareStatement(ordersQuery);
                            ResultSet ordersRs = ordersStmt.executeQuery();

                            String deliveryPersonQuery = "SELECT id, name FROM delivery_persons WHERE is_active = 1";
                            PreparedStatement deliveryPersonStmt = con.prepareStatement(deliveryPersonQuery);
                            ResultSet deliveryPersonsRs = deliveryPersonStmt.executeQuery();

                            List<String> deliveryPersons = new ArrayList<>();
                            while (deliveryPersonsRs.next()) {
                                deliveryPersons.add(deliveryPersonsRs.getInt("id") + " - " + deliveryPersonsRs.getString("name"));
                            }

                            while (ordersRs.next()) {
                    %>
                    <tr>
                        <td><%= ordersRs.getInt("id") %></td>
                        <td><%= ordersRs.getInt("quantity") %></td>
                        <td><%= ordersRs.getTimestamp("order_date") %></td>
                        <td><%= ordersRs.getDouble("total") %></td>
                        <td>
                            <form action="AssignDeliveryPersonServlet" method="post">
                                <input type="hidden" name="order_id" value="<%= ordersRs.getInt("id") %>">
                                <select name="delivery_persons_id" class="form-select" required>
                                    <option value="">Select Delivery Person</option>
                                    <%
                                        for (String deliveryPerson : deliveryPersons) {
                                    %>
                                        <option value="<%= deliveryPerson.split(" - ")[0] %>"><%= deliveryPerson %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <button type="submit" class="btn btn-primary mt-2">Assign</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                            ordersRs.close();
                            ordersStmt.close();
                            deliveryPersonsRs.close();
                            deliveryPersonStmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>