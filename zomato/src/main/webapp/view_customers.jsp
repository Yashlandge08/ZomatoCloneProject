<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/viewcustomer.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Registered Customers</h2>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                       
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Registered Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                        if (customers != null && !customers.isEmpty()) {
                            for (Customer customer : customers) {
                    %>
                    <tr>
                        <td><%= customer.getId() %></td>
                       
                        <td><%= customer.getName() %></td>
                        <td><%= customer.getEmail() %></td>
                        <td><%= customer.getPhone() %></td>
                        <td><%= customer.getRegisteredDate() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">No customers found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="text-center">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
