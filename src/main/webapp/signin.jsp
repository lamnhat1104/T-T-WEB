<%--
  Created by IntelliJ IDEA.
  User: phuc1
  Date: 1/5/2025
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="assets/css/signin.css">
    <link rel="stylesheet" href="assets/css/base.css">
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
    String email = (String) request.getAttribute("email");
    String name = (String) request.getAttribute("name");
    String birthday = (String) request.getAttribute("birthday");
    String address = (String) request.getAttribute("address");
    String password = (String) request.getAttribute("password");
    String emailExist = (String) request.getAttribute("emailExist");

    email = (email == null ? "" : email);
    name = (name == null ? "" : name);
    address = (address == null ? "" : address);
    password = (password == null ? "" : password);
    emailExist = (emailExist == null ? "" : emailExist);
%>

<div class="login">
    <div class="header">
        <div class="header__item">
            <img class="header__item-img" src="assets/img/home_img/xe/logo_xemay.png">
            <span class="header__item-span">
            Đăng ký
            </span>
        </div>
    </div>

    <div class="content">
        <div class="content__item">
            <img class="content__item-img" src="assets/img/home_img/xe/login_background.jpg" height=800px width=100%/></div>
        <div class="auth-form">
            <div class="auth-form__container">
                <div class="auth-form__header">
                    <h3 class="auth-form__heading">Đăng ký</h3>
                    <a class="auth-form__switch-b" href="login.jsp">Đăng nhập</a>
                </div>
                <form class="auth-form__group" method="post" action="SignIn" >
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <label for="email">Email </label>
                            <input type="email" id="email" name="email" class="auth-form__input" placeholder="Email của bạn" value="<%=email%>" required>
                            <div id="email-exist"><%= emailExist %><div>
                        </div>
                        <div class="auth-form__group">
                            <label for="name">Họ và tên của bạn</label>
                            <input type="text" id ="name" name="name" class="auth-form__input" placeholder="Họ và tên của bạn" value="<%=name%>"required>
                        </div>
                        <div class="auth-form__group">
                            <label for="birthday">Sinh nhật</label>
                            <input type="date" id="birthday" name="birthday" class="auth-form__input" value="<%=birthday%>"required>
                        </div>
                        <div class="auth-form__group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" id="address" name="address" class="auth-form__input" placeholder="Địa chỉ của bạn" value="<%=address%>" required>
                        </div>
                        <div class="auth-form__group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" id="password" name="password" class="auth-form__input" placeholder="Mật khẩu của bạn" value="<%=password%>" required>
                            <div id="message">
                                <h3>Mật khẩu phải chứa các kí tự sau</h3>
                                <p id="letter" class="invalid">Một kí tự <b>thường</b></p>
                                <p id="capital" class="invalid">Một kí tự <b>in hoa</b></p>
                                <p id="number" class="invalid">Một <b>số</b></p>
                                <p id="length" class="invalid">Ít nhất <b>8 kí tự</b></p>
                            </div>
                        </div>

                        <div class="auth-form__group">
                            <label for="password-confirm">Xác nhận mật khẩu</label>
                            <input type="password" id="password-confirm" class="auth-form__input" placeholder="Nhập lại mật khẩu" required>
                        </div>
                    </div>


                    <div class="auth-form__aside">
                        <p class="auth-form__policy-text">
                            Bằng việc đăng ký, bạn đã đồng ý với NNP về
                            <a href="" class="auth-form__text-link">Điều khoản dịch vụ </a>&
                            <a href="" class="auth-form__text-link">Chính sách bảo mật</a>
                        </p>
                    </div>

                    <div class="auth-form__controls">
                        <button
                            type="button"
                            class="btn btn--normal auth-form__controls-back"
                            onclick="window.location.href='index.jsp'">
                            TRỞ LẠI
                        </button>
                        <button type="submit" class="btn btn--primary">ĐĂNG KÝ</button>
                    </div>
                </form>
            </div>

            <div class="social-container">
                <div class="auth-form__socials">
                    <a href="" class="auth-form__socials--facebook btn btn__size-s btn--with-icon">
                        <i class="auth-form__socials-icon fa-brands fa-square-facebook"></i>
                        <span class="auth-form__socials-title">
                  Kết nối với Facebook
                </span>
                    </a>
                    <a href="" class="auth-form__socials--google btn btn__size-s btn--with-icon">
                        <i class="auth-form__socials-icon fa-brands fa-google"></i>
                        <span class="auth-form__socials-title">
                        Kết nối với Google
                </span>
                    </a>
                </div>
            </div>
        </div>
    </div>


</div>
<script src="assets/js/signin.js"></script>
</body>
</html>

