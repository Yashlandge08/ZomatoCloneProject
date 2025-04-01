<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delivery Person Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/deliveryregister.css">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-light">
    <div class="container registration-form">
        <h2 class="text-center mb-4">Delivery Person Registration</h2>
        <form action="DeliveryRegisterServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="contactNo" class="form-label">Contact Number</label>
                <input type="text" id="contactNo" name="contactNo" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="street" class="form-label">Street</label>
                <input type="text" id="street" name="street" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="city" class="form-label">City</label>
                <input type="text" id="city" name="city" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="pincode" class="form-label">Pincode</label>
                <input type="text" id="pincode" name="pincode" class="form-control" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </div>
        </form>
    </div>
</body>
</html>
