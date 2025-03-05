<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/11/2025
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tin Tức</title>
    <style>
        /* style.css */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .news-form .form-group {
            margin-bottom: 15px;
        }

        .news-form label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        .news-form input,
        .news-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .news-form textarea {
            resize: vertical;
        }

        .news-form .btn-submit {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #EE4D2D;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }


    </style>
</head>
<body>
<div class="container">
    <h1>Quản Lý Tin Tức</h1>
    <form class="news-form">
        <div class="form-group">
            <label for="news-id">Mã Tin Tức:</label>
            <input type="text" id="news-id" name="news-id" placeholder="Nhập mã tin tức" required>
        </div>
        <div class="form-group">
            <label for="news-title">Tiêu Đề:</label>
            <input type="text" id="news-title" name="news-title" placeholder="Nhập tiêu đề" required>
        </div>
        <div class="form-group">
            <label for="news-content">Thông Tin:</label>
            <textarea id="news-content" name="news-content" placeholder="Nhập thông tin chi tiết" rows="4" required></textarea>
        </div>
        <div class="form-group">
            <label for="news-image">Hình Ảnh:</label>
            <input type="file" id="news-image" name="news-image" accept="image/*">
        </div>
        <div class="form-group">
            <label for="news-date">Ngày Tạo:</label>
            <input type="date" id="news-date" name="news-date" required>
        </div>
        <button type="submit" class="btn-submit">Thêm Tin Tức</button>
    </form>
</div>
</body>
</html>

