<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.example.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Manage Customers</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Customer> customers = (List<Customer>) request.getAttribute("customers"); %>
                    <% if (customers != null && !customers.isEmpty()) { %>
                        <% for (Customer customer : customers) { %>
                            <tr>
                                <td><%= customer.getId() %></td>
                                <td><%= customer.getName() %></td>
                                <td><%= customer.getEmail() %></td>
                                <td>
                                    <a href="update_customer_form.jsp?id=<%= customer.getId() %>&name=<%= customer.getName() %>&email=<%= customer.getEmail() %>" class="btn btn-sm btn-warning">Update</a>
                                    <a href="DeleteCustomerServlet?id=<%= customer.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="4" class="text-center text-muted">No customers found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="text-center mt-3">
            <a href="admin_dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
