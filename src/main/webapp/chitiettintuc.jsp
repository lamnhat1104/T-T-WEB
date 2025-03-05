<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/10/2025
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang tin tức 1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../csstintuc/csschitiettintuc.css">
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
    <div class="content">
        <h1 class="title">KYMCO Like</h1>
        <p class="description">
            <strong>Kymco</strong> là thương hiệu Đài Loan được thừa hưởng và phát triển trên nền tảng chủ đạo của người "anh cả" Honda Nhật Bản, đặc biệt ở khía cạnh bền bỉ cũng như khả năng vận hành.
        </p>
        <img src="../../anh/tintuc/1.jpg" alt="KYMCO Like" class="main-image">
        <ul class="features">
            <li>Mẫu xe ga <strong>Kymco Like</strong> có kiểu thiết kế phù hợp dành cho người Việt.</li>
            <li>Hệ thống đèn LED cao cấp trước và sau mang phong cách Châu Âu tạo điểm nhấn cho chiếc xe này.</li>
            <li>Yên xe dày và êm ái nhưng không quá cao (khoảng <strong>760mm</strong>), phù hợp với đa số người dùng.</li>
            <li>Đặc biệt là các bạn nữ sinh, kích thước yên xe rộng rãi mang đến cảm giác thoải mái nhất mỗi khi ngồi.</li>
        </ul>
    </div>
    <div class="related-articles">
        <h2>Các bài viết liên quan</h2>
        <div class="article-list">

            <div class="article-item">
                <a href="chitiettintuc2.html">
                    <img src="../../anh/tintuc/5.jpg" alt="Bài viết 1">
                    <h3>Bảo tàng Chứng tích Chiến tranh - TP HCM</h3>
                    <p>du lịch, tổng hợp, cẩm nang, Sài Gòn .</p>
                </a>
            </div>
            <div class="article-item">
                <a href="chitiettintuc3.html">
                    <img src="../../anh/tintuc/9.jpg" alt="Bài viết 2">
                    <h3>Thuê xe Củ Chi đi Vũng Tàu</h3>
                    <p>Đầu tiên, nên chọn đúng loại xe phù hợp với nhu cầu sử dụng.</p>
                </a>
            </div>
            <div class="article-item">
                <a href="chitiettintuc4.html">
                    <img src="../../anh/tintuc/2.jpg" alt="Bài viết 3">
                    <h3>Max Nhật huyền thoại</h3>
                    <p>Xe máy, thông tin, bảng giá</p>
                </a>
            </div>
        </div>
    </div>
</div>

<div id="footer"></div>
</body>

</html>

