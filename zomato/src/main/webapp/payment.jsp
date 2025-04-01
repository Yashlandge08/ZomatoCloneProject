<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="CheckoutServlet" method="post">
    <h2>Payment Page</h2>
    <label>Card Number:</label>
    <input type="text" name="card_number" required><br><br>
    <label>CVV:</label>
    <input type="text" name="cvv" required><br><br>
    <button type="submit">Pay</button>
</form>
	
</body>
</html>