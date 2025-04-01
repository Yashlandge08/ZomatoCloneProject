<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/restaurantdashboard.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow p-4">
                    <h2 class="text-center mb-4">Welcome, Restaurant!</h2>

                    <div class="list-group">
                        <a href="add_food.jsp" class="list-group-item list-group-item-action btn btn-primary mb-2">Add Food Menu</a>
                        <a href="assign_delivery_person.jsp" class="list-group-item list-group-item-action btn btn-secondary mb-2">View Orders</a>
                        <a href="LogoutServlet" class="list-group-item list-group-item-action btn btn-danger mb-2">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
