<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="cart.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            /* Container tổng thể */

            .cart-container {
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f4f4f9;
                padding: 20px;
            }

            /* Container cho giỏ hàng */

            .cart-items {
                width: 80%;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            /* Tiêu đề */

            .cart-items h2 {
                text-align: center;
                font-size: 22px;
                color: #333;
                margin-bottom: 20px;
            }

            /* Bảng sản phẩm */

            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table th, .table td {
                padding: 10px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            .cart-img {
                width: 80px;
                border-radius: 5px;
            }

            /* Nút bấm */

            .btn-primary, .btn-danger {
                font-size: 14px;
                padding: 8px 12px;
            }

            /* Tổng tiền và điều hướng */

            .cart-summary {
                text-align: center;
                margin-top: 20px;
            }

            .cart-summary h3 {
                font-size: 20px;
                color: #d9534f;
            }

            .btn-success, .btn-secondary {
                padding: 10px;
                font-size: 14px;
                margin: 5px;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .cart-items {
                    width: 95%;
                }
            }
        }
    </style>
</head>
<body>

<header id="header"></header>
<div class="container border">
    <h1><strong>Giỏ Hàng Của Bạn</strong></h1>

    <div class="cart-items">
        <h2>Danh sách sản phẩm</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Ảnh</th>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.cart.list}" var="item">
                <tr>
                    <td><img class="cart-img" src="${item.img}" width="100"></td>
                    <td>${item.title}</td>
                    <td>
                        <form action="UpdateCartServlet" method="post">
                            <input type="hidden" name="productId" value="${item.id}">
                            <input type="number" class="form-control" name="quantity" value="${item.quantity}" min="1">
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </form>
                    </td>
                    <td>${item.price} VND</td>
                    <td>${item.price * item.quantity} VND</td>
                    <td>
                        <form action="RemoveFromCartServlet" method="post">
                            <input type="hidden" name="productId" value="${item.id}">
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="cart-summary">
        <h3>Tổng tiền: <strong>${sessionScope.cart.total} VND</strong></h3>
        <a href="PagingProduct" class="btn btn-secondary">Tiếp tục mua hàng</a>
        <a href="checkout.jsp" class="btn btn-success">Thanh toán</a>
    </div>
</div>

<footer id="footer"></footer>
<script>
    fetch('header.jsp').then(response => response.text()).then(data => document.getElementById('header').innerHTML = data);
    fetch('footer.jsp').then(response => response.text()).then(data => document.getElementById('footer').innerHTML = data);
</script>
</body>
</html>
