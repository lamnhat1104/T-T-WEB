<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/login.css">
  <link rel="stylesheet" href="../assets/fonts/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.css">
  <style>
          #message {
              display: none;
              color: #000;
              margin-top: 5px; /* Khoảng cách giữa input và message */
              font-size: 12px;
              padding: 5px;
              border: 1px solid #ccc;
              border-radius: 5px;
              background-color: #f9f9f9;
              position: absolute; /* Đảm bảo vị trí của nó tương đối với container */
              width: calc(100% - 10px); /* Căn chỉnh kích thước theo input */
              z-index: 1; /* Đảm bảo hiển thị trên các thành phần khác */
          }

          .auth-form__group {
              position: relative; /* Giữ message nằm trong nhóm form */
          }

          #message p {
      padding: 0 35px;
      font-size: 12px;
      }

      /* Add a green text color and a checkmark when the requirements are right */
      .valid {
      color: green;
      }

      .valid:before {
      position: relative;
      left: -35px;
      content: "✔";
      }

      /* Add a red text color and an "x" when the requirements are wrong */
      .invalid {
      color: red;
      }

      .invalid:before {
      position: relative;
      left: -35px;
      content: "✖";
      }
  </style>
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
                    <h3 class="auth-form__heading">Đổi mật khẩu</h3>
                </div>

                <!-- Thêm thẻ form và thuộc tính action để gửi dữ liệu -->
                <form action="ResetPasswordController" method="POST">
                    <input type="hidden" name="token" value="${token}">
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <input type="password" class="auth-form__input" name="password" placeholder="Mật khẩu mới" required>
                            <div id="message">
                                <h3>Mật khẩu phải chứa các kí tự sau</h3>
                                <p id="letter" class="invalid">Một kí tự <b>thường</b></p>
                                <p id="capital" class="invalid">Một kí tự <b>in hoa</b></p>
                                <p id="number" class="invalid">Một <b>số</b></p>
                                <p id="length" class="invalid">Ít nhất <b>8 kí tự</b></p>
                            </div>
                        </div>
                    </div>
                    <div style="color: red; text-align: center; size: 1.4rem" > <%= message %></div>
                    <div class="auth-form__aside">
                        <div class="auth-form__helps">
                            <a href="" class="auth-form__helps-link auth-form__helps-forgot">Quên mật khẩu</a>
                            <span class="auth-form__helps-separate"></span>
                            <a href="" class="auth-form__helps-link">Cần trợ giúp?</a>
                        </div>
                    </div>

                    <div class="auth-form__controls">
                        <button type="button" class="btn btn--normal auth-form__controls-back">TRỞ LẠI</button>
                        <button type="submit" class="btn btn--primary">ĐỔI MẬT KHẨU</button>
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

<script src="../assets/js/main.js"></script>
<script src="../assets/js/quit.js"></script>
<script src="assets/js/signin.js"></script>
</body>
</html>


