<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/25/2024
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/header.css">

</head>
<body>

<header class="header">
    <div class="grid">
        <nav class="header__navbar">
            <ul class="header__navbar-list">
                <li class="header__navbar-item ">
                    <a class="header__navbar-item-link" href="">Trang chủ</a>
                </li>
                <li class="header__navbar-item ">
                    <a class="header__navbar-item-link" href="">Xe</a>
                </li>
                <li class="header__navbar-item ">
                    <a class="header__navbar-item-link" href="">Tin tức</a>
                </li>
                <li class="header__navbar-item ">
                    <a class="header__navbar-item-link" href="">Về chúng tôi</a>
                </li>
                <li class="header__navbar-item ">
                    <a class="header__navbar-item-link" href="">Liên hệ</a>
                </li>

            </ul>
            <ul class="header__navbar-list">

                <!--            <li class="header__navbar-item header__navbar-item&#45;&#45;strong header__navbar-item&#45;&#45;separate">Đăng ký</li>-->
                <!--            <li class="header__navbar-item header__navbar-item&#45;&#45;strong">Đăng nhập</li>-->
                <li class="header__navbar-item header__navbar-user">
                    <img class="header__navbar-user-img" src="assets/img/home_img/user.png"/>
                    <span class="header__navbar-user-name">Nhật Lâm</span>

                    <ul class="header__navbar-user-menu">
                        <li class="header__navbar-user-item">
                            <a href="">Tài khoản của tôi</a>
                        </li>
                        <li class="header__navbar-user-item">
                            <a href="">Địa chỉ của tôi</a>
                        </li>
                        <li class="header__navbar-user-item">
                            <a href="">Lịch sử thuê</a>
                        </li>
                        <li class="header__navbar-user-item header__navbar-user-item-separate">
                            <a href="">Đăng xuất</a>
                        </li>

                    </ul>
                </li>
            </ul>
        </nav>

        <!--        Header with search-->
        <div class="header-with-search">
            <div class="header__logo">


                <img class="header__logo-img" src="assets/img/home_img/xe/logo_xemay.png"/>

            </div>
            <div class="header__search">
                <div class="header__search-input-wrap">
                    <input type="search" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm">

                    <!-- Search History-->
                    <div class="header__search-history">
                        <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                        <ul class="header__search-history-list">
                            <li class="header__search-history-item">
                                <a href="">Wave RSX</a>
                            </li>
                            <li class="header__search-history-item">
                                <a href="">Xì po</a>
                            </li>
                            <li class="header__search-history-item">
                                <a href="">Wave alpha</a>
                            </li>
                        </ul>
                    </div>
                </div>


                <button class="header__search-btn">
                    <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                </button>
            </div>

            <!--Cart Layout -->
            <div class="header__cart">
                <div class="header__cart-wrap">
                    <i class="header__cart-icon fa-solid fa-cart-shopping"></i>
                    <span class="header__cart-notice">1</span>

                    <!--              No cart: header__cart-list--no-cart-->
                    <div class="header__cart-list">
                        <img class="header__cart-no-cart-img" src="../../assets/img/header-img/noCart.png">
                        <span class="header__cart-no-cart-msg">Chưa có sản phẩm</span>
                        <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                        <ul class="header__cart-list-item">
                            <li class="header__cart-item">
                                <img src="assets/img/product-img/Wave-110.png" alt="" class="header__cart-img">
                                <div class="header__cart-item-info">
                                    <div class="header__cart-item-head">
                                        <h5 class="header__cart-item-name">Wave RSX</h5>
                                        <div class="header__cart-item-price-wrap">
                                            <span class="header__cart-item-price">100.000đ/Ngày</span>
                                            <span class="header__cart-item-multiply">x</span>
                                            <span class="header__cart-item-qnt">1</span>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>

                        <a href="" class="header__cart-view-cart btn btn--primary">Xem giỏ hàng</a>
                    </div>

                </div>

            </div>
        </div>
    </div>

</header>
</body>
