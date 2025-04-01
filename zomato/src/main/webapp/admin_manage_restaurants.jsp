<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Restaurants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/managerestaurant.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Admin - Manage Restaurants</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        <% } %>

        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Street</th>
                        <th>City</th>
                        <th>Pincode</th>
                        <th>Contact</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants"); %>
                    <% if (restaurants != null) { %>
                        <% for (Restaurant restaurant : restaurants) { %>
                            <tr>
                                <td><%= restaurant.getId() %></td>
                                <td><%= restaurant.getName() %></td>
                                <td><%= restaurant.getStreet() %></td>
                                <td><%= restaurant.getCity() %></td>
                                <td><%= restaurant.getPincode() %></td>
                                <td><%= restaurant.getContactNo() %></td>
                                <td>
                                    <a href="EditRestaurantServlet?restaurants_id=<%= restaurant.getId() %>" class="btn btn-warning btn-sm">Edit</a> | 
                                    <a href="DeleteRestaurantServlet?restaurants_id=<%= restaurant.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-between">
            <a href="add_restaurant.jsp" class="btn btn-success">Add New Restaurant</a>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
