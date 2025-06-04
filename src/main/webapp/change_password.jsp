<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        #message {
            display: none;
            color: #000;
            margin-top: 5px;
            font-size: 12px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            position: absolute;
            width: calc(100% - 10px);
            z-index: 1;
        }
        .auth-form__group {
            position: relative;
        }
        #message p {
            padding: 0 35px;
            font-size: 12px;
        }
        .valid {
            color: green;
        }
        .valid:before {
            position: relative;
            left: -35px;
            content: "✔";
        }
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
    String msg = request.getParameter("message");
%>
<c:if test="${param.message == 'changed'}">
    <div style="color: green; text-align: center; margin-bottom: 10px">
        Đổi mật khẩu thành công. Vui lòng đăng nhập lại.
    </div>
</c:if>

<%
    String message = (String) request.getAttribute("message");
    message = message == null ? "" : message;
%>
<div class="login">
    <div class="header">
        <div class="header__item">
            <img class="header__item-img" src="assets/img/home_img/xe/logo_xemay.png">
            <span class="header__item-span">Đổi mật khẩu</span>
        </div>
    </div>

    <div class="content">
        <div class="content__item">
            <img class="content__item-img" src="assets/img/home_img/xe/login_background.jpg" width="100%"/>
        </div>
        <div class="auth-form">
            <div class="auth-form__container">
                <div class="auth-form__header">
                    <h3 class="auth-form__heading">Đổi mật khẩu</h3>
                </div>

                <form action="ResetPasswordController" method="POST">
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <input type="password" class="auth-form__input" name="password" placeholder="Mật khẩu mới" required>
                            <input type="password" class="auth-form__input" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                            <div id="message">
                                <h3>Mật khẩu phải chứa các kí tự sau</h3>
                                <p id="letter" class="invalid">Một kí tự <b>thường</b></p>
                                <p id="capital" class="invalid">Một kí tự <b>in hoa</b></p>
                                <p id="number" class="invalid">Một <b>số</b></p>
                                <p id="length" class="invalid">Ít nhất <b>8 kí tự</b></p>
                            </div>
                        </div>
                    </div>

                    <c:if test="${not empty message}">
                        <div style="color: red; text-align: center; font-size: 1.4rem">${message}</div>
                    </c:if>

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

<script>
    document.querySelector('.auth-form__controls-back').onclick = function () {
        window.history.back();
    };
</script>
<c:if test="${changeSuccess == true}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: 'Đổi mật khẩu thành công! Bạn sẽ được chuyển đến trang đăng nhập.',
            confirmButtonText: 'OK'
        }).then(() => {
            window.location.href = 'login.jsp';
        });
    </script>
</c:if>

</body>
</html>
