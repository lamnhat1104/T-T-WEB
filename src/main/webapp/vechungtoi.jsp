<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/3/2025
  Time: 11:08 PM
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
  <title>Về chúng tôi </title>

  <link rel="stylesheet" href="cssvechungtoi.css">
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

<div class="container mt-5">
  <h1 class="text-center">Về Chúng Tôi</h1>
  <p class="text-center">Chào mừng bạn đến với trang web bán xe máy của chúng tôi - nơi cung cấp những mẫu xe chất lượng với dịch vụ tốt nhất.</p>

  <div class="row mt-4">
    <div class="col-md-6">
      <h3>Lịch Sử Phát Triển</h3>
      <p>Thành lập từ năm 2010, chúng tôi đã không ngừng phát triển và mở rộng để trở thành một trong những đơn vị hàng đầu trong lĩnh vực phân phối xe máy chất lượng cao.</p>
    </div>
    <div class="col-md-6">
      <img src="https://th.bing.com/th/id/OIP.gBV_bL52rjVlZ2IRoKkWGgHaFd?w=221&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" class="img-fluid rounded" alt="Lịch sử phát triển">
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-6">
      <h3>Sứ Mệnh</h3>
      <p>Chúng tôi cam kết mang đến cho khách hàng những chiếc xe máy chất lượng, giá cả hợp lý và dịch vụ hậu mãi tốt nhất.</p>
    </div>
    <div class="col-md-6">
      <img src="https://th.bing.com/th/id/OIP.ZFIPB7sR70N23HVLVPI-KwHaEo?w=213&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" class="img-fluid rounded" alt="Sứ mệnh">
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-6">
      <img src="https://th.bing.com/th/id/OIP.LZj-OEPb6VB6__mYovxLfAHaEh?w=292&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" class="img-fluid rounded" alt="Đội ngũ">
    </div>
    <div class="col-md-6">
      <h3>Đội Ngũ Của Chúng Tôi</h3>
      <p>Với đội ngũ chuyên viên tận tâm và giàu kinh nghiệm, chúng tôi sẵn sàng hỗ trợ khách hàng trong quá trình chọn xe và sử dụng dịch vụ.</p>
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-6">
      <h3>Giá Trị Cốt Lõi</h3>
      <ul>
        <li>Chất lượng sản phẩm là ưu tiên hàng đầu</li>
        <li>Khách hàng là trung tâm</li>
        <li>Dịch vụ tận tâm, chuyên nghiệp</li>
        <li>Phát triển bền vững và đổi mới</li>
      </ul>
    </div>

  </div>
  <h3>Phản Hồi Từ Khách Hàng</h3>
  <div class="row mt-4">
    <div class="col-md-6">
      <img src="https://th.bing.com/th/id/OIP.OA2QOrbTE0c93ZtIaCqcaQHaDt?w=303&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" class="img-fluid rounded" alt="Phản hồi khách hàng">
    </div>
    <div class="col-md-6">
      <p>Chúng tôi tự hào khi nhận được sự tin tưởng và đánh giá cao từ hàng ngàn khách hàng trên khắp cả nước.</p>
    </div>
  </div>

</div>

<div id="footer"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
