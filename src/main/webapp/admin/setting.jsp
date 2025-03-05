<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:43 PM
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
  <link rel="stylesheet" href="admin.css">
  <style>
    .menu-container {
      display: flex;
      justify-content: space-around;
      padding: 20px;
      background-color: #f9f9f9;
    }

    .menu-item {
      text-align: center;
      background: white;
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      cursor: pointer;
      width: 150px;
    }

    .menu-item:hover {
      background: #f1f1f1;
    }

    .icon {
      font-size: 24px;
      margin-bottom: 8px;
    }

    /* Modal container */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0, 0, 0);
      background-color: rgba(0, 0, 0, 0.4);
      padding-top: 60px;
    }

    /* Styles for the main container */
    .menu-container {
      display: flex;
      justify-content: space-around;
      margin: 20px;
    }

    .menu-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      cursor: pointer;
    }

    .menu-item i {
      font-size: 24px;
    }

    .menu-item p {
      margin: 5px 0 0 0;
    }

    /* Modal styles */
    .modal {
      display: none; /* Hidden by default */
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Styles for the main container */
    .menu-container {
      display: flex;
      justify-content: space-around;
      margin: 20px;
    }

    .menu-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      cursor: pointer;
    }

    .menu-item i {
      font-size: 24px;
    }

    .menu-item p {
      margin: 5px 0 0 0;
    }

    /* Modal styles */
    .modal {
      display: none; /* Hidden by default */
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    .modal-content {
      background-color: #fefefe;
      margin: auto; /* Centered */
      padding: 20px;
      border: 1px solid #888;
      width: 50%; /* Smaller size */
      max-width: 500px; /* Ensures it doesn't get too wide */
    }

    .close-btn {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close-btn:hover,
    .close-btn:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin: 10px 0 5px;
    }

    input, select, button {
      padding: 10px;
      margin: 5px 0 15px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }





  </style>
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
        <a href="customers.jsp" ><span class="las la-users"></span>
          <span>Quản lý khách hàng</span></a>
      </li>
      <li>
        <a href="motorbikes.jsp"><span class="las la-motorcycle"></span>
          <span>Quản lý xe máy</span></a>
      </li>
      <li>
        <a href="orders.jsp"><span class="las la-shopping-bag"></span>
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
        <a href="setting.jsp" class="setting-active"><span class="las la-cog"></span>
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
      Cài đặt
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
    <div class="menu-container">
      <div class="menu-item" onclick="openConfig()">
        <i class="icon">⚙️</i>
        <p>Cấu hình hệ thống</p>
      </div>
      <div class="menu-item">
        <i class="icon">📝</i>
        <p>Nhật ký hoạt động</p>
      </div>
      <div class="menu-item">
        <i class="icon">📞</i>
        <p>Hỗ trợ kỹ thuật</p>
      </div>
    </div>
    <div id="configModal" class="modal">
      <div class="modal-content">
        <span class="close-btn" onclick="closeConfig()">&times;</span>
        <h2>Cấu Hình Hệ Thống</h2>
        <form>
          <label for="system-name">Tên Hệ Thống:</label>
          <input type="text" id="system-name" placeholder="Quản Lý Hệ Thống">

          <label for="admin-email">Email Quản Trị:</label>
          <input type="email" id="admin-email" placeholder="admin@system.com">

          <label for="language">Ngôn Ngữ:</label>
          <select id="language">
            <option value="vi">Tiếng Việt</option>
            <option value="en">English</option>
          </select>

          <label for="timezone">Múi Giờ:</label>
          <select id="timezone">
            <option value="utc+7">UTC+7 (Vietnam)</option>
            <option value="utc+8">UTC+8 (China)</option>
          </select>

          <label for="maintenance">Chế Độ Bảo Trì:</label>
          <select id="maintenance">
            <option value="on">Bật</option>
            <option value="off">Tắt</option>
          </select>

          <label for="user-limit">Số Lượng Người Dùng Tối Đa:</label>
          <input type="number" id="user-limit" value="100">

          <button type="submit">Lưu Cấu Hình</button>
        </form>
      </div>
    </div>



  </main>
  <script>
    function openConfig() {
      document.getElementById('configModal').style.display = 'flex';
    }

    function closeConfig() {
      document.getElementById('configModal').style.display = 'none';
    }

  </script>
</div>
</body>
</html>
