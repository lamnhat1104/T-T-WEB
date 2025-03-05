<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/11/2025
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sửa Chữa Khuyến Mãi</title>
    <style>
        /* Container tổng thể */
        .admin-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
            margin: 0;
        }

        /* Container cho form */
        .form-container {
            width: 35%;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: justify; /* Căn đều nội dung */
        }

        /* Tiêu đề */
        .form-container h2 {
            text-align: center; /* Căn giữa tiêu đề */
            margin-bottom: 20px;
            font-size: 20px;
            color: #333;
        }

        /* Nhóm nhập liệu */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: justify; /* Căn đều nội dung khi nhập liệu */
        }

        .form-group textarea {
            resize: vertical;
        }

        /* Nút bấm */
        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #EE4D2D;
            color: white;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center; /* Căn giữa văn bản trong nút */
        }


        /* Responsive */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
<div class="admin-container">
    <div class="form-container">
        <h2>Sửa Chữa Khuyến Mãi</h2>
        <form action="#" method="post" class="promotion-form">
            <div class="form-group">
                <label for="promo-code">Mã Khuyến Mãi:</label>
                <input type="text" id="promo-code" name="promo-code" value="KM01" placeholder="Nhập mã khuyến mãi" required />
            </div>
            <div class="form-group">
                <label for="promo-name">Tên Khuyến Mãi:</label>
                <input type="text" id="promo-name" name="promo-name" value="Khuyến mãi Tết Nguyên Đáng" placeholder="Nhập tên khuyến mãi" required />
            </div>
            <div class="form-group">
                <label for="description">Mô Tả:</label>
                <textarea id="description" name="description" rows="3" placeholder="Nhập mô tả">Dành cho khách hàng thuê xe dịp Tết Nguyên Đáng</textarea>
            </div>
            <div class="form-group">
                <label for="discount-value">Giá Trị Giảm:</label>
                <input type="number" id="discount-value" name="discount-value" value="20" required />
            </div>
            <div class="form-group">
                <label for="time-period">Thời Gian:</label>
                <input type="datetime-local" id="time-period" name="time-period" value="2025-01-25T00:00" required />
            </div>
            <div class="form-group">
                <label for="actions">Hành Động:</label>
                <select id="actions" name="actions" required>
                    <option value="activate" selected>Kích Hoạt</option>
                    <option value="deactivate">Vô Hiệu Hóa</option>
                </select>
            </div>
            <button type="submit" class="submit-btn">Cập Nhật Khuyến Mãi</button>
        </form>
    </div>
</div>
</body>
</html>

