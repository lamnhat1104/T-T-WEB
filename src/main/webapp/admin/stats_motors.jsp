<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0">
    <title>Trang admin</title>
    <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
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
                <a href="/demo/admin?action=dashboard">
                    <span class="las la-igloo"></span>
                    <span>Dashboard</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerCustomer"><span class="las la-users"></span>
                    <span>Quản lý khách hàng</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerVehicleType"><span class="las la-motorcycle"></span>
                    <span>Quản lý xe máy</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerOrder"><span class="las la-shopping-bag"></span>
                    <span>Quản lý đơn hàng</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerConditionRental"><span class="las la-motorcycle"></span>
                    <span>Điều kiện đặt xe</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerNew"><span class="las la-newspaper"></span>
                    <span>Quản lý tin tức</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerContact"><span class="las la-receipt"></span>
                    <span>Phản hồi khách hàng</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerPromotion"><span class="las la-ticket-alt"></span>
                    <span>Quản lý khuyến mãi</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerStatMotor" class="dashboard-active"><span class="las la-circle"></span>
                    <span>Thống kê xe máy</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerStatIncome"><span class="las la-clipboard-list"></span>
                    <span>Thống kê doanh thu</span></a>
            </li>
            <li>
                <a href="/demo/admin?action=managerSetting"><span class="las la-cog"></span>
                    <span>Cài đặt</span></a>
            </li>
        </ul>
    </div>
</div>
<div class="main-content">

    <h2>Thống kê xe máy thuê nhiều</h2>
    <div class="charts">
        <canvas id="revenueChart" width="400" height="200"></canvas>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="../assets/js/stats_motor.js"></script>





</body>
</html>
