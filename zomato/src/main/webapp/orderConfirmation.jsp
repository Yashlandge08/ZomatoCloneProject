<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .message {
            margin-top: 50px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <h2>Order Confirmation</h2>
    <div class="message">
        <p>Thank you for your order!</p>
        <p>Your total amount is: $<%= request.getAttribute("totalAmount") %></p>
        <a href="CartListServlet">Continue Shopping</a>
    </div>
</body>
</html>
