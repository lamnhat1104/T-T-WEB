<%--
  Created by IntelliJ IDEA.
  User: phuc1
  Date: 1/10/2025
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thông Tin Hồ Sơ</title>
  <link rel="stylesheet" href="assets/css/account.css">
  <script>
    fetch('header.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('header').innerHTML = data);

    // Chèn footer
    fetch('footer.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('footer').innerHTML = data);
    function filterBestSellers() {
      window.location.href = 'ProductBestSeller';

    }
    function redirectToNewPage() {
      window.location.href = 'ProductNew';
    }
    function showEditProfileForm(username, email, phone, address) {
      document.getElementById("editUsername").value = username;
      document.getElementById("editEmail").value = email;
      document.getElementById("editPhone").value = phone;
      document.getElementById("editAddress").value = address;

      document.getElementById("editProfileForm").style.display = "block";
    }

    function hideEditProfileForm() {
      document.getElementById("editProfileForm").style.display = "none";
    }

  </script>
  <style>
    #editProfileForm {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
      width: 400px;
      height: auto;
      z-index: 1000;
    }

    #editProfileForm label {
      display: block;
      font-weight: bold;
      margin: 8px 0 5px;
    }

    #editProfileForm input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    #editProfileForm button {
      width: 48%;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }

    #editProfileForm button[type="submit"] {
      background: #28a745;
      color: white;
    }

    #editProfileForm button[type="button"] {
      background: #dc3545;
      color: white;
    }

    #editProfileForm button:hover {
      opacity: 0.8;
    }

  </style>
</head>
<body>
<header id="header"></header>
<div class="container">
  <!-- Sidebar -->
  <aside class="sidebar">
    <h2 class="sidebar__text">Tài Khoản Của Tôi</h2>
    <ul class="sidebar__list">
      <li class="sidebar__item">
        <a class="sidebar__item-link sidebar__item-choose" href="#">Hồ Sơ</a>
      </li>
      <li class="sidebar__item">
        <a class="sidebar__item-link" href="#">Đổi Mật Khẩu</a>
      </li>
      <li class="sidebar__item">
        <a class="sidebar__item-link" href="#">Lịch Sử Thuê Xe</a>
      </li>
    </ul>
  </aside>

  <!-- Main Content -->
  <main class="main-content">
    <h1>Hồ Sơ Của Tôi</h1>
    <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>

    <form class="profile-form" action="/demo/UpdateUser" method="post">
      <div class="form-group">
        <label for="username">Tên đăng nhập</label>
        <input type="text" id="username" value="${user != null ? user.userInfo.fullName : ''}" required>
        <span class="note">Tên đăng nhập chỉ có thể thay đổi một lần.</span>
      </div>

      <div class="form-group" >
        <label for="email">Email</label>
        <input type="email" id="email" value="${user != null ? user.email : ''}" required>

      </div>

      <div class="form-group">
        <label >Số điện thoại</label>
        <input type="text" id="sdt" value="${user != null ? user.userInfo.phoneNumber : ''}" required>
      </div>
      <div class="form-group">
        <label >Địa chỉ</label>
        <input type="text" id="address" value="${user != null ? user.userInfo.address : ''}" required>
      </div>

      <div class="alert">
        <p><strong>Liên kết với số điện thoại đang sử dụng</strong></p>
        <p>Liên kết với số điện thoại bạn đang sử dụng để có thể đăng nhập và mua hàng.</p>
      </div>
      <button type="button" onclick="showEditProfileForm('${user.userInfo.fullName}', '${user.email}', '${user.userInfo.phoneNumber}', '${user.userInfo.address}')">Chỉnh sửa</button>

    </form>

  </main>
</div>

// form sửa
<!-- Form chỉnh sửa hồ sơ -->
<div id="editProfileForm" style="display:none;">
  <form action="UserInfo" method="post">
    <label for="editUsername">Tên đăng nhập:</label>
    <input type="text" id="editUsername" name="editUsername" readonly />

    <label for="editEmail">Email:</label>
    <input type="email" id="editEmail" name="editEmail" required />

    <label for="editPhone">Số điện thoại:</label>
    <input type="text" id="editPhone" name="editPhone" required />

    <label for="editAddress">Địa chỉ:</label>
    <input type="text" id="editAddress" name="editAddress" required />

    <button type="submit">Cập nhật</button>
    <button type="button" onclick="hideEditProfileForm()">Hủy</button>
  </form>
</div>

<div id="footer"></div>
</body>
</html>

