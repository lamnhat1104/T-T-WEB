<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Trang admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
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
            <li><a href="/demo/admin?action=dashboard"><span class="las la-igloo"></span><span>Dashboard</span></a></li>
            <li><a href="/demo/admin?action=managerCustomer"><span class="las la-users"></span><span>Quản lý khách hàng</span></a></li>
            <li><a href="/demo/admin?action=managerVehicleType" ><span class="las la-motorcycle"></span><span>Quản lý xe máy</span></a></li>
            <li><a href="/demo/admin?action=managerOrder"><span class="las la-shopping-bag"></span><span>Quản lý đơn hàng</span></a></li>
            <li><a href="/demo/admin?action=managerConditionRental"><span class="las la-motorcycle"></span><span>Điều kiện đặt xe</span></a></li>
            <li><a href="/demo/admin?action=managerNew"><span class="las la-newspaper"></span><span>Quản lý tin tức</span></a></li>
            <li><a href="/demo/admin?action=managerContact"><span class="las la-receipt"></span><span>Phản hồi khách hàng</span></a></li>
            <li><a href="/demo/admin?action=managerPromotion"><span class="las la-ticket-alt"></span><span>Quản lý khuyến mãi</span></a></li>
            <li><a href="/demo/admin?action=managerStatMotor" class="dashboard-active"><span class="las la-circle"></span><span>Quản lý tồn kho</span></a></li>
            <li><a href="/demo/admin?action=managerStatIncome"><span class="las la-clipboard-list"></span><span>Thống kê doanh thu</span></a></li>
            <li><a href="/demo/admin?action=managerSetting"><span class="las la-cog"></span><span>Cài đặt</span></a></li>
        </ul>
    </div>
</div>

<div class="main-content">
    <header>
        <h2>
            <label for="nav-toggle"><span class="las la-bars"></span></label>
            Xe máy
        </h2>
        <div class="search-wrapper">
            <span class="las la-search"></span>
            <input type="search" placeholder="Tìm kiếm tại đây"/>
        </div>
        <div class="user-wrapper">
            <img src="../assets/img/home_img/user.png" height="40" width="40"/>
            <div>
                <small>
                    <%= (user.getRoleId() == 1) ? "Admin" : "User" %> <br>
                    <%= user.getUserInfo().getFullName() %>
                </small>
            </div>
        </div>
    </header>

    <main>
        <div class="recent-grid">
            <div class="projects">
                <div class="card">
                    <div class="card-header">
                        <h3>Danh sách xe máy</h3>
                        <button onclick="openConfig()">Thêm xe</button>
                    </div>
                    <div class="card-body">
                        <table id="vehicleTable" width="100%" class="display">
                            <thead>
                            <tr>
                                <th>ID Xe</th>
                                <th>Tên xe</th>
                                <th>Loại xe</th>
                                <th>Giá thuê</th>
                                <th>Tổng số xe</th>
                                <th>Số xe còn lại</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<VehicleType> vehicleTypeList = (List<VehicleType>) request.getAttribute("vehicleTypeList");
                                if (vehicleTypeList != null && !vehicleTypeList.isEmpty()) {
                                    for (VehicleType v : vehicleTypeList) {
                            %>
                            <tr>
                                <td><%= v.getId() %></td>
                                <td><%= v.getName() %></td>
                                <td><%= v.getCategory() %></td>
                                <td><%= v.getTotalPrice() %></td>
                                <td><%= v.getTotalVehicles() %></td>
                                <td><%= v.getRemainingVehicles() %></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    $(document).ready(function () {
        $('#vehicleTable').DataTable({
            "pageLength": 10,
            "language": {
                "lengthMenu": "Hiển thị _MENU_ sản phẩm mỗi trang",
                "zeroRecords": "Không tìm thấy xe nào",
                "info": "Hiển thị trang _PAGE_ của _PAGES_",
                "infoEmpty": "Không có xe nào",
                "infoFiltered": "(lọc từ _MAX_ xe)",
                "search": "Tìm kiếm:",
                "paginate": {
                    "next": "Trang tiếp",
                    "previous": "Trang trước"
                }
            }
        });
    });
</script>
</body>
</html>
