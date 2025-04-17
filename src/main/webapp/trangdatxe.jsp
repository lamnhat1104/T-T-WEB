<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/16/2025
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Đặt xe thành công</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            padding: 50px;
        }
        .success {
            color: green;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .details {
            font-size: 18px;
        }
        a {
            margin-top: 30px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="success">🎉 Bạn đã đặt xe thành công!</div>

<div class="details">
    <p>Cảm ơn bạn đã đặt hàng tại hệ thống của chúng tôi.</p>
    <p>Mã đơn hàng của bạn: <strong><%= request.getParameter("orderId") != null ? request.getParameter("orderId") : "N/A" %></strong></p>
    <p>Chúng tôi sẽ liên hệ bạn để xác nhận và giao xe sớm nhất.</p>
</div>

<a href="index.jsp">Quay về trang chủ</a>

</body>
</html>
