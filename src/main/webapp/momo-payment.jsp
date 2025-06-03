<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Thanh toán MoMo - Mã QR</title>
    <style>
        .container {
            width: 320px;
            margin: 50px auto;
            text-align: center;
            font-family: Arial, sans-serif;
        }
        img {
            width: 250px;
            height: 250px;
            margin: 20px auto;
        }
        .amount {
            font-weight: bold;
            font-size: 20px;
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Quét mã QR để thanh toán MoMo</h1>
    <img src="https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=${payUrl}" alt="Mã QR MoMo"/>
    <p class="amount">Số tiền: ${amount} đ</p>
    <p>URL QR: ${payUrl}</p>

</div>
</body>
</html>

