<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.Contact" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
    table#contactTable select {
      padding: 6px 12px;
      font-size: 13px;
      font-weight: 500;
      border-radius: 6px;
      border: 1px solid #bbb;
      background-color: #fdfdfd;
      color: #333;
      transition: all 0.3s ease;
    }

    table#contactTable select:hover {
      border-color: #999;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
      background-color: #f9f9f9;
    }
    /* ===================== Buttons ===================== */
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
      background-color: #999;
      color: #fff;
    }
    button[type="submit"]:hover {
      background-color: #777;
    }

    button[type="button"] {
      background-color: #999;
      color: #fff;
    }
    button[type="button"]:hover {
      background-color: #777;
    }

    .form-group input,
    .form-group select,
    .form-group textarea,
    form input,
    form select,
    form textarea {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
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
        <small>
          <%= (user.getRoleId() == 1) ? "Admin" : "User" %> <br>
          <%= user.getUserInfo().getFullName()%>
        </small>
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

          <div class="card-body" id="contactTable">
            <table width="100%">
              <thead>
              <tr>
                <th>ID</th>
                <th>Tên khách hàng</th>
                <th>Email</th>
                <th>Nội dung phản hồi</th>
                <th>Ngày gửi</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
              </tr>
              </thead>
              <tbody>
              <%
                List<Contact> contactList = (List<Contact>) request.getAttribute("contacts");
                if (contactList != null && !contactList.isEmpty()) {
                  for (Contact c : contactList) {
              %>
              <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getFullName() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getMessage() %></td>
                <td><%= c.getCreateDate() %></td>
                <td>
                  <form action="admin" method="post">
                    <input type="hidden" name="action" value="changeContactStatus" />
                    <input type="hidden" name="contactId" value="<%= c.getId() %>" />
                    <select name="status" onchange="this.form.submit()">
                      <option value="0" <%=c.getProcessingStatus() == 0 ? "selected" : ""%>>Chưa xử lý</option>
                      <option value="1" <%=c.getProcessingStatus() == 1 ? "selected" : ""%>>Đã xử lý</option>
                    </select>
                  </form>
                </td>
                <td>
                  <form action="admin?action=deleteContact" method="POST" style="display:inline;">
                    <input type="hidden" name="contact-id" value="<%= c.getId() %>"/>
                    <button type="submit" class="see-btn">Xóa</button>
                  </form>
                </td>
              </tr>
              <%
                }
              } else {
              %>
              <tr>
                <td colspan="7">Không có phản hồi nào.</td>
              </tr>
              <% } %>
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