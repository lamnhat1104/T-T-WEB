<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Kết quả thanh toán VNPAY</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .success { color: green; font-weight: bold; }
        .fail { color: red; font-weight: bold; }
        .info { margin-top: 20px; }
        table { border-collapse: collapse; width: 50%; }
        th, td { padding: 8px 12px; border: 1px solid #ccc; }
    </style>
</head>
<body>
<h1>Kết quả thanh toán VNPAY</h1>

<%
    String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
    String vnp_TxnRef = request.getParameter("vnp_TxnRef"); // Mã đơn hàng
    String vnp_Amount = request.getParameter("vnp_Amount"); // Số tiền (đơn vị 100đ)
    String vnp_BankCode = request.getParameter("vnp_BankCode"); // Mã ngân hàng
    String vnp_PayDate = request.getParameter("vnp_PayDate"); // Ngày thanh toán
    String vnp_OrderInfo = request.getParameter("vnp_OrderInfo"); // Thông tin đơn hàng
%>

<c:choose>
    <c:when test="${vnp_ResponseCode == '00'}">
        <p class="success">Thanh toán thành công!</p>
    </c:when>
    <c:otherwise>
        <p class="fail">Thanh toán không thành công hoặc bị hủy!</p>
    </c:otherwise>
</c:choose>

<div class="info">
    <table>
        <tr>
            <th>Mã đơn hàng</th>
            <td><c:out value="${param.vnp_TxnRef}" /></td>
        </tr>
        <tr>
            <th>Số tiền (VNĐ)</th>
            <td><c:out value="${param.vnp_Amount / 100}" /></td>
        </tr>
        <tr>
            <th>Mã ngân hàng</th>
            <td><c:out value="${param.vnp_BankCode}" /></td>
        </tr>
        <tr>
            <th>Ngày thanh toán</th>
            <td><c:out value="${param.vnp_PayDate}" /></td>
        </tr>
        <tr>
            <th>Thông tin đơn hàng</th>
            <td><c:out value="${param.vnp_OrderInfo}" /></td>
        </tr>
        <tr>
            <th>Mã phản hồi</th>
            <td><c:out value="${param.vnp_ResponseCode}" /></td>
        </tr>
    </table>
</div>

<p><a href="index.jsp">Quay lại trang chủ</a></p>
</body>
</html>
