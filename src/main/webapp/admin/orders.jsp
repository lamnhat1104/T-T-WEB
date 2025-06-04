<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>
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
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <style>
        /* Định dạng form */
        #editOrderForm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
            height: 80vh; /* Giới hạn chiều cao 80% màn hình */
            overflow-y: auto; /* Thêm thanh cuộn dọc nếu nội dung quá dài */
            z-index: 1000;
        }


        /* Định dạng các label */
        #editOrderForm label {
            display: block;
            font-weight: bold;
            margin: 8px 0 5px;
        }

        /* Định dạng input */
        #editOrderForm input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Định dạng nút */
        #editOrderForm button {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        /* Nút cập nhật */
        #editOrderForm button[type="submit"] {
            background: #ee4d2d;
            color: white;
        }

        /* Nút hủy */
        #editOrderForm button[type="button"] {
            background: #999;
            color: white;
        }

        /* Hover cho nút */
        #editOrderForm button:hover {
            opacity: 0.8;
        }

        @media (max-height: 700px) {
            #editOrderForm {
                top: 5%;
                transform: translate(-50%, 0);
                height: 90vh;
            }
        }
        #status {
            width: 100%;
            padding: 8px 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
            background-color: #fff;
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
        table#orderTable select {
            padding: 6px 12px;
            font-size: 13px;
            font-weight: 500;
            border-radius: 6px;
            border: 1px solid #bbb;
            background-color: #fdfdfd;
            color: #333;
            transition: all 0.3s ease;
        }

        table#orderTable select:hover {
            border-color: #999;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            background-color: #f9f9f9;
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
              <a href="/demo/admin?action=managerOrder" class="dashboard-active"><span class="las la-shopping-bag"></span>
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
                  <span>Quản lý tồn kho</span></a>
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
      Đơn hàng
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
            <h3>Đơn hàng</h3>
            <button>Thêm<span class="las la-arrow-right"></span> </button>
          </div>

          <div class="card-body">
            <table id="orderTable" width="100%">
                <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Mã khách hàng</th>
                        <th>Địa chỉ giao xe</th>
                        <th>Ngày đặt xe</th>
                        <th>Ngày trả xe</th>
                        <th>Biển số xe</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${orders}">
                    <tr>
                      <td>${o.id}</td>
                      <td>${o.customerId}</td>
                      <td>${o.deliveryAddress}</td>
                      <td>${o.retalStarDate}</td>
                      <td>${o.expectedReturnDate}</td>
                      <td>${o.orderDetail.licensePlate}</td>
                        <td>
                            <form action="admin" method="post">
                                <input type="hidden" name="action" value="updateOrderStatus" />
                                <input type="hidden" name="orderId" value="${o.id}" />
                                <select name="status" class="status-select status-${o.status}" onchange="this.form.submit()">
                                    <option value="0" ${o.status == 0 ? 'selected' : ''}>Chờ xác nhận</option>
                                    <option value="1" ${o.status == 1 ? 'selected' : ''}>Đã xác nhận</option>
                                    <option value="2" ${o.status == 2 ? 'selected' : ''}>Đang giao</option>
                                    <option value="3" ${o.status == 3 ? 'selected' : ''}>Đã hoàn tất</option>
                                    <option value="4" ${o.status == 4 ? 'selected' : ''}>Đã hủy</option>
                                </select>
                            </form>
                        </td>


                      <td>
                          <!-- Thêm một form sửa đơn hàng trong phần Hành động -->
                              <button type="button" onclick="showEditOrderForm('${o.id}', '${o.customerId}', '${o.deliveryAddress}', '${o.retalStarDate}', '${o.expectedReturnDate}', '${o.orderDetail.licensePlate}', '${o.status}', '${o.orderDetail.priceAtOrder}')">Sửa</button>
                           <form action="admin?action=deleteOrder" method="POST" style="display:inline;">
                              <input type="hidden" name="orderId" value="${o.id}"/>
                              <button type="submit" class="see-btn">Xóa</button>
                          </form>
                      </td>
                     </tr>
                    </c:forEach>
                </tbody>
            </table>
          </div>
          <!-- Form sửa đơn đặt hàng -->
          <div id="editOrderForm" style="display:none;">
              <form action="admin?action=updateOrder" method="post">
                  <input type="hidden" name="orderId" id="orderId" />

                  <label for="orderIdInput">Mã đơn hàng:</label>
                  <input type="text" id="orderIdInput" name="orderIdInput" readonly /><br/>

                  <label for="customerId">Mã khách hàng:</label>
                  <input type="text" id="customerId" name="customerId" /><br/>

                  <label for="deliveryAddress">Địa chỉ giao xe:</label>
                  <input type="text" id="deliveryAddress" name="deliveryAddress" /><br/>

                  <label for="rentalStartDate">Ngày thuê:</label>
                  <input type="date" id="rentalStartDate" name="rentalStartDate" /><br/>

                  <label for="expectedReturnDate">Ngày trả xe:</label>
                  <input type="date" id="expectedReturnDate" name="expectedReturnDate" /><br/>

                  <label for="licensePlate">Biển số xe:</label>
                  <input type="text" id="licensePlate" name="licensePlate" /><br/>

                  <label for="rentalPrice">Giá thuê xe:</label>
                  <input type="text" id="rentalPrice" name="rentalPrice" /><br/>

                  <label for="status">Trạng thái đơn:</label>
                  <select id="status" name="status" required>
                      <option value="0">Chờ xác nhận</option>
                      <option value="1">Đã xác nhận</option>
                      <option value="2">Đang giao</option>
                      <option value="3">Đã hoàn tất</option>
                      <option value="4">Đã hủy</option>
                  </select><br/>

                  <button type="submit">Cập nhật</button>
                  <button type="button" onclick="hideEditOrderForm()">Hủy</button>
              </form>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>



<script>
    function showEditOrderForm(orderId, customerId, deliveryAddress, rentalStartDate, expectedReturnDate, licensePlate, status, priceAtOrder) {
        // Điền thông tin vào form
        document.getElementById("orderId").value = orderId;
        document.getElementById("orderIdInput").value = orderId; // Mã đơn hàng không thể chỉnh sửa
        document.getElementById("customerId").value = customerId;
        document.getElementById("deliveryAddress").value = deliveryAddress;
        document.getElementById("rentalStartDate").value = rentalStartDate;
        document.getElementById("expectedReturnDate").value = expectedReturnDate;
        document.getElementById("licensePlate").value = licensePlate;
        document.getElementById("status").value = status;
        document.getElementById("rentalPrice").value = priceAtOrder;

        // Hiển thị form
        document.getElementById("editOrderForm").style.display = "block";
    }

    function hideEditOrderForm() {
        // Ẩn form khi hủy
        document.getElementById("editOrderForm").style.display = "none";
    }
</script>


<script>
    $(document).ready(function () {
        $('#order-table').DataTable({ // Đổi 'vehicleTable' thành 'order-table'
            "pageLength": 10, // Hiển thị 10 sản phẩm mỗi trang
            "language": {
                "lengthMenu": "Hiển thị _MENU_ sản phẩm mỗi trang",
                "zeroRecords": "Không tìm thấy đơn hàng nào",
                "info": "Hiển thị trang _PAGE_ của _PAGES_",
                "infoEmpty": "Không có đơn hàng nào",
                "infoFiltered": "(lọc từ _MAX_ sản phẩm)",
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
