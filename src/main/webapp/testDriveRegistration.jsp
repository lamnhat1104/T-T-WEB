<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/7/2025
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký lái thử</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="csstestdrive.css">
</head>
<body>
<div class="test-drive-form">
    <div class="header">
        <div class="header__item">
            <img class="header__item-img" src="assets/img/home_img/xe/logo_xemay.png" alt="Logo">
            <span class="header__item-span">Đăng ký lái thử</span>
        </div>
    </div>

    <div class="content">
        <div class="auth-form">
            <div class="auth-form__container">
                <div class="auth-form__header">
                    <h3 class="auth-form__heading">Đăng ký lái thử xe</h3>
                </div>

                <!-- Form đăng ký lái thử -->
                <form action="submitTestDrive.jsp" method="POST" class="auth-form__form">
                    <div class="auth-form__group">
                        <label for="fullName">Họ và Tên:</label>
                        <input type="text" class="auth-form__input" id="fullName" name="fullName" required placeholder="Nhập họ và tên của bạn">
                    </div>

                    <div class="auth-form__group">
                        <label for="phone">Số điện thoại:</label>
                        <input type="text" class="auth-form__input" id="phone" name="phone" required placeholder="Nhập số điện thoại">
                    </div>

                    <div class="auth-form__group">
                        <label for="email">Email:</label>
                        <input type="email" class="auth-form__input" id="email" name="email" required placeholder="Nhập email của bạn">
                    </div>

                    <div class="auth-form__group">
                        <label for="bike">Chọn xe muốn lái thử:</label>
                        <select id="bike" name="bike" class="auth-form__input" required>
                            <option value="">Chọn xe</option>
                            <option value="Honda CBR500R">Honda CBR500R</option>
                            <option value="Yamaha R15 V4">Yamaha R15 V4</option>
                            <option value="Kawasaki Ninja 300">Kawasaki Ninja 300</option>
                            <option value="Suzuki GSX-R150">Suzuki GSX-R150</option>
                            <option value="BMW G310R">BMW G310R</option>
                        </select>
                    </div>

                    <div class="auth-form__group">
                        <label for="testDriveDate">Chọn ngày lái thử:</label>
                        <input type="date" class="auth-form__input" id="testDriveDate" name="testDriveDate" required>
                    </div>

                    <div class="auth-form__controls">
                        <button type="submit" class="btn btn--primary">Đăng ký</button>
                        <button type="button" class="btn btn--normal" onclick="window.location.href='index.jsp'">Trở lại</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
