<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/10/2025
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa Tin Tức</title>
    <style>
        /* Tổng thể */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .admin-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 40%;
            background-color: white;
            padding: 20px 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Tiêu đề */
        .form-container h2 {
            text-align: center;
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
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-align: justify;
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
            text-align: center;
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
        <h2>Sửa Tin Tức</h2>
        <form action="#" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="news-id">Mã Tin Tức:</label>
                <input type="text" id="news-id" name="news-id" value="TT001" placeholder="Nhập mã tin tức" required />
            </div>
            <div class="form-group">
                <label for="title">Tiêu Đề:</label>
                <input type="text" id="title" name="title" value="Tiêu đề mẫu" placeholder="Nhập tiêu đề" required />
            </div>
            <div class="form-group">
                <label for="content">Thông Tin:</label>
                <textarea id="content" name="content" rows="4" placeholder="Nhập thông tin">Nội dung tin tức mẫu</textarea>
            </div>
            <div class="form-group">
                <label for="image">Hình Ảnh:</label>
                <input type="file" id="image" name="image" accept="image/*" />
            </div>
            <div class="form-group">
                <label for="created-date">Ngày Tạo:</label>
                <input type="date" id="created-date" name="created-date" value="2024-12-03" required />
            </div>
            <button type="submit" class="submit-btn">Cập Nhật Tin Tức</button>
        </form>
    </div>
</div>
</body>
</html>
