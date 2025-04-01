<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Checkout</title>
</head>
<body>
    <h1>Payment</h1>
    <form action="PaymentServlet" method="POST">
        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" required><br>
        <label for="expiryDate">Expiry Date:</label>
        <input type="text" id="expiryDate" name="expiryDate" required><br>
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" required><br>
        <button type="submit">Pay</button>
    </form>
</body>
</html>
