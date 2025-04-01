<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Foods</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/managefooditems.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">View and Manage Food Items</h2>

        <!-- Food Items Table -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Food ID</th>
                        <th>Food Name</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

                            String query = "SELECT * FROM food_items";
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(query);

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("foodName") %></td>
                        <td><%= rs.getString("category") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getDouble("price") %></td>
                        <td><%= rs.getInt("quantity") %></td>
                        <td>
                            <form action="DeleteFoodServlet" method="post" style="display:inline;">
                                <input type="hidden" name="foodId" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                            <form action="update_food.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="foodId" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-warning btn-sm">Update</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="text-center mt-4">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
