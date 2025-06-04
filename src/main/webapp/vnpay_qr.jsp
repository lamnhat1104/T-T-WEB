<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán QR VNPAY</title>
    <style>
        body {
            font-family: sans-serif;
            text-align: center;
            padding: 50px;
        }
        .qr-container {
            border: 2px solid #ccc;
            display: inline-block;
            padding: 20px;
            border-radius: 10px;
        }
        .qr-container img {
            width: 300px;
            height: 300px;
        }
        .qr-note {
            margin-top: 10px;
            color: #888;
        }
    </style>
</head>
<body>

<h1>Quét mã QR để thanh toán</h1>

<%
    // Lấy link thanh toán VNPAY từ session
    String paymentUrl = (String) session.getAttribute("paymentUrl");
    if (paymentUrl == null || paymentUrl.isEmpty()) {
        // Nếu không có URL thì thông báo lỗi
        out.println("<h3>Không thể lấy URL thanh toán. Vui lòng thử lại.</h3>");
    } else {
        // Sinh mã QR từ link thanh toán
        String qrImageUrl = "https://api.qrserver.com/v1/create-qr-code/?data=" + java.net.URLEncoder.encode(paymentUrl, "UTF-8") + "&size=300x300";
%>

<div class="qr-container">
    <img src="<%= qrImageUrl %>" alt="QR Code VNPAY" />
    <div class="qr-note">Vui lòng quét mã bằng ứng dụng ngân hàng hoặc VNPAY</div>
    <p><strong>Số tiền:</strong> <%= session.getAttribute("totalPrice") %> VNĐ</p>
</div>

<% } %>

</body>
</html>
