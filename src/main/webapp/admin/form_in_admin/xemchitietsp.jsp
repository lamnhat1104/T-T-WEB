<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/11/2025
  Time: 11:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .invoice-modal {
            width: 50%;
            margin: 50px auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            padding: 20px;
            position: relative;
        }

        .invoice-header {
            text-align: center;
            position: relative;
        }

        .invoice-header h2 {
            font-size: 24px;
            margin: 0;
        }

        .close-btn {
            position: absolute;
            right: 20px;
            top: 10px;
            font-size: 20px;
            cursor: pointer;
            color: #999;
        }

        .invoice-info {
            margin: 20px 0;
            line-height: 1.8;
        }

        .invoice-info strong {
            color: #333;
        }

        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .invoice-table th,
        .invoice-table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .invoice-table th {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        .invoice-total {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
            color: #ff9800;
            font-weight: bold;
        }

    </style>
</head>
<body>
<div class="invoice-modal">
    <div class="invoice-header">
        <h2>CHI TIẾT HÓA ĐỠ THUÊ XE</h2>
        <span class="close-btn">&times;</span>
    </div>
    <div class="invoice-info">
        <p><strong>Tên:</strong> Nguyễn Bảo Nguyên</p>
        <p><strong>Địa chỉ:</strong> 123 Đường ABC</p>
        <p><strong>Số điện thoại:</strong> 0987654321</p>
        <p><strong>Ngày mua:</strong> 12/11/2023</p>
    </div>
    <table class="invoice-table">
        <thead>
        <tr>
            <th>ID xe</th>
            <th>Tên xe</th>
            <th>Loại xe</th>
            <th>Giá thuê</th>
            <th>Mô tả </th>
            <th>Hãng sản xuất</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Yamaha Nozza</td>
            <td>Xe số</td>
            <td>80.000 VND</td>
            <td>	Dễ lái, tiết kiệm xăng</td>
            <td>Yamaha</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Honda SH</td>
            <td>Xe tay ga</td>
            <td>180.000 VND</td>
            <td>	Dễ lái, tiết kiệm xăng</td>
            <td>Honda</td>
        </tr>
        </tbody>
    </table>
    <div class="invoice-total">
        <strong>TỔNG TIỀN: 260,000 VND</strong>
    </div>
</div>
</body>
</html>
