<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Liên hệ</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/ContractUS.css">
</head>
<body>
<header id="header"></header>

<div class="contact-container">
  <div class="contact-info">
    <h2>Liên Hệ Trực Tiếp Với Chúng Tôi</h2>
    <div class="info-item">
      <i class="fas fa-phone"></i>
      <p><strong>Điện thoại:</strong> 0909999888</p>
    </div>
    <div class="info-item">
      <i class="fas fa-envelope"></i>
      <p><strong>Email:</strong> nnp@gmail.com</p>
    </div>
    <div class="info-item">
      <i class="fas fa-map-marker-alt"></i>
      <p><strong>Địa chỉ:</strong> Trường đại học Nông Lâm TP.HCM</p>
    </div>
  </div>
  <div class="contact-form">
    <h2>Gửi Thông Tin Liên Hệ</h2>
    <form action="" method="post">
      <label for="name">Họ và Tên</label>
      <input type="text" id="name" name="name" placeholder="Nhập họ và tên" required />

      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="Nhập địa chỉ email" required />

      <label for="message">Tin nhắn</label>
      <textarea id="message" name="message" placeholder="Nhập nội dung tin nhắn" required></textarea>

      <button type="submit">Gửi</button>
    </form>
  </div>
</div>




<footer id="footer"></footer>

<script>
  // Chèn header
  fetch('header.html')
          .then(response => response.text())
          .then(data => document.getElementById('header').innerHTML = data);

  // Chèn footer
  fetch('footer.html')
          .then(response => response.text())
          .then(data => document.getElementById('footer').innerHTML = data);
</script>

</body>
</html>
