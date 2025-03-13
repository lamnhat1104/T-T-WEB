<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/18/2025
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .cart-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.2rem;
            font-weight: bold;
            color: #2c3e50;
        }
        table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .btn-danger {
            background-color: #e74c3c;
            border-color: #e74c3c;
        }
        .btn-danger:hover {
            background-color: #c0392b;
        }
        .btn-success {
            background-color: #27ae60;
            border-color: #27ae60;
        }
        .btn-success:hover {
            background-color: #1e8449;
        }
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
        input[type="number"] {
            width: 80px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="cart-container">
        <h1 class="text-center mb-4">🛒 Giỏ Hàng</h1>
        <form>
            <table class="table table-bordered text-center">
                <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Sản phẩm A</td>
                    <td>100,000đ</td>
                    <td><input type="number" class="form-control mx-auto" value="1" min="1"></td>
                    <td>100,000đ</td>
                    <td><button type="button" class="btn btn-danger btn-sm">Xóa</button></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Sản phẩm B</td>
                    <td>200,000đ</td>
                    <td><input type="number" class="form-control mx-auto" value="1" min="1"></td>
                    <td>200,000đ</td>
                    <td><button type="button" class="btn btn-danger btn-sm">Xóa</button></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="4" class="text-end"><strong>Tổng cộng:</strong></td>
                    <td colspan="2">300,000đ</td>
                </tr>
                </tfoot>
            </table>
            <div class="text-end">
                <button type="submit" class="btn btn-success">Thanh toán</button>
                <button type="button" class="btn btn-secondary">Tiếp tục mua sắm</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


