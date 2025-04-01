<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Restaurant Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/register.css">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-light">
    <div class="container registration-form">
        <h2 class="text-center mb-4">Register Your Restaurant</h2>
        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email ID:</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Contact No:</label>
                <input type="text" name="contactNo" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Street:</label>
                <input type="text" name="street" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">City:</label>
                <input type="text" name="city" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Pincode:</label>
                <input type="text" name="pincode" class="form-control" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100">Register Restaurant</button>
            </div>
        </form>
    </div>
</body>
</html>
