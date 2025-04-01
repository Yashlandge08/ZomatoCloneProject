<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Food</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/addfood.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow p-4">
                    <h2 class="text-center mb-4">Add Food</h2>

                    <form action="AddFoodServlet" method="post">
                        <div class="mb-3">
                            <label for="foodName" class="form-label">Food Name:</label>
                            <input type="text" id="foodName" name="foodName" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="category" class="form-label">Category:</label>
                            <select id="category" name="category" class="form-select" required>
                                <%
                                    try (Connection conn = DBConnection.getConnection()) {
                                        String sql = "SELECT id, name FROM categories";
                                        PreparedStatement stmt = conn.prepareStatement(sql);
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("name") + "</option>");
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="restaurants_id" class="form-label">Restaurant ID:</label>
                            <select id="restaurants_id" name="restaurants_id" class="form-select" required>
                                <%
                                    try (Connection conn = DBConnection.getConnection()) {
                                        String sql = "SELECT id, name FROM restaurants";
                                        PreparedStatement stmt = conn.prepareStatement(sql);
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("name") + "</option>");
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="price" class="form-label">Price:</label>
                            <input type="number" id="price" name="price" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity:</label>
                            <input type="number" id="quantity" name="quantity" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description:</label>
                            <textarea id="description" name="description" class="form-control"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="categories_id" class="form-label">Categories ID:</label>
                            <input type="number" id="categories_id" name="categories_id" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Add Food</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
