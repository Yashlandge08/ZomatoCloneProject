<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Delivery Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/udatedeliverystatus1.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Update Delivery Status</h2>
        
        <!-- Table of Orders -->
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Food Name</th>
                    <th>Customer Name</th>
                    <th>Delivery Address</th>
                    <th>Delivery Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${deliveryOrders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.foodName}</td>
                        <td>${order.customerName}</td>
                        <td>${order.address}</td>
                        <td>${order.deliveryStatus}</td>
                        <td>
                            <form action="UpdateDeliveryStatusServlet" method="post">
                                <input type="hidden" name="deliveryOrderId" value="${order.id}">
                                <div class="form-group">
                                    <select name="status" class="form-select">
                                        <option value="Pending" ${order.deliveryStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                                        <option value="In Progress" ${order.deliveryStatus == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                        <option value="Delivered" ${order.deliveryStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary mt-2">Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
