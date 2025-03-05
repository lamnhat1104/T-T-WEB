<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/11/2025
  Time: 11:10 PM
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
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* Container cho toàn bộ trang */
        .admin-container {
            display: flex;
            justify-content: center; /* Canh giữa theo chiều ngang */
            align-items: center; /* Canh giữa theo chiều dọc */
            height: 100vh; /* Chiều cao toàn màn hình */
            background-color: #f4f4f9;
        }

        /* Container cho form */
        .form-container {
            width: 35%; /* Form vừa đủ rộng */
            background-color: white;
            padding: 20px 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow-y: auto;
        }

        /* Tiêu đề Form */
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 20px;
            color: #333;
        }

        /* Các trường nhập liệu */
        .promotion-form .form-group {
            margin-bottom: 15px;
        }

        .promotion-form .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .promotion-form .form-group input,
        .promotion-form .form-group select,
        .promotion-form .form-group textarea {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .promotion-form .form-group textarea {
            resize: vertical;
        }

        /* Nút submit */
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
            transition: background-color 0.3s ease;
        }


    </style>
</head>
<body>
<div class="admin-container">
    <div class="form-container">
        <h2>Thêm Khuyến Mãi</h2>
        <form action="#" method="post" class="promotion-form">
            <div class="form-group">
                <label for="promo-code">Mã Khuyến Mãi:</label>
                <input type="text" id="promo-code" name="promo-code" placeholder="Nhập mã khuyến mãi" required />
            </div>
            <div class="form-group">
                <label for="promo-name">Tên Khuyến Mãi:</label>
                <input type="text" id="promo-name" name="promo-name" placeholder="Nhập tên khuyến mãi" required />
            </div>
            <div class="form-group">
                <label for="description">Mô Tả:</label>
                <textarea id="description" name="description" rows="3" placeholder="Mô tả chi tiết khuyến mãi"></textarea>
            </div>
            <div class="form-group">
                <label for="discount-value">Giá Trị Giảm (% hoặc VND):</label>
                <input type="number" id="discount-value" name="discount-value" placeholder="Nhập giá trị giảm" required />
            </div>
            <div class="form-group">
                <label for="time-period">Thời Gian:</label>
                <input type="datetime-local" id="time-period" name="time-period" required />
            </div>
            <div class="form-group">
                <label for="actions">Hành Động:</label>
                <select id="actions" name="actions" required>
                    <option value="">-- Chọn hành động --</option>
                    <option value="activate">Kích Hoạt</option>
                    <option value="deactivate">Vô Hiệu Hóa</option>
                </select>
            </div>
            <button type="submit" class="submit-btn">Thêm Khuyến Mãi</button>
        </form>
    </div>
</div>

</body>
</html>
