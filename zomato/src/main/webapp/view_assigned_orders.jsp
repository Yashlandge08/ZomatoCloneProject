<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.example.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5">
    <h2 class="text-center mb-4">Assigned Orders</h2>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Quantity</th>
                    <th>Order Date</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Update Status</th>
                </tr>
            </thead>
            <tbody>
                <% List<Order> orders = (List<Order>) request.getAttribute("orders");
                   if (orders != null && !orders.isEmpty()) {
                       for (Order order : orders) { %>
                        <tr>
                            <td><%= order.getId() %></td>
                            <td><%= order.getQuantity() %></td>
                            <td><%= order.getOrderDate() %></td>
                            <td><%= order.getTotalAmount() %></td>
                            <td><%= order.getStatus() %></td>
                            <td>
                                <form action="UpdateOrderStatusServlet" method="post">
                                    <input type="hidden" name="id" value="<%= order.getId() %>">
                                    <select name="delivery_status" class="form-select" required>
                                        <option value="Pending" <%= "Pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                                        <option value="On the Way" <%= "On the Way".equals(order.getStatus()) ? "selected" : "" %>>On the Way</option>
                                        <option value="Delivered" <%= "Delivered".equals(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary mt-2">Update</button>
                                </form>
                            </td>
                        </tr>
                <%   }
                   } else { %>
                    <tr><td colspan="6" class="text-center">No assigned orders found.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <a href="delivery_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
