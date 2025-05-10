<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/8/2025
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.dao.OrderDao" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.Order" %>
<%@ page import="java.sql.Date" %>

<html>
<head>
    <title>Kiểm tra trạng thái đơn hàng</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Kiểm tra trạng thái đơn hàng</h1>

<!-- Form nhập orderId -->
<form action="order-status.jsp" method="get">
    <label for="orderId">Mã đơn hàng:</label>
    <input type="text" id="orderId" name="orderId" required>
    <button type="submit">Kiểm tra</button>
</form>

<hr/>

<c:if test="${not empty param.orderId}">
    <%
        String orderIdStr = request.getParameter("orderId");
        int orderId = Integer.parseInt(orderIdStr);
        OrderDao orderDao = new OrderDao();
        Order order = orderDao.getOrderById(orderId);
        request.setAttribute("order", order); // Lấy đơn hàng theo ID
    %>

    <c:if test="${not empty order}">
        <h2>Thông tin đơn hàng</h2>
        <table border="1">
            <tr>
                <th>Mã đơn hàng</th>
                <td>${order.id}</td>
            </tr>
            <tr>
                <th>Khách hàng</th>
                <td>${order.customerId}</td>
            </tr>
            <tr>
                <th>Địa chỉ giao xe</th>
                <td>${order.deliveryAddress}</td>
            </tr>
            <tr>
                <th>Ngày thuê</th>
                <td>${order.rentalStartDate}</td>
            </tr>
            <tr>
                <th>Ngày trả</th>
                <td>${order.expectedReturnDate}</td>
            </tr>
            <tr>
                <th>Xe thuê</th>
                <td>${order.orderDetail.licensePlate}</td>
            </tr>
            <tr>
                <th>Giá thuê</th>
                <td>${order.orderDetail.priceAtOrder}</td>
            </tr>
            <tr>
                <th>Khuyến mãi</th>
                <td>${order.promotion.promotionName}</td>
            </tr>
            <tr>
                <th>Trạng thái</th>
                <td>
                    <c:choose>
                        <c:when test="${order.status == 1}">Đang chờ</c:when>
                        <c:when test="${order.status == 2}">Đã xác nhận</c:when>
                        <c:when test="${order.status == 3}">Đã giao xe</c:when>
                        <c:when test="${order.status == 4}">Đã huỷ</c:when>
                        <c:otherwise>Không xác định</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>
    </c:if>


    <c:if test="${empty order}">
        <p>Không tìm thấy đơn hàng với mã đơn hàng: ${orderId}</p>
    </c:if>
</c:if>
</body>
</html>

