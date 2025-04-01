<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/admindashboard.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow p-4">
                    <h2 class="text-center mb-4">Welcome, Admin!</h2>

                    <div class="list-group">
                     <a href="ManageUsersServlet" class="list-group-item list-group-item-action btn btn-primary mb-3">View & Manage Users</a>
                        <a href="ManageOrderServlet" class="list-group-item list-group-item-action btn btn-primary mb-3">View & Manage Orders</a>
                        <a href="ManageRestaurantsServlet" class="list-group-item list-group-item-action btn btn-primary mb-3">Manage Restaurants</a>
                        <a href="ManageCustomersServlet" class="list-group-item list-group-item-action btn btn-primary mb-3">Manage Customers</a>
                        <a href="ManageDeliveryPersonsServlet" class="list-group-item list-group-item-action btn btn-primary mb-3">Manage Delivery Persons</a>
                        <a href="LogoutServlet" class="list-group-item list-group-item-action btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
