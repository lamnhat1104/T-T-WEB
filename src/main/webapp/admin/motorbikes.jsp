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
        /* ===================== Modal ===================== */
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

        /* ===================== Close Button ===================== */
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

        /* ===================== Form Container ===================== */
        .admin-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 10px;
        }

        .form-container {
            width: 100%;
        }

        .form-container h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 20px;
        }

        /* ===================== Input Group ===================== */
        .form-group label,
        form label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 14px;
            color: #333;
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

        textarea {
            resize: vertical;
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

        /* ===================== Responsive (mobile) ===================== */
        @media (max-width: 500px) {
            .modal-content {
                padding: 20px;
            }

            .form-container h3 {
                font-size: 18px;
            }

            button {
                width: 100%;
                margin-bottom: 10px;
            }
        }

        /* ===================== Dropdown Trạng thái trong Bảng ===================== */
        table#vehicleTable select {
            padding: 6px 12px;
            font-size: 13px;
            font-weight: 500;
            border-radius: 6px;
            border: 1px solid #bbb;
            background-color: #fdfdfd;
            color: #333;
            transition: all 0.3s ease;
        }

        table#vehicleTable select:hover {
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
                <a href="/demo/admin?action=managerVehicleType" class="dashboard-active"><span class="las la-motorcycle"></span>
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
                                        <td>
                                            <form action="admin" method="get">
                                            <input type="hidden" name="action" value="changeStatusVehicle"/>
                                            <input type="hidden" name="vehicleId" value="${v.id}"/>
                                            <select name="isAvailable" onchange="this.form.submit()">
                                                <option value="1" ${v.available == 1 ? 'selected' : ''}>Có sẵn</option>
                                                <option value="0" ${v.available == 0 ? 'selected' : ''}>Không có sẵn</option>
                                            </select>
                                        </form>

                                        </td>
                                        <td>
                                            <button type="button" onclick="showEditForm('${v.id}', '${v.name}', '${v.brand}', '${v.category}', '${v.totalPrice}', '${v.description}', '${v.image}', '${v.totalVehicles}', '${v.available}')">Sửa</button>
                                            <form action="admin?action=deleteVehicleType" method="POST" style="display:inline;">
                                                <input type="hidden" name="vehicleId" value="${v.id}"/>
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

                        <button type="submit">Thêm Xe</button>
                        <button type="button" onclick="closeConfig()">Hủy</button>
                    </form>

                </div>
            </div>
        </div>
        <div id="configModal2" class="modal">
            <div class="modal-content">
                <div class="admin-container">
                    <div class="form-container">

                        <!-- Form sửa thông tin -->
                        <div id="editForm" style="display:none;">
                            <span class="close-btn" onclick="hideEditForm2()">&times;</span>
                            <h3>Chỉnh sửa Xe</h3>
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
                                <button type="button" onclick="hideEditForm2()">Hủy</button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
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

                document.getElementById("configModal2").style.display = "flex";
                document.getElementById("editForm").style.display = "block";
                document.getElementById("configModal").style.display = "none";
            }
            function hideEditForm2() {
                document.getElementById("configModal2").style.display = "none";
                document.getElementById("editForm").style.display = "none";
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
