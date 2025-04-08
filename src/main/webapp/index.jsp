<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/base.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.6.0/css/all.css">
</head>
<a href="contact.jsp">Liên hệ</a>
<a href="https://m.me/653366031188369" target="_blank" style="position: fixed; bottom: 20px; right: 20px; background-color: #0084ff; color: white; padding: 10px 15px; border-radius: 25px; text-decoration: none; font-weight: bold; box-shadow: 0 4px 6px rgba(0,0,0,0.1); z-index: 999;">
  💬 Nhắn tin
</a>
<body>
<div class="app">
  <header id="header"></header>

  <div class="container">
    <div class="container__header">
      <img src="assets/img/home_img/xe/login_background.jpg" height="565" width="1366"/>
    </div>

    <div class="container__content">
      <h2 class="container__title">CÁC DÒNG XE MÁY</h2>


      <div class="container__content-list">
        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe1.jpg">
          <span class="container__content-list-span">YAMAHA NOZZA</span>
          <p class="price">Giá chỉ từ: 80,000đ</p>
        </a>

        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe2.jpg">
          <span class="container__content-list-span">HONDA VISION</span>
          <p class="price">Giá chỉ từ: 90,000đ</p>
        </a>

        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe3.jpg">
          <span class="container__content-list-span">HONDA WAVE RSX</span>
          <p class="price">Giá chỉ từ: 50,000đ</p>
        </a>

        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe4.jpg">
          <span class="container__content-list-span">SIRIUS RC</span>
          <p class="price">Giá chỉ từ: 50,000đ</p>
        </a>

        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe5.jpg">
          <span class="container__content-list-span">LIBERTY</span>
          <p class="price">Giá chỉ từ: 90,000đ</p>
        </a>

        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe6.jpg">
          <span class="container__content-list-span">PIAGO VESPA</span>
          <p class="price">Giá chỉ từ: 90,000đ</p>
        </a>

        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe7.jpg">
          <span class="container__content-list-span">HONDA SH</span>
          <p class="price">Giá chỉ từ: 180,000đ</p>
        </a>
        <a href="#" class="container__content-list-link">
          <img class="container__content-list-img" src="assets/img/home_img/xe/xe8.jpg">
          <span class="container__content-list-span">LEAD 125CC</span>
          <p class="price">Giá chỉ từ: 80,000đ</p>
        </a>
        <!-- Add more items as needed -->
      </div>
      <h3><a href="trangsanpham.html" style="text-decoration: none">Xem thêm</a></h3>

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
