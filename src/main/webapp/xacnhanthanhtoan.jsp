<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/10/2025
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Xác nhận thanh toán</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      padding: 40px;
      font-family: Arial, sans-serif;
    }
    .container {
      max-width: 600px;
      margin: auto;
    }
    .success {
      color: green;
    }
    .fail {
      color: red;
    }
  </style>
</head>
<body>
<div class="container text-center">
  <h2>Kết quả thanh toán</h2>
  <%
    // Nhận dữ liệu từ MoMo redirect
    String orderId = request.getParameter("orderId");
    String resultCode = request.getParameter("resultCode");
    String message = "";

    if (resultCode != null && resultCode.equals("0")) {
      message = "Thanh toán thành công!";
  %>
  <p class="success"><strong><%= message %></strong></p>
  <p>Mã đơn hàng: <%= orderId %></p>
  <a href="index.jsp" class="btn btn-success">Quay lại trang chủ</a>
  <%
  } else {
    message = "Thanh toán thất bại. Vui lòng thử lại!";
  %>
  <p class="fail"><strong><%= message %></strong></p>
  <a href="thanh-toan.jsp" class="btn btn-warning">Thử lại</a>
  <%
    }
  %>
</div>
</body>
</html>

