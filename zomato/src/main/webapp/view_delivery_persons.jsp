<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Delivery Persons</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/Viewmanage.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">View and Manage Delivery Persons</h2>

        <!-- Delivery Persons Table -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact Number</th>
                        <th>Street</th>
                        <th>City</th>
                        <th>Pincode</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Database connection
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/restaurant_db", "root", "123456");

                            // Query to fetch delivery persons
                            String query = "SELECT * FROM delivery_persons";
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(query);

                            // Loop through results and display rows
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("contact_no") %></td>
                        <td><%= rs.getString("street") %></td>
                        <td><%= rs.getString("city") %></td>
                        <td><%= rs.getString("pincode") %></td>
                        <td>
                            <form action="DeleteDeliveryPersonServlet" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this delivery person?')">Delete</button>
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

        <!-- Back Button -->
        <div class="text-center">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
