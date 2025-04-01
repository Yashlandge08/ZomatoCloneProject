<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Restaurants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/viewrestaurant.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Registered Restaurants</h2>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Restaurant ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Address</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try (Connection conn = DBConnection.getConnection()) {
                            String sql = "SELECT id, name, email, contact_no, address FROM restaurants";
                            PreparedStatement stmt = conn.prepareStatement(sql);
                            ResultSet rs = stmt.executeQuery();

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String contactNo = rs.getString("contact_no");
                                String address = rs.getString("address");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= email %></td>
                        <td><%= contactNo %></td>
                        <td><%= address %></td>
                        <td>
                            <form action="DeleteRestaurantServlet" method="post" style="display:inline;">
                                <input type="hidden" name="restaurant_id" value="<%= id %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>

        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success" role="alert">
                Restaurant deleted successfully.
            </div>
        <% } else if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                Failed to delete the restaurant. Please try again.
            </div>
        <% } %>

        <div class="text-center mt-4">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
