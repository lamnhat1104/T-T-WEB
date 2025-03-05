<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chính Sách Thuê Xe Máy</title>
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/policy.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<header id="header"></header>
<div class="wrapper">
  <main>
    <h1>Chính Sách Thuê Xe Máy</h1>
    <section>
      <button class="accordion">1. Điều Kiện Thuê Xe</button>
      <div class="panel">
        <ul>
          <li>Khách hàng phải từ đủ 18 tuổi trở lên.</li>
          <li>Yêu cầu giấy tờ hợp lệ:
            <ul>
              <li>Chứng minh nhân dân (CMND)/Căn cước công dân (CCCD) hoặc Hộ chiếu.</li>
              <li>Bằng lái xe hạng A1 hoặc A2 (tùy loại xe).</li>
            </ul>
          </li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">2. Quy Định Về Thanh Toán</button>
      <div class="panel">
        <p>Thanh toán được thực hiện trước khi nhận xe. Các hình thức thanh toán hỗ trợ: tiền mặt, chuyển khoản hoặc ví điện tử.</p>
      </div>
    </section>

    <section>
      <button class="accordion">3. Quy Định Về Thời Gian Thuê</button>
      <div class="panel">
        <ul>
          <li>Thời gian thuê tối thiểu: 1 ngày.</li>
          <li>Thời gian trả xe: trước 20:00 mỗi ngày (trừ khi có thỏa thuận khác).</li>
          <li>Trả xe muộn sẽ bị tính phí phụ thu: <strong>X%</strong>/giờ.</li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">4. Trách Nhiệm Của Khách Hàng</button>
      <div class="panel">
        <ul>
          <li>Khách hàng phải giữ gìn xe cẩn thận và chịu trách nhiệm sửa chữa nếu xảy ra hư hỏng.</li>
          <li>Không sử dụng xe cho mục đích vi phạm pháp luật.</li>
          <li>Nghiêm cấm cho thuê lại hoặc sang nhượng xe cho bên thứ ba.</li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">5. Trách Nhiệm Của Công Ty</button>
      <div class="panel">
        <ul>
          <li>Bảo đảm xe luôn trong tình trạng tốt trước khi giao cho khách hàng.</li>
          <li>Hỗ trợ khách hàng trong trường hợp xe gặp sự cố kỹ thuật.</li>
          <li>Cung cấp các loại bảo hiểm cơ bản (nếu có).</li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">6. Chính Sách Hủy Thuê Xe</button>
      <div class="panel">
        <ul>
          <li>Hủy trước 24 giờ: không mất phí.</li>
          <li>Hủy trong vòng 24 giờ: mất phí <strong>10%</strong> tổng giá trị thuê.</li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">7. Bảo Hiểm Và Sự Cố</button>
      <div class="panel">
        <ul>
          <li>Mọi xe đều được trang bị bảo hiểm trách nhiệm dân sự theo quy định.</li>
          <li>Khách hàng tự chịu chi phí sửa chữa hoặc bồi thường trong trường hợp tai nạn do lỗi cá nhân.</li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">8. Chính Sách Khi Xe Bị Tạm Giữ</button>
      <div class="panel">
        <ul>
          <li><strong>Trách Nhiệm Của Khách Hàng:</strong> Khách hàng phải chịu trách nhiệm hoàn toàn trong trường hợp xe bị cơ quan chức năng tạm giữ do:
            <ul>
              <li>Vi phạm luật giao thông.</li>
              <li>Sử dụng xe cho mục đích trái pháp luật.</li>
              <li>Không cung cấp đủ giấy tờ liên quan khi được yêu cầu.</li>
            </ul>
          </li>
          <li><strong>Phí Phạt Và Thời Gian Tạm Giữ:</strong>
            <ul>
              <li>Khách hàng phải thanh toán toàn bộ chi phí phát sinh để lấy lại xe.</li>
              <li>Trong thời gian xe bị tạm giữ, khách hàng vẫn phải thanh toán phí thuê xe tương ứng với số ngày xe bị giữ.</li>
            </ul>
          </li>
          <li><strong>Hỗ Trợ Từ Công Ty:</strong> Công ty hỗ trợ cung cấp giấy tờ xe cần thiết (nếu bị thiếu) và hướng dẫn khách hàng trong quá trình xử lý sự cố.</li>
        </ul>
      </div>
    </section>

    <section>
      <button class="accordion">9. Liên Hệ Hỗ Trợ</button>
      <div class="panel">
        <p>Nếu bạn cần hỗ trợ, vui lòng liên hệ qua:</p>
        <ul>
          <li><strong>Số điện thoại:</strong> 0908889999</li>
          <li><strong>Email:</strong> nnp@email.com</li>
          <li><strong>Địa chỉ:</strong> Trường đại học Nông Lâm Hồ Chí Minh</li>
        </ul>
        <p>Chúng tôi cam kết cung cấp dịch vụ tốt nhất để chuyến đi của bạn trở nên an toàn và tiện lợi.</p>
      </div>
    </section>
  </main>
</div>
<footer id="footer"></footer>
<script>
  var acc = document.getElementsByClassName("accordion");
  var i;

  for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var panel = this.nextElementSibling;
      if (panel.style.maxHeight) {
        panel.style.maxHeight = null;
      } else {
        panel.style.maxHeight = panel.scrollHeight + "px";
      }
    });
  }
</script>
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
</body>
</html>

