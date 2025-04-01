<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");
        statement = connection.createStatement();
        resultSet = statement.executeQuery("SELECT * FROM categories");
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Failed to connect to the database or execute the query.</div>");
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/viewcategory.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h4 class="text-center mb-4">Food Item Categories</h4>

        <!-- Category Table -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Category Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (resultSet != null) {
                            boolean hasRows = false;
                            while (resultSet.next()) {
                                hasRows = true;
                    %>
                    <tr>
                        <td><%= resultSet.getString("id") %></td>
                        <td><%= resultSet.getString("name") %></td>
                        <td>
                            <!-- Delete Form -->
                            <form action="CategoriesController" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= resultSet.getString("id") %>">
                                <button type="submit" name="action" value="deleteProduct" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                            <!-- Edit Form -->
                            <form action="EditCategoryServlet" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= resultSet.getString("id") %>">
                                <button type="submit" class="btn btn-warning btn-sm ms-2">Edit</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                            if (!hasRows) {
                    %>
                    <tr>
                        <td colspan="3" class="text-center">No Food Items found in the database.</td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Add New Category Button -->
        <div class="text-center">
            <a href="AddCategoryServlet" class="btn btn-success">Add New Category</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
