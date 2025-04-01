<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/editrestaurant.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Edit Restaurant</h2>

        <!-- Edit Restaurant Form -->
        <form action="EditRestaurantServlet" method="post">
            <input type="hidden" name="id" value="<%= ((Restaurant) request.getAttribute("restaurant")).getId() %>">

            <div class="form-group mb-3">
                <label for="name" class="form-label">Restaurant Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= ((Restaurant) request.getAttribute("restaurant")).getName() %>" required>
            </div>

            <div class="form-group mb-3">
                <label for="street" class="form-label">Street:</label>
                <input type="text" id="street" name="street" class="form-control" value="<%= ((Restaurant) request.getAttribute("restaurant")).getStreet() %>" required>
            </div>

            <div class="form-group mb-3">
                <label for="city" class="form-label">City:</label>
                <input type="text" id="city" name="city" class="form-control" value="<%= ((Restaurant) request.getAttribute("restaurant")).getCity() %>" required>
            </div>

            <div class="form-group mb-3">
                <label for="pincode" class="form-label">Pincode:</label>
                <input type="text" id="pincode" name="pincode" class="form-control" value="<%= ((Restaurant) request.getAttribute("restaurant")).getPincode() %>" required>
            </div>

            <div class="form-group mb-3">
                <label for="contact_no" class="form-label">Contact Number:</label>
                <input type="text" id="contact_no" name="contact_no" class="form-control" value="<%= ((Restaurant) request.getAttribute("restaurant")).getContactNo() %>" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update</button>
        </form>

        <form action="ManageRestaurantsServlet" method="get" class="mt-3">
            <button type="submit" class="btn btn-secondary btn-block">Back</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
