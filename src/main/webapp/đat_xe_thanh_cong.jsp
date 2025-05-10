<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/8/2025
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đặt xe thành công</title>
    <style>
        .success-message {
            padding: 20px;
            text-align: center;
        }
        .btn-view-order {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
        }
        .btn-view-order:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="success-message">
    <h2>✅ Đặt xe thành công!</h2>
    <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>

    <!-- Nút chuyển đến trang tình trạng đơn hàng -->
    <a href="order-status.jsp?userId=${sessionScope.user.id}" class="btn-view-order">
        Xem tình trạng đơn hàng
    </a>
</div>
</body>
</html>
