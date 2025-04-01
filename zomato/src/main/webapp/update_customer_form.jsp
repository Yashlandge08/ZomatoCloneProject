<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer</title>
</head>
<body>
    <h2>Update Customer</h2>

    <form action="UpdateCustomerServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        
        <label>Name:</label>
        <input type="text" name="name" value="<%= request.getParameter("name") %>" required><br>
        
        <label>Email:</label>
        <input type="email" name="email" value="<%= request.getParameter("email") %>" required><br>
        
        <button type="submit">Update</button>
    </form>

    <br>
    <a href="ManageCustomersServlet">Back to Manage Customers</a>
</body>
</html>
