<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Update Delivery Status</h2>
<table border="1">
    <thead>
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
                        <select name="status">
                            <option value="Pending" ${order.deliveryStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                            <option value="In Progress" ${order.deliveryStatus == 'In Progress' ? 'selected' : ''}>In Progress</option>
                            <option value="Delivered" ${order.deliveryStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                        </select>
                        <button type="submit">Update</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>