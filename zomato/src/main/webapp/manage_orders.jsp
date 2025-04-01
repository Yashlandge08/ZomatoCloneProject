<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.example.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Manage Orders</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Quantity</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
                    <% if (orders != null && !orders.isEmpty()) { %>
                        <% for (Order order : orders) { %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><%= order.getCustomerName() %></td>
                                <td><%= order.getQuantity() %></td>
                                <td><%= order.getOrderDate() %></td>
                                <td>$<%= order.getTotalAmount() %></td>
                                <td>
                                    <a href="DeleteOrderServlet?orders_id=<%= order.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">No orders found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
                <a href="admin_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>