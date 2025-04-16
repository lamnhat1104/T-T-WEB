<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/10/2025
  Time: 8:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Xác nhận thanh toán</h2>
    <form action="xacnhanthanhtoan.jsp" method="post">
        <div class="mb-3">
            <label class="form-label">Tên xe:</label>
            <input type="text" class="form-control" name="tenXe" value="<%= request.getParameter("tenXe") %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá thuê (VNĐ/ngày):</label>
            <input type="text" class="form-control" name="giaThue" value="<%= request.getParameter("giaThue") %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Địa điểm giao xe:</label>
            <input type="text" class="form-control" name="diaDiem" value="<%= request.getParameter("diaDiem") %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày nhận xe:</label>
            <input type="text" class="form-control" name="ngayNhan" value="<%= request.getParameter("ngayNhan") %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày trả xe:</label>
            <input type="text" class="form-control" name="ngayTra" value="<%= request.getParameter("ngayTra") %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Tổng tiền (VNĐ):</label>
            <input type="text" class="form-control" name="tongTien" value="<%= request.getParameter("tongTien") %>" readonly>
        </div>
        <button type="submit" class="btn btn-success">Xác nhận thanh toán</button>
    </form>
    <form action="momoPayment.jsp" method="post">
        <input type="hidden" name="tenXe" value="<%= request.getParameter("tenXe") %>">
        <input type="hidden" name="giaThue" value="<%= request.getParameter("giaThue") %>">
        <input type="hidden" name="tongTien" value="<%= request.getParameter("tongTien") %>">
        <button type="submit" class="btn btn-danger"> <img class="content__item-img" src="https://th.bing.com/th/id/R.1bfa35d8e87de88a1c4b040e07790934?rik=iH9FSa1KeElRrQ&pid=ImgRaw&r=0" width=30x></button>
    </form>
</div>
</body>
</html>
