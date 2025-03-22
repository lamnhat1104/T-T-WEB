<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0">
  <title>Trang admin</title>
  <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
</head>
<body>
<input type="checkbox" id="nav-toggle">

<div class="sidebar">
  <div class="sidebar-brand">
    <h2><span>Rental Motorbike</span></h2>

  </div>

  <div class="sidebar-menu">
    <ul>
      <li>
        <a href="/demo/admin?action=dashboard">
          <span class="las la-igloo"></span>
          <span>Dashboard</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerCustomer"><span class="las la-users"></span>
          <span>Quản lý khách hàng</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerVehicleType"><span class="las la-motorcycle"></span>
          <span>Quản lý xe máy</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerOrder"><span class="las la-shopping-bag"></span>
          <span>Quản lý đơn hàng</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerNew"><span class="las la-newspaper"></span>
          <span>Quản lý tin tức</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerContact" class="dashboard-active"><span class="las la-receipt"></span>
          <span>Phản hồi khách hàng</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerPromotion"><span class="las la-ticket-alt"></span>
          <span>Quản lý khuyến mãi</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerStatMotor"><span class="las la-circle"></span>
          <span>Thống kê xe máy</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerStatIncome"><span class="las la-clipboard-list"></span>
          <span>Thống kê doanh thu</span></a>
      </li>
      <li>
        <a href="/demo/admin?action=managerSetting"><span class="las la-cog"></span>
          <span>Cài đặt</span></a>
      </li>
    </ul>
  </div>
</div>

<div class="main-content">
  <header>
    <h2>
      <label for="nav-toggle" >
        <span class="las la-bars"></span>
      </label>
      Phản hồi
    </h2>

    <div class="search-wrapper">
      <span class="las la-search"></span>
      <input type="search" placeholder="Tìm kiếm tại đây"/>
    </div>

    <div class="user-wrapper">
      <img src="../assets/img/home_img/user.png" height="40" width="40">
      <div>
        <h4>admin</h4>
        <small>NNP</small>
      </div>
    </div>
  </header>
  <main>

    <div class="recent-grid">
      <div class="projects">
        <div class="card">
          <div class="card-header">
            <h3>Phản hồi</h3>
            <button> Xem tất cả<span class="las la-arrow-right"></span> </button>
          </div>

          <div class="card-body">
            <table width="100%">
              <thead>
              <tr>
                <th>ID</th>
                <th>Tên khách hàng</th>
                <th>Email</th>
                <th>Nội dung phản hồi</th>
                <th>Ngày gửi</th>
                <th>Trạng thái</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>FB001</td>
                <td>Nguyễn Văn A</td>
                <td>vana@gmail.com</td>
                <td>Dịch vụ rất tốt!</td>
                <td>14/11/2023</td>
                <td>Đã xử lý</td>
              </tr>
              <tr>
                <td>FB002</td>
                <td>Trần Thị B</td>
                <td>thib@gmail.com</td>
                <td>Xe sạch và mới, tôi rất hài lòng.</td>
                <td>13/11/2023</td>
                <td>Đang xử lý</td>
              </tr>
              <tr>
                <td>FB001</td>
                <td>Nguyễn Văn A</td>
                <td>vana@gmail.com</td>
                <td>Dịch vụ rất tốt!</td>
                <td>14/11/2023</td>
                <td>Đã xử lý</td>
              </tr>
              <tr>
                <td>FB002</td>
                <td>Trần Thị B</td>
                <td>thib@gmail.com</td>
                <td>Xe sạch và mới, tôi rất hài lòng.</td>
                <td>13/11/2023</td>
                <td>Đang xử lý</td>
              </tr>
              <tr>
                <td>FB001</td>
                <td>Nguyễn Văn A</td>
                <td>vana@gmail.com</td>
                <td>Dịch vụ rất tốt!</td>
                <td>14/11/2023</td>
                <td>Đã xử lý</td>
              </tr>
              <tr>
                <td>FB002</td>
                <td>Trần Thị B</td>
                <td>thib@gmail.com</td>
                <td>Xe sạch và mới, tôi rất hài lòng.</td>
                <td>13/11/2023</td>
                <td>Đang xử lý</td>
              </tr>
              <tr>
                <td>FB001</td>
                <td>Nguyễn Văn A</td>
                <td>vana@gmail.com</td>
                <td>Dịch vụ rất tốt!</td>
                <td>14/11/2023</td>
                <td>Đã xử lý</td>
              </tr>
              <tr>
                <td>FB002</td>
                <td>Trần Thị B</td>
                <td>thib@gmail.com</td>
                <td>Xe sạch và mới, tôi rất hài lòng.</td>
                <td>13/11/2023</td>
                <td>Đang xử lý</td>
              </tr>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </main>

</div>
</body>
</html>