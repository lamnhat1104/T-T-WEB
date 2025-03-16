<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.dao.OrderDao" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.Order" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="cart.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #ff5b00;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
            transition: 0.3s;
        }

        td {
            color: #333;
        }

    </style>
</head>

<body>


<!-- section 1 -->
<header id="header"></header>
<%
    HttpSession sessionUser = request.getSession();
    User user = (User) sessionUser.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDao orderDao = new OrderDao();
    List<Order> orders = orderDao.getAllOrder();
%>
<div id="sec1">
    <hr>
    <div class="container border">



        <div class="row">

            <!-- col left -->
            <div class="col-lefts">
                <div class="cart-items">
                    <div class="cart-item__products">
                        <h2>Đơn hàng của bạn</h2>
                        <table border="1">
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Hình ảnh</th>
                                <th>Ngày đặt hàng</th>
                                <th>Ngày bắt đầu thuê</th>
                                <th>Ngày dự kiến trả</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                            </tr>
                            <% for (Order order : orders) { %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><% if (order.getVehicleType() != null && order.getVehicleType().getImage() != null) { %>
                                    <img src="<%= order.getVehicleType().getImage() %>" alt="Vehicle Image" width="100">
                                    <% } else { %>
                                    Không có hình ảnh
                                    <% } %></td>
                                <td><%= order.getCreatedDate() %></td>
                                <td><%= order.getRetalStarDate() %></td>
                                <td><%= order.getExpectedReturnDate() %></td>
                                <td><%= order.getOrderDetail().getPriceAtOrder() %> VND</td>
                                <td><%= order.getStatus() %></td>
                            </tr>
                            <% } %>
                        </table>


                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<footer id="footer"></footer>
<script>
    // Chèn header
    fetch('header.jsp')
        .then(response => response.text())
        .then(data => document.getElementById('header').innerHTML = data);

    // Chèn footer
    fetch('footer.jsp')
        .then(response => response.text())
        .then(data => document.getElementById('footer').innerHTML = data);

    // Get the button
    let mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
</script>

</body>
</html>

