<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/15/2025
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0">
    <title>Trang admin</title>
    <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
    <link rel="stylesheet" href="admin.css">
</head>
<body>
<input type="checkbox" id="nav-toggle">

<div class="sidebar">
    <div class="sidebar-brand">
        <h2><span>Rental Motorbike</span></h2>

    </div>

    <div class="sidebar-menu">
        <ul>
            <li>
                <a href="admin.jsp">
                    <span class="las la-igloo"></span>
                    <span>Dashboard</span></a>
            </li>
            <li>
                <a href="customers.jsp"><span class="las la-users"></span>
                    <span>Quản lý khách hàng</span></a>
            </li>
            <li>
                <a href="motorbikes.jsp"><span class="las la-motorcycle"></span>
                    <span>Quản lý xe máy</span></a>
            </li>
            <li>
                <a href="orders.jsp" class="orders-active"><span class="las la-shopping-bag"></span>
                    <span>Quản lý đơn hàng</span></a>
            </li>
            <li>
                <a href="qltintuc.jsp"><span class="las la-newspaper"></span>
                    <span>Quản lý tin tức</span></a>
            </li>
            <li>
                <a href="feedback.jsp"><span class="las la-receipt"></span>
                    <span>Phản hồi khách hàng</span></a>
            </li>
            <li>
                <a href="promotion.jsp"><span class="las la-ticket-alt"></span>
                    <span>Quản lý khuyến mãi</span></a>
            </li>
            <li>
                <a href="stats_motors.jsp"><span class="las la-circle"></span>
                    <span>Thống kê xe máy</span></a>
            </li>
            <li>
                <a href="stats_income.jsp"><span class="las la-clipboard-list"></span>
                    <span>Thống kê doanh thu</span></a>
            </li>
            <li>
                <a href="setting.jsp"><span class="las la-cog"></span>
                    <span>Cài đặt</span></a>
            </li>
        </ul>
    </div>
</div>

<div class="main-content">
    <header>
        <h2>
            <label for="nav-toggle" >
                <span class="las la-bars"></span>
            </label>
            Đơn hàng
        </h2>

        <div class="search-wrapper">
            <span class="las la-search"></span>
            <input type="search" placeholder="Tìm kiếm tại đây"/>
        </div>

        <div class="user-wrapper">
            <img src="../assets/img/home_img/user.png" height="40" width="40"/>
            <div>
                <h4>Admin</h4>
                <small>NNP</small>
            </div>
        </div>
    </header>
    <main>

        <div class="recent-grid">
            <div class="projects">
                <div class="card">
                    <div class="card-header">
                        <h3>Đơn hàng</h3>
                        <button> Duyệt tất cả<span class="las la-arrow-right"></span> </button>
                    </div>

                    <div class="card-body">
                        <table width="100%">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Loại xe</th>
                                <th>Biển số</th>
                                <th>Số lần xe đc thue</th>
                                <th>Còn được sử dụng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>DH001</td>
                                <td>Nguyễn Văn A</td>
                                <td>123 Đường ABC</td>
                                <td>15/11/2023</td>
                                <td>Chuyển khoản</td>
                                <td>Mới đặt</td>
                                <td>
                                    <button class="see-btn">Duyệt</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH002</td>
                                <td>Trần Thị B</td>
                                <td>456 Đường XYZ</td>
                                <td>14/11/2023</td>
                                <td>Thanh toán khi nhận hàng</td>
                                <td>Mới đặt</td>
                                <td>
                                    <button class="see-btn">Duyệt</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH003</td>
                                <td>Nguyễn Văn A</td>
                                <td>123 Đường ABC</td>
                                <td>15/11/2023</td>
                                <td>Chuyển khoản</td>
                                <td>Đang giao</td>
                                <td>
                                    <button class="see-btn">Xong</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH004</td>
                                <td>Trần Thị B</td>
                                <td>456 Đường XYZ</td>
                                <td>14/11/2023</td>
                                <td>Thanh toán khi nhận hàng</td>
                                <td>Đang giao</td>
                                <td>
                                    <button class="see-btn">Xong</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH005</td>
                                <td>Nguyễn Văn A</td>
                                <td>123 Đường ABC</td>
                                <td>15/11/2023</td>
                                <td>Chuyển khoản</td>
                                <td>Mới đặt</td>
                                <td>
                                    <button class="see-btn">Duyệt</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH006</td>
                                <td>Trần Thị B</td>
                                <td>456 Đường XYZ</td>
                                <td>14/11/2023</td>
                                <td>Thanh toán khi nhận hàng</td>
                                <td>Đã giao</td>
                                <td>
                                    <button class="see-btn">Xong</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH007</td>
                                <td>Nguyễn Văn A</td>
                                <td>123 Đường ABC</td>
                                <td>15/11/2023</td>
                                <td>Chuyển khoản</td>
                                <td>Đang giao</td>
                                <td>
                                    <button class="see-btn">Xong</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH008</td>
                                <td>Trần Thị B</td>
                                <td>456 Đường XYZ</td>
                                <td>14/11/2023</td>
                                <td>Thanh toán khi nhận hàng</td>
                                <td>Mới đặt</td>
                                <td>
                                    <button class="see-btn">Duyệt</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH009</td>
                                <td>Nguyễn Văn A</td>
                                <td>123 Đường ABC</td>
                                <td>15/11/2023</td>
                                <td>Chuyển khoản</td>
                                <td>Đã giao</td>
                                <td>
                                    <button class="see-btn">Xong</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DH010</td>
                                <td>Trần Thị B</td>
                                <td>456 Đường XYZ</td>
                                <td>14/11/2023</td>
                                <td>Thanh toán khi nhận hàng</td>
                                <td>Đã giao</td>
                                <td>
                                    <button class="see-btn">Xong</button>
                                    <button class="see-btn">Xóa</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

</div>
</body>
</html>
