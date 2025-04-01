<%@ page import="com.example.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Update User</title>
</head>
<body>
    <h2>Update User</h2>
    <%
        User user = (User) request.getAttribute("user");
        if (user != null) {
    %>
    <form action="UpdateUserServlet" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <label>Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required><br>
        
        <label>Role:</label>
        <select name="role">
            <option value="Admin" <%= "Admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
            <option value="Restaurant" <%= "Restaurant".equals(user.getRole()) ? "selected" : "" %>>Restaurant</option>
            <option value="Delivery" <%= "Delivery".equals(user.getRole()) ? "selected" : "" %>>Delivery</option>
            <option value="Customer" <%= "Customer".equals(user.getRole()) ? "selected" : "" %>>Customer</option>
        </select><br>

        <input type="submit" value="Update">
    </form>
    <%
        } else {
            out.println("<p>User not found.</p>");
        }
    %>
</body>
</html>
