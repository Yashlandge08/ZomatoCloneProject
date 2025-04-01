<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome, Delivery Partner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="Deliverydashboard.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Welcome, Delivery Partner!</h2>

        <div class="list-group">
            <a href="ViewAssignedOrdersServlet" class="list-group-item list-group-item-action list-group-item-primary">
                View Assigned Orders
            </a>
            <a href="LogoutServlet" class="list-group-item list-group-item-action list-group-item-danger">
                Logout
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
