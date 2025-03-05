<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/10/2025
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Xe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 100%;
            max-width: 350px; /* Giảm chiều rộng form */
            background: #fff;
            padding: 10px; /* Giảm padding */
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            margin-bottom: 10px; /* Giảm khoảng cách tiêu đề */
            color: #333;
            font-size: 1em; /* Giảm kích thước chữ */
        }

        .form-group {
            margin-bottom: 8px; /* Giảm khoảng cách giữa các trường */
        }

        label {
            display: block;
            font-size: 0.8em; /* Giảm kích thước chữ */
            margin-bottom: 3px; /* Giảm khoảng cách giữa nhãn và input */
            color: #555;
        }

        input, select, textarea {
            width: 100%;
            padding: 5px; /* Giảm padding trong input */
            font-size: 0.8em; /* Giảm kích thước chữ */
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        textarea {
            resize: none;
        }

        button.submit-btn {
            width: 100%;
            background-color: #EE4D2D;
            color: white;
            border: none;
            padding: 8px; /* Giảm kích thước nút */
            border-radius: 3px;
            font-size: 0.9em; /* Giảm kích thước chữ nút */
            cursor: pointer;
        }

        button.submit-btn:hover {
            background-color: #EE4D2D;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 8px; /* Giảm padding cho thiết bị nhỏ */
            }
        }


    </style>
</head>
<body>
<div class="form-container">
    <h3>Thêm Xe</h3>
    <form action="#" method="POST" enctype="multipart/form-data">
        <div class="form-group">
            <label for="idXe">ID Xe</label>
            <input type="text" id="idXe" name="idXe" placeholder="Nhập ID xe" required>
        </div>
        <div class="form-group">
            <label for="tenXe">Tên Xe</label>
            <input type="text" id="tenXe" name="tenXe" placeholder="Nhập tên xe" required>
        </div>
        <div class="form-group">
            <label for="loaiXe">Loại Xe</label>
            <select id="loaiXe" name="loaiXe" required>
                <option value="">Chọn loại xe</option>
                <option value="Xe côn">Xe côn</option>
                <option value="Xe số">Xe số</option>
                <option value="Xe tay ga">Xe tay ga</option>
            </select>
        </div>
        <div class="form-group">
            <label for="giaThue">Giá Thuê (VND)</label>
            <input type="number" id="giaThue" name="giaThue" placeholder="Nhập giá thuê" required>
        </div>
        <div class="form-group">
            <label for="hangXe">Hãng Xe</label>
            <input type="text" id="hangXe" name="hangXe" placeholder="Nhập hãng xe" required>
        </div>
        <div class="form-group">
            <label for="xuatXu">Xuất Xứ</label>
            <input type="text" id="xuatXu" name="xuatXu" placeholder="Nhập xuất xứ" required>
        </div>
        <div class="form-group">
            <label for="moTa">Mô Tả</label>
            <textarea id="moTa" name="moTa" placeholder="Mô tả chi tiết về xe" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="hinhAnh">Hình Ảnh</label>
            <input type="file" id="hinhAnh" name="hinhAnh" accept="image/*" required>
        </div>
        <button type="submit" class="submit-btn">Thêm Xe</button>
    </form>
</div>
</body>
</html>
