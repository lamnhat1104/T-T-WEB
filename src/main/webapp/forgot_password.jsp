<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/login.css">
  <link rel="stylesheet" href="../assets/fonts/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.css">
</head>
<body>
<%
    String message = (String) request.getAttribute("message");
    message = message==null? "":message;
%>
<div class="login">
  <div class="header">
    <div class="header__item">
      <img class="header__item-img" src="assets/img/home_img/xe/logo_xemay.png">
      <span class="header__item-span">
          Đăng nhập
        </span>
    </div>
  </div>

  <div class="content">
    <div class="content__item">
      <img class="content__item-img" src="assets/img/home_img/xe/login_background.jpg" width=100%/>
    </div>
    <div class="auth-form">
      <div class="auth-form__container">
        <div class="auth-form__header">
          <h3 class="auth-form__heading">Quên mật khẩu</h3>
        </div>
        <form action="ForgotPasswordController" method="POST">
        <div class="auth-form__form">
          <div class="auth-form__group">
            <input type="text" name = "email" class="auth-form__input" placeholder="Email của bạn">
          </div>
        </div>
        <div style="color: red; text-align: center; size: 1.4rem" > <%= message %></div>
        <div class="auth-form__controls">
          <button type = "button" class="btn btn--normal auth-form__controls-back">TRỞ LẠI</button>
          <button type = "submit" class="btn btn--primary">XÁC NHẬN</button>
        </div>
        </form>
      </div>
      <div class="social-container">
        <div class="auth-form__socials">
          <a href="" class="auth-form__socials--facebook btn btn__size-s btn--with-icon">
            <i class="auth-form__socials-icon fa-brands fa-square-facebook"></i>
            <span class="auth-form__socials-title">
                        Đăng nhập với Facebook
                      </span>
          </a>
          <a href="" class="auth-form__socials--google btn btn__size-s btn--with-icon">
            <i class="auth-form__socials-icon fa-brands fa-google"></i>
            <span class="auth-form__socials-title">
                        Đăng nhập với Google
                      </span>
          </a>
        </div>
      </div>
    </div>
  </div>


</div>
</body>
</html>

