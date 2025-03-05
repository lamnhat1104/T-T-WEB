<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giỏ hàng</title>
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="cart.css">
  <link rel="stylesheet" href="assets/fonts/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
</head>

<body>
<header id="header"></header>
<!-- section 1 -->
<div id="sec1">
  <hr>
  <div class="container border">
    <h1><strong>Giỏ Hàng Của Bạn (5 Sản Phẩm)</strong></h1>

    <!-- Giỏ hàng -->
    <div class="row">

      <!-- col left -->
      <div class="col-left">
        <div class="cart-item">
          <div class="cart-item__product">

            <img src="assets/img/home_img/xe/xe1.jpg" class="cart-img">
            <p><strong>Yamaha Nozza</strong></p>
            <i class="cart-icon fa-regular fa-pen-to-square fa-xl"></i>
            <input type="number" class="form-control" value="1" min="1" max="5">

            <p><strong>80,000 VND/ngày</strong></p>
            <i class="cart-icon fa-solid fa-trash fa-xl"></i>
          </div>
        </div>

        <div class="cart-item">
          <div class="cart-item__product">
            <img src="assets/img/home_img/xe/xe2.jpg" class="cart-img">
            <p><strong>Honda Vision</strong></p>
            <i class="cart-icon fa-regular fa-pen-to-square fa-xl"></i>
            <input type="number" class="form-control" value="1" min="1" max="5">

            <p><strong>90,000 VND/ngày</strong></p>
            <i class="cart-icon fa-solid fa-trash fa-xl"></i>
          </div>
        </div>

        <div class="cart-item">
          <div class="cart-item__product">
            <img src="assets/img/home_img/xe/xe3.jpg" class="cart-img">
            <p><strong>Honda Wave RSX</strong></p>
            <i class="cart-icon fa-regular fa-pen-to-square fa-xl"></i>
            <input type="number" class="form-control" value="1" min="1" max="5">

            <p><strong>50,000 VND/ngày</strong></p>
            <i class="cart-icon fa-solid fa-trash fa-xl"></i>
          </div>
        </div>
        <div class="cart-item">
          <div class="cart-item__product">
            <img src="assets/img/home_img/xe/xe4.jpg" class="cart-img">
            <p><strong>Sirius RC</strong></p>
            <i class="cart-icon fa-regular fa-pen-to-square fa-xl"></i>
            <input type="number" class="form-control" value="1" min="1" max="5">

            <p><strong>50,000 VND/ngày</strong></p>
            <i class="cart-icon fa-solid fa-trash fa-xl"></i>
          </div>
        </div>

        <div class="cart-item">
          <div class="cart-item__product">
            <img src="assets/img/home_img/xe/xe5.jpg" class="cart-img">
            <p><strong>Liberty</strong></p>
            <i class="cart-icon fa-regular fa-pen-to-square fa-xl"></i>
            <input type="number" class="form-control" value="1" min="1" max="5">
            <p><strong>90,000 VND/ngày</strong></p>
            <i class="cart-icon fa-solid fa-trash fa-xl"></i>
          </div>
        </div>
      </div>
      <!-- col right -->
      <div class="col-right">
        <form class="rental-information" action="/submit-rental" method="post">
          <div class="info">
            <p class="note" style="font-size: 1.4rem">*Giá thuê chưa bao gồm: Xăng phục vụ suốt chuyến đi, Bảo hiểm hành khách, Thuế VAT, Phụ thu dịp Lễ Tết.</p>
          </div>
          <div class="fill-in-info">
            <div class="fill-in-item">
              <label for="coupon">Mã giảm giá</label>
              <input type="text" id="coupon" name="coupon">
              <label for="delivery-location">Địa điểm giao xe</label>
              <input type="text" id="delivery-location" name="delivery-location" required>
              <label for="delivery-time">Thời gian nhận xe</label>
              <input type="date" id="delivery-time" name="delivery-time" required>
              <label for="return-time">Thời gian trả xe</label>
              <input type="date" id="return-time" name="return-time" required>
            </div>
            <div class="button">
              <button type="submit" style="width: 100%">Đặt xe</button>
            </div>
          </div>
        </form>
      </div>
    </div>
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

