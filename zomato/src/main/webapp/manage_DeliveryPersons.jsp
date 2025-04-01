<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.example.deliveryPerson" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Delivery Persons</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Manage Delivery Persons</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Contact Number</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<deliveryPerson> deliverypersons = (List<deliveryPerson>) request.getAttribute("deliverypersons"); %>
                    <% if (deliverypersons != null && !deliverypersons.isEmpty()) { %>
                        <% for (deliveryPerson deliveryperson : deliverypersons) { %>
                            <tr>
                                <td><%= deliveryperson.getId() %></td>
                                <td><%= deliveryperson.getName() %></td>
                                <td><%= deliveryperson.getContactNumber() %></td>
                                <td>
                                    <a href="UpdateDeliveryPersonServlet?delivery_persons_id=<%= deliveryperson.getId() %>&name=<%= deliveryperson.getName() %>&contact_no=<%= deliveryperson.getContactNumber() %>" class="btn btn-sm btn-warning">Update</a>
                                    <a href="DeleteDeliveryPersonsServlet?delivery_persons_id=<%= deliveryperson.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="4" class="text-center text-muted">No delivery persons found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="text-center mt-3">
            <a href="admin_dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>