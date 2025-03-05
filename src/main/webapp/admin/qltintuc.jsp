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

    .invoice-modal {
      width: 100%;
      margin: 80px auto;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
      padding: 20px;
      position: relative;
    }

    .invoice-header {
      text-align: center;
      position: relative;
    }

    .invoice-header h2 {
      font-size: 24px;
      margin: 0;
    }

    .close-btn {
      position: absolute;
      right: 20px;
      top: 10px;
      font-size: 20px;
      cursor: pointer;
      color: #999;
    }

    .invoice-table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    .invoice-table th,
    .invoice-table td {
      color: black;
      padding: 10px;
      text-align: left;
      border: 1px solid #ddd;
    }

    .invoice-table th {
      background-color: #f9f9f9;
      font-weight: bold;
    }

    .invoice-total {
      text-align: right;
      margin-top: 20px;
      font-size: 18px;
      color: #ff9800;
      font-weight: bold;
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
        <a href="customers.jsp"><span class="las la-users"></span>
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
        <a href="qltintuc.jsp" class="tintuc-active"><span class="las la-newspaper"></span>
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
      Tin tức
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
            <h3>Tin tức</h3>
            <button> Thêm tin tức</button>
            <button class="card-header-btn"> Xóa tin tức</button>

          </div>

          <div class="card-body">
            <table width="100%">
              <thead>
              <tr>
                <th>Mã tin tức</th>
                <th>Tiêu đề</th>
                <th>Thông tin</th>
                <th>Ngày tạo</th>

              </tr>
              </thead>
              <tbody>
              <tr>
                <td>KH01</td>
                <td>Mai Lâm Nhật</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH02</td>
                <td>Nguyễn Hoàng Phúc</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH03</td>
                <td>Nguyễn Bảo Nguyên</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH04</td>
                <td>Mai Lâm Nhật</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH05</td>
                <td>Nguyễn Hoàng Phúc</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH06</td>
                <td>Nguyễn Bảo Nguyên</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH07</td>
                <td>Mai Lâm Nhật</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH08</td>
                <td>Nguyễn Hoàng Phúc</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH09</td>
                <td>Nguyễn Bảo Nguyên</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH10</td>
                <td>Mai Lâm Nhật</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH11</td>
                <td>Nguyễn Hoàng Phúc</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

              </tr>
              <tr>
                <td>KH12</td>
                <td>Nguyễn Bảo Nguyên</td>
                <td>tin tức</td>
                <td>11-04-2004</td>

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
