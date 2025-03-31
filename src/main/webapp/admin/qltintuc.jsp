<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.New" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:43 PM
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
        <a href="/demo/admin?action=managerNew" class="dashboard-active"><span class="las la-newspaper"></span>
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
      Tin tức
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
            <h3>Tin tức</h3>
            <button onclick="openConfig()"> Thêm tin tức </button>
          </div>

          <div class="card-body">
            <table width="100%">
              <thead>
              <tr>
                <th>Mã tin tức</th>
                <th>Tiêu đề</th>
                <th>Thông tin</th>
                <th>Hình ảnh</th>
                <th>Ngày tạo</th>
                <th>Tạng thái</th>
                <th>Hành động</th>

              </tr>
              </thead>
              <tbody>
              <%
                List<New> newsList = (List<New>) request.getAttribute("news");
                if (newsList != null && !newsList.isEmpty()) {
                  for (New n : newsList) {
              %>
              <tr>
                <td><%= n.getId() %></td>
                <td><%= n.getTitle() %></td>
                <td><%= n.getContent() %></td>
                <td><%= n.getImage() %></td>
                <td><%= n.getCreatedDate() %></td>
                <td><%= n.getIsActive() == 0 ? "Vô hiệu":"Kích hoạt" %></td>
                <td>
                    <button type="button" onclick="showEditNewForm(
                        <%= n.getId() %>,
                            '<%= n.getTitle().replace("'", "\\'") %>',
                            '<%= n.getContent().replace("'", "\\'") %>',
                            '<%= n.getImage().replace("'", "\\'") %>',
                            '<%= n.getCreatedDate() %>',
                        <%= n.getIsActive() %>
                            )">Sửa</button>                    <form action="admin?action=deleteNew" method="POST" style="display:inline;">
                    <input type="hidden" name="new-id" value="<%= n.getId() %>"/>
                    <button type="submit" class="see-btn">Xóa</button>
                  </form>
                </td>
              </tr>
              <%
                }
              } else {
              %>
              <tr><td colspan="7">Không có tin tức nào!</td></tr>
              <%
                }
              %>


              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div id="configModal" class="modal">
        <div class="modal-content">
          <div class="admin-container">
            <div class="form-container">

              <h2>Thêm Tin Tức</h2>
              <span class="close-btn" onclick="closeConfig()">&times;</span>
                <form action="admin?action=addNew" method="post" class="news-form">
                    <div class="form-group">
                        <label for="id">Mã tin tức:</label>
                        <input type="text" id="id" name="id" placeholder="Nhập mã tin tức" required />
                    </div>

                    <div class="form-group">
                        <label for="title">Tiêu đề:</label>
                        <input type="text" id="title" name="title" placeholder="Nhập tiêu đề" required />
                    </div>

                    <div class="form-group">
                        <label for="content">Nội dung:</label>
                        <textarea id="content" name="content" rows="4" placeholder="Nhập nội dung tin tức" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="image">Đường dẫn hình ảnh:</label>
                        <input type="text" id="image" name="image" placeholder="VD: /images/tintuc1.jpg" required />
                    </div>

                    <div class="form-group">
                        <label for="created-date">Ngày tạo:</label>
                        <input type="date" id="created-date" name="created-date" required />
                    </div>

                    <div class="form-group">
                        <label for="is-active">Trạng thái:</label>
                        <select id="is-active" name="is-active" required>
                            <option value="">-- Chọn trạng thái --</option>
                            <option value="1">Kích hoạt</option>
                            <option value="0">Không kích hoạt</option>
                        </select>
                    </div>

                    <button type="submit" class="submit-news">Thêm Tin Tức</button>
                </form>




            </div>
          </div>
        </div>
      </div>

      <div id="configModal2" class="modal">
        <div class="modal-content">
          <div class="admin-container">
            <div class="form-container">

              <%--              form thêm tin tức--%>
                  <div id="editNewForm" style="display:none;">
                      <form action="admin?action=updateNew" method="post">
                          <div class="form-group">
                              <label for="new-id">Mã Tin Tức:</label>
                              <input type="text" id="new-id" name="new-id" placeholder="Nhập mã tin tức" required readonly />
                          </div>

                          <div class="form-group">
                              <label for="new-title">Tiêu Đề:</label>
                              <input type="text" id="new-title" name="new-title" placeholder="Nhập tiêu đề tin tức" required />
                          </div>

                          <div class="form-group">
                              <label for="new-content">Nội Dung:</label>
                              <textarea id="new-content" name="new-content" rows="4" placeholder="Nhập nội dung tin tức" required></textarea>
                          </div>

                          <div class="form-group">
                              <label for="new-image">Đường Dẫn Hình Ảnh:</label>
                              <input type="text" id="new-image" name="new-image" placeholder="VD: /images/news1.jpg" required />
                          </div>

                          <div class="form-group">
                              <label for="new-createdDate">Ngày Tạo:</label>
                              <input type="date" id="new-createdDate" name="new-createdDate" required />
                          </div>

                          <div class="form-group">
                              <label for="new-isActive">Trạng Thái:</label>
                              <select id="new-isActive" name="new-isActive" required>
                                  <option value="">-- Chọn Trạng Thái --</option>
                                  <option value="1">Kích hoạt</option>
                                  <option value="0">Không kích hoạt</option>
                              </select>
                          </div>

                          <button type="submit">Cập nhật tin tức</button>
                          <button type="button" onclick="hideEditNewForm2()">Hủy</button>
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
  function showEditNewForm(id, title, content, image, createdDate, isActive) {
    // Điền thông tin vào form
    document.getElementById("new-id").value = id;
    document.getElementById("new-title").value = title;
    document.getElementById("new-content").value = content;
    document.getElementById("new-image").value = image;
    document.getElementById("new-createdDate").value = createdDate;
    document.getElementById("new-isActive").value = isActive;

    // Hiển thị form
    document.getElementById("configModal2").style.display = "flex";
    document.getElementById("editNewForm").style.display = "block";
    document.getElementById("configModal").style.display = "none";
  }
  function hideEditNewForm2() {
    document.getElementById("configModal2").style.display = "none";
    document.getElementById("editNewForm").style.display = "none";
  }
  function hideEditNewForm() {
    // Ẩn form khi hủy
    document.getElementById("editNewForm").style.display = "none";

  }
  function openConfig() {
    document.getElementById("configModal").style.display = "block";
  }
  function closeConfig() {
    document.getElementById("configModal").style.display = "none";
  }


</script>
</body>
</html>
