<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0">
  <title>Trang admin</title>
  <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
  <style>
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

    /* Container bên trong modal */
    .admin-container {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      padding: 10px;
    }

    /* Form container dùng chung cho cả 2 */
    .form-container {
      width: 100%;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
      font-size: 20px;
    }

    /* Input group */
    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
      font-size: 14px;
      color: #333;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    .form-group textarea {
      resize: vertical;
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

    /* Responsive nhỏ hơn 500px */
    @media (max-width: 500px) {
      .modal-content {
        padding: 20px;
      }

      .form-container h2 {
        font-size: 18px;
      }

      button {
        width: 100%;
        margin-bottom: 10px;
      }
    }
    table#promotionTable select {
      padding: 6px 12px;
      font-size: 13px;
      font-weight: 500;
      border-radius: 6px;
      border: 1px solid #bbb;
      background-color: #fdfdfd;
      color: #333;
      transition: all 0.3s ease;
    }

    table#promotionTable select:hover {
      border-color: #999;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
      background-color: #f9f9f9;
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
        <a href="/demo/admin?action=managerPromotion" class="dashboard-active"><span class="las la-ticket-alt"></span>
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
      Khuyến mãi
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
            <h3>Khuyến mãi</h3>
            <button onclick="openConfig()"> Thêm khuyến mãi</button>


          </div>

          <div class="card-body">
            <table width="100%" id="promotionTable">
              <thead>
              <tr>

                <th>Mã khuyến mãi</th>
                <th>Mô tả</th>
                <th>Giá trị giảm</th>
                <th>Thời gian</th>
                <th>Trạng thái</th>
                <th>Hành động</th>

              </tr>
              </thead>
              <tbody>
              <c:forEach var="pm" items="${promotions}">
              <tr>

                <td>${pm.promotionName}</td>
                <td>${pm.description}</td>
                <td>${pm.discountValue}${pm.discountType == '1' ? '%' : 'VND'}</td>
                <td>${pm.startDate} - ${pm.endDate}</td>
                <td>
                  <form action="admin" method="post">
                    <input type="hidden" name="action" value="changePromotionStatus" />
                    <input type="hidden" name="promotionId" value="${pm.id}" />
                    <select name="isActive" onchange="this.form.submit()">
                      <option value="1" ${pm.isActive == 1 ? 'selected' : ''}>Kích hoạt</option>
                      <option value="0" ${pm.isActive == 0 ? 'selected' : ''}>Vô hiệu</option>
                    </select>
                  </form>
                </td>
                <td>

                  <!-- Thêm một form sửa đơn hàng trong phần Hành động -->
                  <button type="button" onclick="showEditPromotionForm('${pm.id}', '${pm.promotionName}', '${pm.description}', '${pm.discountValue}', '${pm.startDate}', '${pm.endDate}', '${pm.isActive}', '${pm.discountType}')">Sửa</button>
                  <form action="admin?action=deletePromotion" method="POST" style="display:inline;">
                    <input type="hidden" name="promo-id" value="${pm.id}"/>
                    <button type="submit" class="see-btn">Xóa</button>
                  </form>
                </td>
              </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div id="configModal" class="modal">
        <div class="modal-content">
          <div class="admin-container">
            <div class="form-container">

              <h2>Thêm Khuyến Mãi</h2>
              <span class="close-btn" onclick="closeConfig()">&times;</span>
              <form action="admin?action=addPromotion" method="post" class="promotion-form">
                <div class="form-group">
                  <label for="promo-code">Mã Khuyến Mãi:</label>
                  <input type="text" id="promo-code" name="promo-code" placeholder="Nhập mã khuyến mãi" required />
                </div>
                <div class="form-group">
                  <label for="promo-name">Tên Khuyến Mãi:</label>
                  <input type="text" id="promo-name" name="promo-name" placeholder="Nhập tên khuyến mãi" required />
                </div>
                <div class="form-group">
                  <label for="description">Mô Tả:</label>
                  <textarea id="description" name="description" rows="3" placeholder="Mô tả chi tiết khuyến mãi"></textarea>
                </div>
                <div class="form-group">
                  <label for="discount-value">Giá Trị Giảm:</label>
                  <input type="number" id="discount-value" name="discount-value" placeholder="Nhập giá trị giảm" required />
                </div>
                <div class="form-group">
                  <label for="discount-type">% hoặc VND:</label>
                  <select id="discount-type" name="discount-type" required>
                    <option value="">-- Chọn Loại Giá Trị Giảm --</option>
                    <option value="1">Phần Trăm (%)</option>
                    <option value="2">Giá Trị Thực (VND)</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="start-date">Thời Gian Bắt Đầu:</label>
                  <input type="date" id="start-date" name="start-date" required />
                </div>
                <div class="form-group">
                  <label for="end-date">Thời Gian Kết Thúc:</label>
                  <input type="date" id="end-date" name="end-date" required />
                </div>
                <div class="form-group">
                  <label for="is-active">Hành Động:</label>
                  <select id="is-active" name="is-active" required>
                    <option value="">-- Chọn Trạng Thái --</option>
                    <option value="1">Kích Hoạt</option>
                    <option value="2">Vô Hiệu Hóa</option>
                  </select>
                </div>
                <button type="submit" class="submit-promotion">Thêm Khuyến Mãi</button>
              </form>



            </div>
          </div>
        </div>
      </div>
      <div id="configModal2" class="modal">
        <div class="modal-content">
          <div class="admin-container">
            <div class="form-container">

              <%--              form thêm khuyến mãi--%>
              <div id="editPromotionForm" style="display:none;">
                <form action="admin?action=updatePromotion" method="post">
                  <div class="form-group">
                    <label for="id">Mã Khuyến Mãi:</label>
                    <input type="text" id="id" name="id" placeholder="Nhập mã khuyến mãi" required />
                  </div>
                  <div class="form-group">
                    <label for="promotionName">Tên Khuyến Mãi:</label>
                    <input type="text" id="promotionName" name="promotionName" placeholder="Nhập tên khuyến mãi" required />
                  </div>
                  <div class="form-group">
                    <label for="descriptionName">Mô Tả:</label>
                    <textarea id="descriptionName" name="descriptionName" rows="3" placeholder="Mô tả chi tiết khuyến mãi"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="discountValue">Giá Trị Giảm:</label>
                    <input type="number" id="discountValue" name="discountValue" placeholder="Nhập giá trị giảm" required />
                  </div>
                  <div class="form-group">
                    <label for="discountType">% hoặc VND:</label>
                    <select id="discountType" name="discountType" required>
                      <option value="">-- Chọn Loại Giá Trị Giảm --</option>
                      <option value="1" ${pm.discountType==1 ? 'selected' : ''}>Phần Trăm (%)</option>
                      <option value="2" ${pm.discountType==2 ? 'selected' : ''}>Giá Trị Thực (VND)</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="startDate">Thời Gian Bắt Đầu:</label>
                    <input type="date" id="startDate" name="startDate" required />
                  </div>
                  <div class="form-group">
                    <label for="endDate">Thời Gian Kết Thúc:</label>
                    <input type="date" id="endDate" name="endDate" required />
                  </div>
                  <div class="form-group">
                    <label for="isActive">Hành Động:</label>
                    <select id="isActive" name="isActive" required>
                      <option value="">-- Chọn Trạng Thái --</option>
                      <option value="1" ${pm.isActive==1 ? 'selected' : ''}>Kích hoạt</option>
                      <option value="2" ${pm.isActive==2 ? 'selected' : ''}>Vô hiệu hóa</option>
                    </select>
                  </div>
                  <button type="submit">Cập nhật khuyến mãi</button>
                  <button type="button" onclick="hideEditPromotionForm2()">Hủy</button>
                </form>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script>
    function showEditPromotionForm(id, promotionName, description, discountValue, startDate, endDate, isActive, discountType) {
      // Điền thông tin vào form
      document.getElementById("id").value = id;
      document.getElementById("promotionName").value = promotionName;
      document.getElementById("descriptionName").value = description;
      document.getElementById("discountValue").value = discountValue;
      document.getElementById("startDate").value = startDate;
      document.getElementById("endDate").value = endDate;
      document.getElementById("isActive").value = isActive;
      document.getElementById("discountType").value = discountType;

      // Hiển thị form
      document.getElementById("configModal2").style.display = "flex";
      document.getElementById("editPromotionForm").style.display = "block";
      document.getElementById("configModal").style.display = "none";
    }
    function hideEditPromotionForm2() {
      document.getElementById("configModal2").style.display = "none";
      document.getElementById("editPromotionForm").style.display = "none";
    }
    function hideEditPromotionForm() {
      // Ẩn form khi hủy
      document.getElementById("editPromotionForm").style.display = "none";

    }
    function openConfig() {
      document.getElementById("configModal").style.display = "block";
    }
    function closeConfig() {
      document.getElementById("configModal").style.display = "none";
    }


  </script>
</div>
</body>
</html>
