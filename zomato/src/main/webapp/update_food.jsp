<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Food Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/updatefood.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Update Food Item</h2>

        <%
            int foodId = Integer.parseInt(request.getParameter("id"));
            String foodName = "", category = "", description = "";
            double price = 0.0;
            int quantity = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

                String query = "SELECT * FROM food_items WHERE id = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, foodId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    foodName = rs.getString("foodName");
                    category = rs.getString("category");
                    description = rs.getString("description");
                    price = rs.getDouble("price");
                    quantity = rs.getInt("quantity");
                }

                rs.close();
                pstmt.close();
                con.close();
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>

        <!-- Update Food Form -->
        <form action="UpdateFoodServlet" method="post">
            <input type="hidden" name="foodId" value="<%= foodId %>">
            
            <div class="mb-3">
                <label for="foodName" class="form-label">Food Name</label>
                <input type="text" name="foodName" class="form-control" value="<%= foodName %>" required>
            </div>

            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" name="category" class="form-control" value="<%= category %>" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea name="description" class="form-control" required><%= description %></textarea>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" name="price" class="form-control" step="0.01" value="<%= price %>" required>
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" name="quantity" class="form-control" value="<%= quantity %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Update Food</button>
        </form>

        <br>
        <a href="ManageFoodItemsServlet" class="btn btn-secondary">Back to Food List</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
