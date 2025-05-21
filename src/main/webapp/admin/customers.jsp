<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %><%--
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
        /* ===== MODAL ===== */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 50px auto;
            padding: 25px 30px;
            border-radius: 8px;
            max-width: 500px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            position: relative;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            z-index: 10000;
        }

        .close-btn {
            position: absolute;
            right: 15px;
            top: 15px;
            font-size: 24px;
            color: #888;
            cursor: pointer;
            transition: 0.3s;
        }

        .close-btn:hover {
            color: #000;
        }

        /* ===== FORM CONTAINER CHUNG ===== */
        .admin-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 10px;
        }

        .form-container {
            width: 100%;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 20px;
        }

        /* ===== FORM GROUP CHUNG (Thêm + Cập nhật) ===== */
        .auth-form__group,
        .form-container form .form-group {
            margin-bottom: 15px;
        }

        .auth-form__group label,
        .form-group label {
            font-weight: bold;
            font-size: 14px;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        .auth-form__group input,
        .auth-form__group select,
        .auth-form__group textarea,
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
        }

        .auth-form__group select,
        .form-group select {
            cursor: pointer;
        }

        .auth-form__group textarea,
        .form-group textarea {
            resize: vertical;
        }

        /* ===== BUTTONS ===== */
        .auth-form__controls,
        .form-container .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        .auth-form__controls button,
        .form-container button[type="submit"],
        .form-container button[type="button"] {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .auth-form__controls .btn--primary,
        .form-container button[type="submit"] {
            background-color: #ee4d2d;
            color: white;
        }

        .auth-form__controls .btn--primary:hover,
        .form-container button[type="submit"]:hover {
            background-color: #d74425;
        }

        .form-container button[type="button"] {
            background-color: #888;
            color: white;
        }

        .form-container button[type="button"]:hover {
            background-color: #666;
        }

        /* ===== RESPONSIVE ===== */
        @media screen and (max-width: 600px) {
            .modal-content {
                padding: 20px;
            }

            .auth-form__group input,
            .form-group input,
            .form-group select,
            .auth-form__group select {
                font-size: 16px;
            }

            .auth-form__controls button,
            .form-container button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
        /* ====== BẢNG QUẢN LÝ KHÁCH HÀNG ====== */
        table#customerTable td {
            vertical-align: middle;
            text-align: center;
        }

        table#customerTable select {
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background-color: #fff;
        }

        /* Hành động Sửa / Xóa */


        /* ====== FORM CẬP NHẬT KHÁCH HÀNG ====== */
        #editCustomerForm {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px 20px;
            align-items: center;
        }

        #editCustomerForm label {
            font-weight: bold;
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        #editCustomerForm input,
        #editCustomerForm select {
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
        }

        /* Chỉnh lại toàn form theo hàng dọc trên mobile */
        @media (max-width: 600px) {
            #editCustomerForm {
                grid-template-columns: 1fr;
            }
        }

        /* Nút hành động */
        button[type="submit"],
        button[type="button"] {
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 8px;
            transition: background-color 0.3s ease;
        }

        button[type="submit"] {
            background-color: #ee4d2d;
            color: #fff;
        }
        button[type="submit"]:hover {
            background-color: #d74425;
        }

        button[type="button"] {
            background-color: #999;
            color: #fff;
        }
        button[type="button"]:hover {
            background-color: #777;
        }

    </style>

</head>
<body>
<%

    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
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
              <a href="/demo/admin?action=managerConditionRental"><span class="las la-motorcycle"></span>
                  <span>Điều kiện đặt xe</span></a>
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
            <button onclick="openConfig()"> Thêm khách hàng</button>


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
                            <option value="2" ${u.roleId == 2 ? 'selected' : ''}>User</option>
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
        <div id="configModal" class="modal">
            <div class="modal-content">
                <div class="admin-container">
                    <div class="form-container">

                        <h2>Thêm Khách hàng</h2>
                        <span class="close-btn" onclick="closeConfig()">&times;</span>
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
                                        <option value="2" ${u.roleId == 2 ? 'selected' : ''}>User</option>
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
                                <button type="button" onclick="hideEditCustomerForm()">Hủy</button>
                            </div>
                        </form>




                    </div>
                </div>
            </div>
        </div>


        <div id="configModal2" class="modal">
            <div class="modal-content">
                <div class="admin-container">
                    <div class="form-container">

                        <%--        Cập nhật khách hàng--%>
                        <div id="editCustomerForm" style="display:none;">
                            <h2>Cập nhật Khách hàng</h2>
                            <span class="close-btn" onclick="closeConfig()">&times;</span>
                            <form action="admin?action=updateCustomer" method="post">
                                <input type="hidden" id="customerId" name="customerId" />
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
                                    <option value="2">User</option>
                                    <option value="1">Admin</option>
                                </select><br/>

                                <label for="status">Trạng thái:</label>
                                <select id="status"  name="status" required>
                                    <option value="1" ${u.active==1 ? 'selected' : ''}>Đang hoạt động</option>
                                    <option value="0" ${u.active==0 ? 'selected' : ''}>Bị khoá</option>
                                </select><br/>

                                <button type="submit">Cập nhật khách hàng</button>
                                <button type="button" onclick="hideEditCustomerForm2()">Hủy</button>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>



  </main>
</div>
<script>
    function showEditCustomerForm(userId, fullName, phone, birthDate, email, address, roleId, isActive) {
        document.getElementById("id").value = userId; // id = userdetails.id
        document.getElementById("customerId").value = userId; // id = users.id (nếu khác thì truyền riêng)

        document.getElementById("fullName").value = fullName;
        document.getElementById("phoneNumber").value = phone;
        document.getElementById("birthDateCus").value = birthDate;
        document.getElementById("emailCus").value = email;
        document.getElementById("addressCus").value = address;
        document.getElementById("roleId").value = roleId;
        document.getElementById("status").value = isActive;
// Hiển thị form
        document.getElementById("configModal2").style.display = "flex";
        document.getElementById("editCustomerForm").style.display = "block";
        document.getElementById("configModal").style.display = "none";

    }
    function hideEditCustomerForm2() {
        document.getElementById("configModal2").style.display = "none";
        document.getElementById("editCustomerForm").style.display = "none";
    }
    function hideEditCustomerForm() {
        // Ẩn form khi hủy
        document.getElementById("configModal").style.display = "none";
    }
</script>

<script>
    function openConfig() {
        document.getElementById('configModal').style.display = 'flex';
    }

    function closeConfig() {
        document.getElementById('configModal').style.display = 'none';
        document.getElementById('configModal2').style.display = 'none';
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
