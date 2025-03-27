<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0">
  <title>Trang admin</title>
  <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

  <style>
    .modal {
      display: none; /* Hidden by default */
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    .modal-content {
      background-color: #fefefe;
      margin: auto; /* Centered */
      padding: 20px;
      border: 1px solid #888;
      width: 50%; /* Smaller size */
      max-width: 500px; /* Ensures it doesn't get too wide */
    }

    .invoice-modal {
      width: 100%;
      margin: 80px auto;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
      padding: 20px;
      position: relative;
    }

    .invoice-header {
      text-align: center;
      position: relative;
    }

    .invoice-header h2 {
      font-size: 24px;
      margin: 0;
    }

    .close-btn {
      position: absolute;
      right: 20px;
      top: 10px;
      font-size: 20px;
      cursor: pointer;
      color: #999;
    }

    .invoice-table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    .invoice-table th,
    .invoice-table td {
      color: black;
      padding: 10px;
      text-align: left;
      border: 1px solid #ddd;
    }

    .invoice-table th {
      background-color: #f9f9f9;
      font-weight: bold;
    }

    .invoice-total {
      text-align: right;
      margin-top: 20px;
      font-size: 18px;
      color: #ff9800;
      font-weight: bold;
    }
  </style>
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
              <a href="/demo/admin?action=dashboard" >
                  <span class="las la-igloo"></span>
                  <span>Dashboard</span></a>
          </li>
          <li>
              <a href="/demo/admin?action=managerCustomer" class="customers-active"><span class="las la-users"></span>
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
              <a href="/demo/admin?action=managerContact"><span class="las la-receipt"></span>
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
      Khách hàng
    </h2>

    <div class="search-wrapper">
      <span class="las la-search"></span>
      <input type="search" placeholder="Tìm kiếm tại đây"/>
    </div>

    <div class="user-wrapper">
      <img src="../assets/img/home_img/user.png" height="40" width="40"/>
      <div>
        <h4>Admin</h4>
        <small>NNP</small>
      </div>
    </div>
  </header>
  <main>

    <div class="recent-grid">
      <div class="projects">
        <div class="card">
          <div class="card-header">
            <h3>Khách hàng</h3>
            <button> Thêm khách hàng</button>
            <button class="card-header-btn"> Xóa khách hàng</button>

          </div>

          <div class="card-body">
            <table id="customerTable" width="100%">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Họ tên</th>
                  <th>Ngày sinh</th>
                  <th>Email</th>
                  <th>Số điện thoại</th>
                  <th>Địa chỉ</th>
                  <th>Vai trò</th>
                  <th>Trạng thái</th>
                  <th>Hành động</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${not empty users}">
                  <c:forEach var="u" items="${users}">
                    <tr>
                      <td>${u.id}</td>
                      <td>${u.userInfo.fullName}</td>
                      <td>${u.userInfo.birthday}</td>
                      <td>${u.email}</td>
                      <td>${u.userInfo.phoneNumber}</td>
                      <td>${u.userInfo.address}</td>
                      <td>
                        <form action="admin" method="get">
                          <input type="hidden" name="action" value="changeRoleUser" />
                          <input type="hidden" name="userId" value="${u.id}" />
                          <select name="roleId" onchange="this.form.submit()">
                            <option value="1" ${u.roleId == 1 ? 'selected' : ''}>Admin</option>
                            <option value="2" ${u.roleId == 2 ? 'selected' : ''}>Người dùng thường</option>
                          </select>
                        </form>
                      </td>
                      <td>
                        <form action="admin" method="get">
                          <input type="hidden" name="action" value="changeStatusUser" />
                          <input type="hidden" name="userId" value="${u.id}" />
                          <select name="status" onchange="this.form.submit()">
                              <option value="1" ${u.active==1 ? 'selected' : ''}>Đang hoạt động</option>
                              <option value="0" ${u.active==0 ? 'selected' : ''}>Bị khoá</option>
                          </select>
                        </form>
                      </td>
                      <td>

                          <button type="button" onclick="showEditCustomerForm('${u.id}', '${u.userInfo.fullName}', '${u.userInfo.phoneNumber}', '${u.userInfo.birthday}', '${u.email}', '${u.userInfo.address}', '${u.roleId}', '${u.active}')">Sửa</button>
                                                                          <form action="admin?action=deleteCustomer" method="POST" style="display:inline;">
                                                                              <input type="hidden" name="customerId" value="${u.id}"/>
                                                                              <button type="submit" class="see-btn">Xóa</button>
                                                                          </form>
<%--                          <button type="submit" class="see-btn">Xóa</button>--%>
                      </td>
                    </tr>
                  </c:forEach>
                </c:if>
                <c:if test="${empty users}">
                  <tr>
                    <td colspan="8">Không có khách hàng nào</td>
                  </tr>
                </c:if>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<%--    Thêm khách hàng--%>
    <form class="auth-form__group" method="post" action="SignIn" >
        <div class="auth-form__form">
            <div class="auth-form__group">
                <label for="email">Email </label>
                <input type="email" id="email" name="email" class="auth-form__input" placeholder="Email của bạn" required>
            </div>
            <div class="auth-form__group">
                <label for="name">Họ và tên của bạn</label>
                <input type="text" id ="name" name="name" class="auth-form__input" placeholder="Họ và tên của bạn" required>
            </div>
            <div class="auth-form__group">
                <label for="birthday">Sinh nhật</label>
                <input type="date" id="birthday" name="birthday" class="auth-form__input" required>
            </div>
            <div class="auth-form__group">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address" class="auth-form__input" placeholder="Địa chỉ của bạn"  required>
            </div>
            <div class="auth-form__group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" class="auth-form__input" placeholder="Mật khẩu của bạn" required>
            </div>
            <div class="auth-form__group">
                <select name="roleId">
                  <option value="1" ${u.roleId == 1 ? 'selected' : ''}>Admin</option>
                  <option value="2" ${u.roleId == 2 ? 'selected' : ''}>Người dùng thường</option>
                </select>
            </div>
            <div class="auth-form__group">
                <select name="status">
                    <option value="1" ${u.active==1 ? 'selected' : ''}>Đang hoạt động</option>
                    <option value="0" ${u.active==0 ? 'selected' : ''}>Bị khoá</option>
                </select>
            </div>
        </div>

        <div class="auth-form__controls">
            <button type="submit" class="btn btn--primary">Thêm khách hàng</button>
        </div>

<%--        Cập nhật khách hàng--%>
    </form>
      <div id="editCustomerForm" style="display:none;">
          <form action="admin?action=updateCustomer" method="post">
              <label for="id">Mã khách hàng:</label>
              <input type="text" id="id" name="id" readonly /><br/>

              <label for="fullName">Họ và tên:</label>
              <input type="text" id="fullName" name="fullName" required /><br/>

              <label for="phoneNumber">Số điện thoại:</label>
              <input type="text" id="phoneNumber" name="phoneNumber" required /><br/>

              <label for="birthDateCus">Ngày sinh:</label>
              <input type="date" id="birthDateCus" name="birthDateCus"  required />


              <label for="emailCus">Email:</label>
              <input type="email" id="emailCus" name="emailCus" required /><br/>

              <label for="addressCus">Địa chỉ:</label>
              <input type="text" id="addressCus" name="addressCus" required /><br/>

              <label for="roleId">Vai trò:</label>
              <select id="roleId" name="roleId" required>
                  <option value="2">Khách hàng</option>
                  <option value="1">Quản trị viên</option>
              </select><br/>

              <label for="status">Trạng thái:</label>
              <select id="status"  name="status" required>
                  <option value="1" ${u.active==1 ? 'selected' : ''}>Đang hoạt động</option>
                  <option value="0" ${u.active==0 ? 'selected' : ''}>Bị khoá</option>
              </select><br/>

              <button type="submit">Cập nhật khách hàng</button>
              <button type="button" onclick="hideEditCustomerForm()">Hủy</button>
          </form>
      </div>
  </main>
</div>
      <script>
          function showEditCustomerForm(id, fullName, phoneNumber, birthday, email, address, roleId, active) {
              // Điền thông tin vào form
              document.getElementById("id").value = id; // Không cho chỉnh sửa
              document.getElementById("fullName").value = fullName;
              document.getElementById("phoneNumber").value = phoneNumber;
              document.getElementById("birthDateCus").value = birthday;
              document.getElementById("emailCus").value = email;
              document.getElementById("addressCus").value = address;
              document.getElementById("roleId").value = roleId;
              document.getElementById("status").value = active;

              // Hiển thị form cập nhật khách hàng
              document.getElementById("editCustomerForm").style.display = "block";
          }

          function hideEditCustomerForm() {
              // Ẩn form khi hủy
              document.getElementById("editCustomerForm").style.display = "none";
          }
      </script>

      <script>
    function openConfig() {
      document.getElementById('configModal').style.display = 'flex';
    }

    function closeConfig() {
      document.getElementById('configModal').style.display = 'none';
    }

      $(document).ready(function() {
        $('#customerTable').DataTable({
          paging: true,        // Bật phân trang
          searching: true,     // Bật tìm kiếm
          ordering: true,      // Bật sắp xếp
          info: true,          // Hiển thị thông tin số bản ghi
          language: {
            url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json" // Hiển thị tiếng Việt
          }
        });
      });

  </script>


</body>
</html>
