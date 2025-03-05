<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:42 PM
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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
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



        .form-container {
            margin-top: 120px;
            width: 150%;
            max-width: 350px; /* Giảm chiều rộng form */
            background: #fff;
            padding: 10px; /* Giảm padding */
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            margin-bottom: 10px; /* Giảm khoảng cách tiêu đề */
            color: #333;
            font-size: 1em; /* Giảm kích thước chữ */
        }

        .form-group {
            margin-bottom: 8px; /* Giảm khoảng cách giữa các trường */
        }

        label {
            display: block;
            font-size: 0.8em; /* Giảm kích thước chữ */
            margin-bottom: 3px; /* Giảm khoảng cách giữa nhãn và input */
            color: #555;
        }

        input, select, textarea {
            width: 100%;
            padding: 5px; /* Giảm padding trong input */
            font-size: 0.8em; /* Giảm kích thước chữ */
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        textarea {
            resize: none;
        }

        button.submit-btn {
            width: 100%;
            background-color: #EE4D2D;
            color: white;
            border: none;
            padding: 8px; /* Giảm kích thước nút */
            border-radius: 3px;
            font-size: 0.9em; /* Giảm kích thước chữ nút */
            cursor: pointer;
        }

        button.submit-btn:hover {
            background-color: #EE4D2D;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 8px; /* Giảm padding cho thiết bị nhỏ */
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
                <a href="/DoAnCuoiKi/admin?action=dashboard">
                    <span class="las la-igloo"></span>
                    <span>Dashboard</span></a>
            </li>
            <li>
                <a href="/DoAnCuoiKi/admin?action=managerCustomer"><span class="las la-users"></span>
                    <span>Quản lý khách hàng</span></a>
            </li>
            <li>
                <a href="/DoAnCuoiKi/admin?action=managerVehicleType"><span class="las la-motorcycle"></span>
                    <span>Quản lý xe máy</span></a>
            </li>
            <li>
                <a href="/DoAnCuoiKi/admin?action=managerOrder"><span class="las la-shopping-bag"></span>
                    <span>Quản lý đơn hàng</span></a>
            </li>
            <li>
                <a href="qltintuc.jsp"><span class="las la-newspaper"></span>
                    <span>Quản lý tin tức</span></a>
            </li>
            <li>
                <a href="feedback.jsp"><span class="las la-receipt"></span>
                    <span>Phản hồi khách hàng</span></a>
            </li>
            <li>
                <a href="promotion.jsp"><span class="las la-ticket-alt"></span>
                    <span>Quản lý khuyến mãi</span></a>
            </li>
            <li>
                <a href="stats_motors.jsp"><span class="las la-circle"></span>
                    <span>Thống kê xe máy</span></a>
            </li>
            <li>
                <a href="stats_income.jsp"><span class="las la-clipboard-list"></span>
                    <span>Thống kê doanh thu</span></a>
            </li>
            <li>
                <a href="setting.jsp"><span class="las la-cog"></span>
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
            Xe máy
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
                        <h3>Xe máy</h3>
                        <button onclick="openConfig()"> Thêm xe</button>
                        <button class="card-header-btn"> Xóa xe</button>
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
                                    <th>Trạng thái</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="v" items="${vehicleTypeList}">
                                    <tr>
                                        <td>${v.id}</td>
                                        <td>${v.name}</td>
                                        <td>${v.category}</td>
                                        <td>${v.totalPrice}</td>
                                        <td>${v.totalVehicles}</td>
                                        <td>${v.available==1? "Hien" : "An"}</td>
                                        <td>
                                            <button type="button" onclick="showEditForm('${v.id}', '${v.name}', '${v.brand}', '${v.category}', '${v.totalPrice}', '${v.description}', '${v.image}', '${v.totalVehicles}', '${v.available}')">Sửa</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <!-- Form thêm thông tin xe -->
        <div id="configModal" class="modal">
            <div class="modal-content">
                <div class="form-container">
                    <span class="close-btn" onclick="closeConfig()">&times;</span>
                    <h3>Thêm Xe</h3>
                    <form action="admin?action=addVehicleType" method="POST" >
                        <label for="addName">Tên xe:</label>
                        <input type="text" id="addName" name="addName" /><br/>

                        <label for="addBrand">Hãng xe:</label>
                        <input type="text" id="addBrand" name="addBrand" /><br/>

                        <label for="addCategory">Loại xe:</label>
                        <input type="text" id="addCategory" name="addCategory" /><br/>

                        <label for="addTotalPrice">Giá thuê:</label>
                        <input type="text" id="addTotalPrice" name="addTotalPrice" /><br/>

                        <label for="addDescription">Mô tả:</label>
                        <textarea id="addDescription" name="addDescription"></textarea><br/>

                        <label for="addImage">Hình ảnh</label>
                        <input type="text" id="addImage" name="addImage" /><br/>

                        <label for="addTotalVehicles">Số lượng xe:</label>
                        <input type="number" id="addTotalVehicles" name="addTotalVehicles" /><br/>

                        <label for="addAvailable">Có sẵn:</label>
                        <select id="addAvailable" name="addAvailable">
                            <option value="1">Có sẵn</option>
                            <option value="0">Không có sẵn</option>
                        </select><br/>

                        <button type="submit">Thêm</button>
                        <button type="button" onclick="hideEditForm()">Hủy</button>
                    </form>
                    </form>
                </div>
            </div>
        </div>
        <!-- Form sửa thông tin -->
        <div id="editForm" style="display:none;">
            <form action="admin?action=updateVehicleType" method="post">
                <input type="hidden" name="id" id="id" />
                <label for="name">Tên xe:</label>
                <input type="text" id="name" name="name" /><br/>

                <label for="brand">Hãng xe:</label>
                <input type="text" id="brand" name="brand" /><br/>

                <label for="category">Loại xe:</label>
                <input type="text" id="category" name="category" /><br/>

                <label for="totalPrice">Giá thuê:</label>
                <input type="text" id="totalPrice" name="totalPrice" /><br/>

                <label for="description">Mô tả:</label>
                <textarea id="description" name="description"></textarea><br/>

                <label for="image">Hình ảnh</label>
                <input type="text" id="image" name="image" /><br/>

                <label for="totalVehicles">Số lượng xe:</label>
                <input type="number" id="totalVehicles" name="totalVehicles" /><br/>

                <label for="available">Có sẵn:</label>
                <select id="available" name="available">
                    <option value="1">Có sẵn</option>
                    <option value="0">Không có sẵn</option>
                </select><br/>

                <button type="submit">Cập nhật</button>
                <button type="button" onclick="hideEditForm()">Hủy</button>
            </form>
        </div>


        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            function showEditForm(id, name, brand, category, totalPrice, description, image, totalVehicles, isAvailable) {
                // Điền thông tin vào form
                document.getElementById("id").value = id;
                document.getElementById("name").value = name;
                document.getElementById("brand").value = brand;
                document.getElementById("category").value = category;
                document.getElementById("totalPrice").value = totalPrice;
                document.getElementById("description").value = description;
                document.getElementById("image").value = image;
                document.getElementById("totalVehicles").value = totalVehicles;
                document.getElementById("available").value = isAvailable;

                // Hiển thị form
                document.getElementById("editForm").style.display = "block";
            }

            function hideEditForm() {
                // Ẩn form khi hủy
                document.getElementById("editForm").style.display = "none";
                tinymce.remove("#description"); // Xóa TinyMCE khi đóng form
            }

             function openConfig() {
                document.getElementById("configModal").style.display = "block";
            }

            function closeConfig() {
                document.getElementById("configModal").style.display = "none";
            }
        </script>


    <script>
        $(document).ready(function () {
            $('#vehicleTable').DataTable({
                "pageLength": 10, // Hiển thị 10 sản phẩm mỗi trang
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

</div>
</body>
</html>
