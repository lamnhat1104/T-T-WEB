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

    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }

    /* Container cho toàn bộ trang */
    .admin-container {
      margin-top: 100px;
      display: flex;
      justify-content: center; /* Canh giữa theo chiều ngang */
      align-items: center; /* Canh giữa theo chiều dọc */
      height: 100vh; /* Chiều cao toàn màn hình */
      background-color: #f4f4f9;
    }

    /* Container cho form */
    .form-container {
      width: 100%; /* Form vừa đủ rộng */
      background-color: white;
      padding: 20px 25px;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      overflow-y: auto;
    }

    /* Tiêu đề Form */
    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 20px;
      color: #333;
    }

    /* Các trường nhập liệu */
    .promotion-form .form-group {
      margin-bottom: 15px;
    }

    .promotion-form .form-group label {
      display: block;
      font-size: 14px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .promotion-form .form-group input,
    .promotion-form .form-group select,
    .promotion-form .form-group textarea {
      width: 100%;
      padding: 8px;
      font-size: 14px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    .promotion-form .form-group textarea {
      resize: vertical;
    }

    /* Nút submit */
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
      transition: background-color 0.3s ease;
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
        <a href="qltintuc.jsp"><span class="las la-newspaper"></span>
          <span>Quản lý tin tức</span></a>
      </li>
      <li>
        <a href="feedback.jsp"><span class="las la-receipt"></span>
          <span>Phản hồi khách hàng</span></a>
      </li>
      <li>
        <a href="promotion.jsp"  class="promotion-active"><span class="las la-ticket-alt"></span>
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
      Khuyến mãi
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
            <h3>Khuyến mãi</h3>
            <button onclick="openConfig()"> Thêm khuyến mãi</button>


          </div>

          <div class="card-body">
            <table width="100%">
              <thead>
              <tr>
                <th>Mã khuyến mãi</th>
                <th>Tên khuyến mãi</th>
                <th>Mô tả</th>
                <th>Giá trị giảm</th>
                <th>Thời gian</th>
                <th>Hành động</th>

              </tr>
              </thead>
              <tbody>
              <tr>
                <td>KM01</td>
                <td>Khuyến mãi Tết Nguyên Đáng</td>
                <td>dành cho khách hàng thuê xe dịp Tết Nguyên Đáng</td>
                <td>20%</td>
                <td>25/01/2025 - 10/02/2025</td>
                <td>
                  <button class="see-btn">sửa</button>
                  <button class="see-btn">xóa</button>
                </td>
              </tr>

              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div id="configModal" class="modal">
        <div class="modal-content">
          <div class="admin-container">
            <div class="form-container">
              <h2>Thêm Khuyến Mãi</h2>
              <span class="close-btn" onclick="closeConfig()">&times;</span>
              <form action="#" method="post" class="promotion-form">
                <div class="form-group">
                  <label for="promo-code">Mã Khuyến Mãi:</label>
                  <input type="text" id="promo-code" name="promo-code" placeholder="Nhập mã khuyến mãi" required />
                </div>
                <div class="form-group">
                  <label for="promo-name">Tên Khuyến Mãi:</label>
                  <input type="text" id="promo-name" name="promo-name" placeholder="Nhập tên khuyến mãi" required />
                </div>
                <div class="form-group">
                  <label for="description">Mô Tả:</label>
                  <textarea id="description" name="description" rows="3" placeholder="Mô tả chi tiết khuyến mãi"></textarea>
                </div>
                <div class="form-group">
                  <label for="discount-value">Giá Trị Giảm (% hoặc VND):</label>
                  <input type="number" id="discount-value" name="discount-value" placeholder="Nhập giá trị giảm" required />
                </div>
                <div class="form-group">
                  <label for="time-period">Thời Gian:</label>
                  <input type="datetime-local" id="time-period" name="time-period" required />
                </div>
                <div class="form-group">
                  <label for="actions">Hành Động:</label>
                  <select id="actions" name="actions" required>
                    <option value="">-- Chọn hành động --</option>
                    <option value="activate">Kích Hoạt</option>
                    <option value="deactivate">Vô Hiệu Hóa</option>
                  </select>
                </div>
                <button type="submit" class="submit-btn">Thêm Khuyến Mãi</button>
              </form>
            </div>
          </div>
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
