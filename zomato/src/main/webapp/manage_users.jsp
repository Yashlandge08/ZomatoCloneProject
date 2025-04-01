<%@ page import="java.util.List, com.example.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Manage Users</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<User> users = (List<User>) request.getAttribute("users"); %>
                    <% if (users != null && !users.isEmpty()) { %>
                        <% for (User user : users) { %>
                            <tr>
                                <td><%= user.getId() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getRole() %></td>
                                <td><%= user.getCreatedAt() %></td>
                                <td>
                                    <a href="UpdateUserServlet?id=<%= user.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="DeleteUserServlet?id=<%= user.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">No users found</td>
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