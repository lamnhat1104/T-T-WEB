<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/10/2025
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tin tức </title>
  <link rel="stylesheet" href="csssp.css">
  <link rel="stylesheet" href="csstintuc.css">
  <link rel="stylesheet" href="csschitiettintuc.css">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/admin/admin.js"></script>
  <script>
    // Chèn header
    fetch('header.jsp')

            .then(response => response.text())
            .then(data => document.getElementById('header').innerHTML = data);

    // Chèn footer
    fetch('footer.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('footer').innerHTML = data);
  </script>
</head>

<body>
<header id="header"></header>


<!-- Kết thúc Slider -->

<div class="container">

  <h1 class="title">TIN TỨC</h1>
  <div class="news-grid">
    <div class="news-item">
      <a href="chitiettintuc.html">
        <img src="https://th.bing.com/th/id/OIP.nOQuMNs1n87kELuyfZC2qgHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain" alt="KYMCO LIKE">
        <h3>KYMCO LIKE</h3>
        <p>Xe máy, thông tin, bảng giá</p>
      </a>
    </div>
    <div class="news-item">
      <a href="chitiettintuc2.html">
        <img src="https://toplist.vn/images/800px/bao-tang-chung-tich-chien-tranh-1047109.jpg" alt="Bảo tàng Chứng tích Chiến tranh">
        <h3>Bảo tàng Chứng tích Chiến tranh - TP HCM</h3>
        <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
      </a>
    </div>
    <div class="news-item">
      <a href="chitiettintuc4.html">
        <img src=https://th.bing.com/th/id/OIP.krL2Jq3yGKVOCu8srUu5ZAHaFj?w=287&h=215&c=7&r=0&o=5&dpr=2&pid=1.7" alt="Max Nhật huyền thoại">
        <h3>Max Nhật huyền thoại</h3>
        <p>Xe máy, thông tin, bảng giá</p>
      </a>
    </div>
    <div class="news-item">
      <img src="https://toplist.vn/images/800px/pho-di-bo-nguyen-hue-1039308.jpg" alt="Phố đi bộ Nguyễn Huệ">
      <h3>Phố đi bộ Nguyễn Huệ</h3>
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
    </div>
    <div class="news-item">
      <img src="https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/3/6/1020736/5682704_2.jpg" alt="Honda Air Blade">
      <h3>Honda Air Blade: Luôn là lựa chọn hoàn hảo</h3>
      <p>Xe máy, thông tin, bảng giá</p>
    </div>
    <div class="news-item">
      <img src="https://imageproxy.ub.net/https://kinhtechungkhoan.vn/stores/news_dataimages/2022/082022/28/16/in_article/7d9d5d482d65694696ac7f0c6084ea76.jpg?rt=20220828163413" alt="Honda Vision">
      <h3>Honda Vision - Mẫu xe "quốc dân"</h3>
      <p>Xe máy, thông tin, bảng giá</p>
    </div>
    <div class="news-item">
      <img src="https://dulich9.com/wp-content/uploads/2020/06/Dia-diem-du-lich-Sai-Gon-noi-tieng-cho-Ben-Thanh.jpg" alt="Kinh nghiệm du lịch mùa Sài Gòn">
      <h3>Kinh nghiệm du lịch mùa Sài Gòn</h3>
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
    </div>
    <div class="news-item">
      <a href="chitiettintuc3.html">
        <img src="https://th.bing.com/th/id/OIP.tJkLrnvQiaANZLTo-hmA-QHaEp?w=254&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" alt="Honda Lead 125">
        <h3>Thuê xe Củ Chi đi Vũng Tàu</h3>
        <p>Xe máy, thông tin, bảng giá</p>
      </a>
    </div>
    <div class="news-item">
      <a href="chitiettintuc5.html">
        <img src="https://chothuexemayhcm.com/upload/news/chao-mung-ngay-quoc-khanh-291725298440_385x205.jpg" alt="Thue xe Củ Chi đi Vũng Tàu">
        <h3>Chào Mừng Ngày Quốc Khánh 2/9</h3>
        <p>Xe máy, thông tin, bảng giá</p>
      </a>
    </div>
    <div class="news-item">
      <img src="https://chothuexemayhcm.com/upload/news/cong-vien-tao-dan-la-phoi-xanh-cua-thanh-pho-ho-chi-minh1724001515_385x205.jpg" alt="Thue xe Củ Chi đi Vũng Tàu">
      <h3>Công viên Tao Đàn - "Lá phổi xanh" của Thành phố Hồ Chí Minh</h3>
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
    </div>
    <div class="news-item">
      <img src="https://chothuexemayhcm.com/upload/news/mon-ngon-sai-gon-noi-tieng-bon-phuong1717603530_385x205.jpg" alt="Thue xe Củ Chi đi Vũng Tàu">
      <h3>Món Ngon Sài Gòn Nổi Tiếng Bốn Phương</h3>
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
    </div>
    <div class="news-item">
      <img src="https://chothuexemayhcm.com/upload/news/chao-mung-dai-le-304-151714260161_385x205.jpg" alt="Thue xe Củ Chi đi Vũng Tàu">
      <h3>Chào mừng đại Lễ 30/4 - 1/5</h3>
      <p>Tổng hợp</p>

    </div>
  </div>
</div>
<div id="footer"></div>
</body>
</html>
