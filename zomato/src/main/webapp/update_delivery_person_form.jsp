<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Delivery Person</title>
</head>
<body>
    <h2>Update Delivery Person</h2>

    <form action="UpdateDeliveryPersonsServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        
        <label>Name:</label>
        <input type="text" name="name" value="<%= request.getParameter("name") %>" required><br>
        
        <label>Phone:</label>
        <input type="text" name="phone" value="<%= request.getParameter("phone") %>" required><br>
        
        <button type="submit">Update</button>
    </form>

    <br>
    <a href="ManageDeliveryPersonsServlet">Back to Manage Delivery Persons</a>
</body>
</html>
