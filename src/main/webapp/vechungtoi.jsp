<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/3/2025
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Về Chúng Tôi</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
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
      <img src="assets/img/history.jpg" class="img-fluid rounded" alt="Lịch sử phát triển">
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-6">
      <h3>Sứ Mệnh</h3>
      <p>Chúng tôi cam kết mang đến cho khách hàng những chiếc xe máy chất lượng, giá cả hợp lý và dịch vụ hậu mãi tốt nhất.</p>
    </div>
    <div class="col-md-6">
      <img src="assets/img/mission.jpg" class="img-fluid rounded" alt="Sứ mệnh">
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-6">
      <img src="assets/img/our-team.jpg" class="img-fluid rounded" alt="Đội ngũ">
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
    <div class="col-md-6">
      <img src="assets/img/values.jpg" class="img-fluid rounded" alt="Giá trị cốt lõi">
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-6">
      <img src="assets/img/customer-feedback.jpg" class="img-fluid rounded" alt="Phản hồi khách hàng">
    </div>
    <div class="col-md-6">
      <h3>Phản Hồi Từ Khách Hàng</h3>
      <p>Chúng tôi tự hào khi nhận được sự tin tưởng và đánh giá cao từ hàng ngàn khách hàng trên khắp cả nước.</p>
    </div>
  </div>

</div>

<div id="footer"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
