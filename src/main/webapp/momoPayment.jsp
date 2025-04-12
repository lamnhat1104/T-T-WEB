<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/10/2025
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán MoMo</title>
    <link rel="stylesheet" href="checkout.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="payment-container">
    <h1>Xác nhận thanh toán MoMo</h1>
    <div class="payment-info">
        <p><strong>Tên xe:</strong> ${sessionScope.p.name}</p>
        <p><strong>Giá thuê/ngày:</strong> <f:formatNumber value="${sessionScope.p.price}" /> đ</p>
        <p><strong>Ngày nhận xe:</strong> ${sessionScope.rentalStartDate}</p>
        <p><strong>Ngày trả xe:</strong> ${sessionScope.expectedReturnDate}</p>
        <p><strong>Địa điểm giao xe:</strong> ${sessionScope.location}</p>
        <p><strong>Tổng tiền:</strong> <span style="color:red;"><f:formatNumber value="${sessionScope.totalPrice}" /> đ</span></p>
    </div>

    <form action="MoMoHandler" method="post">
        <input type="hidden" name="amount" value="${sessionScope.totalPrice}">
        <input type="hidden" name="orderInfo" value="Thanh toán thuê xe bằng MoMo - ${sessionScope.p.name}">
        <input type="hidden" name="orderId" value="${sessionScope.orderId}">
        <button type="submit" class="momo-button">Thanh toán với MoMo</button>
    </form>

    <a href="product-list.jsp" class="cancel-link">Huỷ thanh toán</a>
</div>

</body>
</html>
