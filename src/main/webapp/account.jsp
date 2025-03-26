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

  </script>
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

    <form class="profile-form" action="UpdateUser" method="post">
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
      <button type="submit" class="save-button">Thây đổi thông tin</button>
    </form>

  </main>
</div>
// form
<div id="footer"></div>
</body>
</html>

