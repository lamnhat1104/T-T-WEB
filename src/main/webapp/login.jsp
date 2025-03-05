<%--
  Created by IntelliJ IDEA.
  User: phuc1
  Date: 1/6/2025
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.css">
</head>
<body>
<%
    String error = (String) request.getAttribute("error");
    error = error==null? "":error;
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
            <img class="content__item-img" src="assets/img/home_img/xe/login_background.jpg" width=100%>
        </div>
        <div class="auth-form">
            <div class="auth-form__container">
                <div class="auth-form__header">
                    <h3 class="auth-form__heading">Đăng nhập</h3>
                    <a class="auth-form__switch-b" href="signin.jsp">Đăng ký</a>
                </div>

                <!-- Thêm thẻ form ở đây -->
                <form action="Login" method="POST" class="auth-form__form">
                    <!-- Input Email -->
                    <div class="auth-form__group">
                        <input
                            type="email"
                            class="auth-form__input"
                            placeholder="Email của bạn"
                            name="email"
                            required
                            autocomplete="email">
                    </div>

                    <!-- Input Password -->
                    <div class="auth-form__group">
                        <input
                            type="password"
                            class="auth-form__input"
                            placeholder="Mật khẩu của bạn"
                            name="password"
                            required
                            autocomplete="current-password">
                    </div>
                    <div style="color: red; text-align: center; size: 1.4rem" > <%= error %></div>

                    <!-- Links -->
                    <div class="auth-form__aside">
                        <div class="auth-form__helps">
                            <a href="forgot_password.jsp" class="auth-form__helps-link auth-form__helps-forgot">Quên mật khẩu</a>
                            <span class="auth-form__helps-separate"></span>
                            <a href="#" class="auth-form__helps-link">Cần trợ giúp?</a>
                        </div>
                    </div>

                    <!-- Controls -->
                    <div class="auth-form__controls">
                        <!-- Button "Trở lại" -->
                        <button
                            type="button"
                            class="btn btn--normal auth-form__controls-back"
                            onclick="window.location.href='index.jsp'">
                            TRỞ LẠI
                        </button>

                        <!-- Button "Đăng nhập" -->
                        <button type="submit" class="btn btn--primary">ĐĂNG NHẬP</button>
                    </div>
                </form>


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
</div>
</body>
</html>
