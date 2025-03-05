<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/10/2025
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tin tức</title>
  <link rel="stylesheet" href="../csstintuc/csstintuc.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
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
</head>
<body>
<header id="header"></header>
<div class="slider">
  <div id="carouselExample" class="carousel slide mb-4">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="../../anh/tintuc/11.jpg" class="d-block w-100" alt="Slide 1">
        <div class="carousel-caption d-none d-md-block">

        </div>
      </div>
      <div class="carousel-item">
        <img src="../../anh/tintuc/12.jpg" class="d-block w-100" alt="Slide 2">
        <div class="carousel-caption d-none d-md-block">
        </div>
      </div>
      <div class="carousel-item">
        <img src="../../anh/tintuc/12.jpg" class="d-block w-100" alt="Slide 3">
        <div class="carousel-caption d-none d-md-block">
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>
<!-- Kết thúc Slider -->

<div class="container">

  <h1 class="title">TIN TỨC</h1>
  <div class="news-grid">
    <div class="news-item">
      <a href="chitiettintuc.html">
        <img src="../../anh/tintuc/1.jpg" alt="KYMCO LIKE">
        <h3>KYMCO LIKE</h3>
        <p>Xe máy, thông tin, bảng giá</p>
      </a>
    </div>
    <div class="news-item">
      <a href="chitiettintuc2.html">
        <img src="../../anh/tintuc/5.jpg" alt="Bảo tàng Chứng tích Chiến tranh">
        <h3>Bảo tàng Chứng tích Chiến tranh - TP HCM</h3>
        <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
      </a>
    </div>
    <div class="news-item">
      <a href="chitiettintuc4.html">
        <img src="../../anh/tintuc/2.jpg" alt="Max Nhật huyền thoại">
        <h3>Max Nhật huyền thoại</h3>
        <p>Xe máy, thông tin, bảng giá</p>
      </a>
    </div>
    <div class="news-item">
      <img src="../../anh/tintuc/6.jpg" alt="Phố đi bộ Nguyễn Huệ">
      <h3>Phố đi bộ Nguyễn Huệ</h3>
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
    </div>
    <div class="news-item">
      <img src="../../anh/tintuc/3.jpg" alt="Honda Air Blade">
      <h3>Honda Air Blade: Luôn là lựa chọn hoàn hảo</h3>
      <p>Xe máy, thông tin, bảng giá</p>
    </div>
    <div class="news-item">
      <img src="../../anh/tintuc/7.jpg" alt="Honda Vision">
      <h3>Honda Vision - Mẫu xe "quốc dân"</h3>
      <p>Xe máy, thông tin, bảng giá</p>
    </div>
    <div class="news-item">
      <img src="../../anh/tintuc/4.jpg" alt="Kinh nghiệm du lịch mùa Sài Gòn">
      <h3>Kinh nghiệm du lịch mùa Sài Gòn</h3>
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn</p>
    </div>
    <div class="news-item">
      <a href="chitiettintuc3.html">
        <img src="../../anh/tintuc/9.jpg" alt="Honda Lead 125">
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
      <p>du lịch, tổng hợp, cẩm nang, Sài Gòn/p>
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
