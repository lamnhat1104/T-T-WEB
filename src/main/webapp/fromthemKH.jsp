<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/10/2025
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Khách Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 1.5em;
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-size: 0.9em;
            color: #555;
            font-weight: bold;
        }

        input, select, textarea {
            padding: 8px;
            font-size: 0.9em;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            width: 100%;
        }

        textarea {
            resize: none;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #EE4D2D;
            outline: none;
        }

        .submit-btn {
            width: 100%;
            background-color: #EE4D2D;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #EE4D2D;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }

    </style>
</head>
<body>
<div class="form-container">
    <h1>Thêm Khách Hàng</h1>
    <form action="#" method="POST">
        <div class="form-group">
            <label for="hoTen">Họ và Tên</label>
            <input type="text" id="hoTen" name="hoTen" placeholder="Nhập họ và tên" required>
        </div>
        <div class="form-group">
            <label for="ngaySinh">Ngày Sinh</label>
            <input type="date" id="ngaySinh" name="ngaySinh" required>
        </div>
        <div class="form-group">
            <label for="gioiTinh">Giới Tính</label>
            <select id="gioiTinh" name="gioiTinh" required>
                <option value="">Chọn giới tính</option>
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
                <option value="Khác">Khác</option>
            </select>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Nhập email" required>
        </div>
        <div class="form-group">
            <label for="soDienThoai">Số Điện Thoại</label>
            <input type="tel" id="soDienThoai" name="soDienThoai" placeholder="Nhập số điện thoại" required>
        </div>
        <div class="form-group">
            <label for="diaChi">Địa Chỉ</label>
            <input type="text" id="diaChi" name="diaChi" placeholder="Nhập địa chỉ" required>
        </div>
        <div class="form-group">
            <label for="ngayDangKy">Ngày Đăng Ký</label>
            <input type="date" id="ngayDangKy" name="ngayDangKy" required>
        </div>
        <div class="form-group">
            <label for="chiTietSanPham">Chi Tiết Sản Phẩm Đã Thuê</label>
            <textarea id="chiTietSanPham" name="chiTietSanPham" placeholder="Nhập chi tiết sản phẩm đã thuê" rows="4"></textarea>
        </div>
        <button type="submit" class="submit-btn">Thêm Khách Hàng</button>
    </form>
</div>
</body>
</html>
