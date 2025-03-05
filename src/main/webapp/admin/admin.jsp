<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:35 PM
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
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin.css">
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

        .xem-btn{
            background-color: #007bff;
        }

        .see-btn{
            background: #4CAF50;
            color: white;
        }
    </style>
    <link rel="stylesheet" href="admin.css">
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
                <a href="/DoAnCuoiKi/admin?action=dashboard" class="dashboard-active">
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
            Dashboard
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
        <div class="cards">
            <div class="card-single">
                <div>
                    <h1>23</h1>
                    <span>Tài khoản</span>
                </div>
                <div>
                    <span class="las la-user-circle"></span>
                </div>
            </div>
            <div class="card-single">
                <div>
                    <h1>50</h1>
                    <span>Xe máy</span>
                </div>
                <div>
                    <span class="las la-motorcycle"></span>
                </div>
            </div>
            <div class="card-single">
                <div>
                    <h1>54</h1>
                    <span>Khách hàng</span>
                </div>
                <div>
                    <span class="las la-users"></span>
                </div>
            </div>

            <div class="card-single">
                <div>
                    <h1>124</h1>
                    <span>Đơn hàng</span>
                </div>
                <div>
                    <span class="las la-shopping-bag"></span>
                </div>
            </div>
            <div class="card-single">
                <div>
                    <h1>79</h1>
                    <span>Phản hồi</span>
                </div>
                <div>
                    <span class="las la-receipt"></span>
                </div>
            </div>
            <div class="card-single">
                <div>
                    <h1>10</h1>
                    <span>Khuyến mãi</span>
                </div>
                <div>
                    <span class="las la-ticket-alt"></span>
                </div>
            </div>
            <div class="card-single">
                <div>
                    <h1>5</h1>
                    <span>Thống kê</span>
                </div>
                <div>
                    <span class="las la-clipboard-list"></span>
                </div>
            </div>
            <div class="card-single">
                <div>
                    <h1>3</h1>
                    <span>Cài đặt</span>
                </div>
                <div>
                    <span class="las la-cog"></span>
                </div>
            </div>
        </div>
        <div class="recent-grid2">
            <div class="projects">
                <div class="card">
                    <div class="card-header">
                        <h3>Khách hàng gần đây</h3>
                        <button class="xem-btn"> Xem tất cả<span class="las la-arrow-right"></span> </button>
                    </div>

                    <div class="card-body">
                        <table width="100%">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ tên</th>
                                <th>Ngày sinh</th>
                                <th>Giới tính</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Ngày đăng ký</th>
                                <th>Chi tiết sản phẩm đã thuê</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>KH01</td>
                                <td>Mai Lâm Nhật</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130195@st</td>
                                <td>0908028875</td>
                                <td>KTX khu B</td>
                                <td>20-10-2024</td>
                                <td>
                                    <button class="see-btn" onclick="openConfig()">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH02</td>
                                <td>Nguyễn Hoàng Phúc</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130218@st</td>
                                <td>0908028875</td>
                                <td>Hóc Môn</td>
                                <td>15-10-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH03</td>
                                <td>Nguyễn Bảo Nguyên</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130189@st</td>
                                <td>0908028875</td>
                                <td>Gò Vấp</td>
                                <td>03-11-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH04</td>
                                <td>Mai Lâm Nhật</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130195@st</td>
                                <td>0908028875</td>
                                <td>KTX khu B</td>
                                <td>20-10-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH05</td>
                                <td>Nguyễn Hoàng Phúc</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130218@st</td>
                                <td>0908028875</td>
                                <td>Hóc Môn</td>
                                <td>15-10-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH06</td>
                                <td>Nguyễn Bảo Nguyên</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130189@st</td>
                                <td>0908028875</td>
                                <td>Gò Vấp</td>
                                <td>03-11-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH07</td>
                                <td>Mai Lâm Nhật</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130195@st</td>
                                <td>0908028875</td>
                                <td>KTX khu B</td>
                                <td>20-10-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH08</td>
                                <td>Nguyễn Hoàng Phúc</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130218@st</td>
                                <td>0908028875</td>
                                <td>Hóc Môn</td>
                                <td>15-10-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            <tr>
                                <td>KH09</td>
                                <td>Nguyễn Bảo Nguyên</td>
                                <td>11-04-2004</td>
                                <td>nam</td>
                                <td>22130189@st</td>
                                <td>0908028875</td>
                                <td>Gò Vấp</td>
                                <td>03-11-2024</td>
                                <td>
                                    <button class="see-btn">xem chi tiết</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="customers">
                <div class="card">
                    <div class="card-header">
                        <h3>Khách hàng gần đây</h3>
                        <button class="xem-btn"> Xem tất cả<span class="las la-arrow-right"></span> </button>
                    </div>

                    <div class="card-body">
                        <div class="customer">
                            <div class="info">
                                <img src="../assets/img/home_img/user.png" height="40px" width="40px" alt="">
                                <div>
                                    <h4>Lâm Nhật</h4>
                                    <small>SV NLU</small>
                                </div>
                            </div>
                            <div class="contact">
                                <span class="las la-user-circle"></span>
                                <span class="las la-comment"></span>
                                <span class="las la-phone"></span>
                            </div>
                        </div>
                        <div class="customer">
                            <div class="info">
                                <img src="../assets/img/home_img/user.png" height="40px" width="40px" alt="">
                                <div>
                                    <h4>Bảo Nguyên</h4>
                                    <small>SV NLU</small>
                                </div>
                            </div>
                            <div class="contact">
                                <span class="las la-user-circle"></span>
                                <span class="las la-comment"></span>
                                <span class="las la-phone"></span>
                            </div>
                        </div>
                        <div class="customer">
                            <div class="info">
                                <img src="../assets/img/home_img/user.png" height="40px" width="40px" alt="">
                                <div>
                                    <h4>Hoàng Phúc</h4>
                                    <small>SV NLU</small>
                                </div>
                            </div>
                            <div class="contact">
                                <span class="las la-user-circle"></span>
                                <span class="las la-comment"></span>
                                <span class="las la-phone"></span>
                            </div>
                        </div>
                        <div class="customer">
                            <div class="info">
                                <img src="../assets/img/home_img/user.png" height="40px" width="40px" alt="">
                                <div>
                                    <h4>Lâm Nhật</h4>
                                    <small>SV NLU</small>
                                </div>
                            </div>
                            <div class="contact">
                                <span class="las la-user-circle"></span>
                                <span class="las la-comment"></span>
                                <span class="las la-phone"></span>
                            </div>
                        </div>
                        <div class="customer">
                            <div class="info">
                                <img src="../assets/img/home_img/user.png" height="40px" width="40px" alt="">
                                <div>
                                    <h4>Bảo Nguyên</h4>
                                    <small>SV NLU</small>
                                </div>
                            </div>
                            <div class="contact">
                                <span class="las la-user-circle"></span>
                                <span class="las la-comment"></span>
                                <span class="las la-phone"></span>
                            </div>
                        </div>
                        <div class="customer">
                            <div class="info">
                                <img src="../assets/img/home_img/user.png" height="40px" width="40px" alt="">
                                <div>
                                    <h4>Hoàng Phúc</h4>
                                    <small>SV NLU</small>
                                </div>
                            </div>
                            <div class="contact">
                                <span class="las la-user-circle"></span>
                                <span class="las la-comment"></span>
                                <span class="las la-phone"></span>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="configModal" class="modal">
                    <div class="modal-content">
                        <div class="invoice-modal">
                            <div class="invoice-header">
                                <h2>CHI TIẾT HÓA ĐỠ THUÊ XE</h2>
                                <span class="close-btn" onclick="closeConfig()">&times;</span>
                            </div>
                            <div class="invoice-info">
                                <p><strong>Tên:</strong> Nguyễn Bảo Nguyên</p>
                                <p><strong>Địa chỉ:</strong> 123 Đường ABC</p>
                                <p><strong>Số điện thoại:</strong> 0987654321</p>
                                <p><strong>Ngày mua:</strong> 12/11/2023</p>
                            </div>
                            <table class="invoice-table">
                                <thead>
                                <tr>
                                    <th>ID xe</th>
                                    <th>Tên xe</th>
                                    <th>Loại xe</th>
                                    <th>Giá thuê</th>
                                    <th>Mô tả </th>
                                    <th>Hãng sản xuất</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Yamaha Nozza</td>
                                    <td>Xe số</td>
                                    <td>80.000 VND</td>
                                    <td>	Dễ lái, tiết kiệm xăng</td>
                                    <td>Yamaha</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Honda SH</td>
                                    <td>Xe tay ga</td>
                                    <td>180.000 VND</td>
                                    <td>	Dễ lái, tiết kiệm xăng</td>
                                    <td>Honda</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="invoice-total">
                                <strong>TỔNG TIỀN: 260,000 VND</strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        function openConfig() {
            document.getElementById('configModal').style.display = 'flex';
        }

        function closeConfig() {
            document.getElementById('configModal').style.display = 'none';
        }

    </script>

</div>
</body>
</html>
