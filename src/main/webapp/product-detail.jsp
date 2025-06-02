<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.dao.CommentDao" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/22/2024
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- Added JSTL functions --%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${p.name}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/product-detail.css"> <%-- Your main CSS for this page --%>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <script src="assets/js/ValidateAndCalculate.js"></script>
    <%-- Add a link to Font Awesome if not already in header.jsp or base.css for icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
<%@ include file="header.jsp" %>

<div class="product-detail">
    <div class="container">
        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>

        <div class="information-content">
            <div class="product-image">
                <img src="${p.img}" alt="${p.name}">
            </div>

            <form class="rental-information" action="OrderController" method="post">
                <input type="hidden" name="pid" value="${param.pid}">
                <input type="hidden" name="price" value="${p.price}">

                <div class="info">
                    <h1 class="name-moto" style="text-align: center">${p.name}</h1>
                    <h3 id="price-per-day">Giá thuê: <f:formatNumber value="${p.price}"/>đ/ngày</h3>
                    <h3 id="manufacturer">Nhà sản xuất: ${p.brand}</h3>
                    <h3 id="year-of-manufacture">Năm sản xuất: ${p.year}</h3>
                    <h3 id="type">Loại xe: ${empty p.type ? 'Xe số' : p.type}</h3>
                    <p class="note">* Giá thuê chưa bao gồm: Xăng phục vụ suốt chuyến đi, Bảo hiểm hành khách, Thuế VAT,
                        Phụ thu dịp Lễ Tết.</p>
                </div>

                <div class="fill-in-info">
                    <div class="fill-in-item">
                        <label for="coupon">Mã giảm giá</label>
                        <input type="text" id="coupon" name="coupon">

                        <label for="location">Địa điểm giao xe</label>
                        <input type="text" id="location" name="location" required>

                        <label for="rentalStartDate">Thời gian nhận xe</label>
                        <input type="date" id="rentalStartDate" name="rentalStartDate" required>

                        <label for="expectedReturnDate">Thời gian trả xe</label>
                        <input type="date" id="expectedReturnDate" name="expectedReturnDate" required>

                        <label for="deliveryOption">Đơn vị vận chuyển</label>
                        <select name="deliveryOption" id="deliveryOption" onchange="updateDeliveryFee()" required>
                            <option value="grab">Tiết kiệm - 30.000đ</option>
                            <option value="ghn">Giao Hàng Nhanh - 35.000đ</option>
                            <option value="pickup">Nhận tại cửa hàng - Miễn phí</option>
                        </select>

                        <label for="deliveryFee">Phí vận chuyển</label>
                        <input type="text" id="deliveryFee" name="deliveryFee" readonly value="30000">

                        <label for="paymentMethod">Phương thức thanh toán</label>
                        <select name="paymentMethod" id="paymentMethod" required>
                            <option value="cod">Thanh toán khi nhận xe</option>
                            <option value="momo">Thanh toán bằng MoMo</option>
                            <option value="vnpay">Thanh toán bằng Vnpay</option>
                        </select>
                    </div>
                    <div class="fill-in-item">
                        <h3 id="totalPrice">Tổng tiền thuê + vận chuyển: 0 đ</h3>
                    </div>
                </div>

                <div class="button">
                    <button type="submit">Đặt xe</button>
                    <button type="button" onclick="alert('Bạn đã thêm vào giỏ hàng thành công.')">
                        <a href="add-cart?pid=${p.id}">Thêm vào giỏ hàng</a>
                    </button>
                </div>
            </form>
        </div>

        <div class="products-detailed-information">
            <h1 class="product-title">Mô tả / Đánh giá chi tiết</h1>
            <div class="product-description">
                <p>${p.description}</p>
            </div>
        </div>
    </div>
</div>

<div class="comment-section-wrapper container">
    <div class="comment-form-section">
        <h3><i class="fas fa-pencil-alt"></i> Viết bình luận</h3>
        <c:if test="${sessionScope.user != null}">
            <form action="CommentController" method="post" class="comment-form">
                <input type="hidden" name="product_id" value="${p.id}">
                <textarea name="comment" placeholder="Chia sẻ ý kiến của bạn..." required rows="4"></textarea>
                <button type="submit" class="btn btn-primary">Gửi bình luận</button>
            </form>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <p class="login-prompt">Bạn cần <a href="login.jsp">đăng nhập</a> để bình luận.</p>
        </c:if>
    </div>

    <div class="comments-list-section">
        <h3><i class="fas fa-comments"></i> Các bình luận (${fn:length(comments)})</h3>
        <c:choose>
            <c:when test="${not empty comments}">
                <c:forEach var="c" items="${comments}">
                    <div class="comment-item">
                        <div class="comment-avatar">
                                <%-- Placeholder for avatar - first letter of username --%>
                            <span class="avatar-initials">${fn:toUpperCase(fn:substring(c.username, 0, 1))}</span>
                        </div>
                        <div class="comment-content">
                            <div class="comment-header">
                                <span class="comment-username">${c.username}</span>
                                <span class="comment-timestamp">
                                    <i class="far fa-clock"></i> <f:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                </span>
                            </div>
                            <div class="comment-body">
                                <p>${c.comment}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-comments-message">Chưa có bình luận nào cho sản phẩm này. Hãy là người đầu tiên!</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>


<%-- Related Products Section --%>
<%--<div class="cac-san-pham-khac container">--%>
<%--    <h1>Các sản phẩm tương tự</h1>--%>
<%--    <div class="products-section">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${not empty relatedProducts}">--%>
<%--                <ul class="products">--%>
<%--                    <c:forEach var="relatedProduct" items="${relatedProducts}">--%>
<%--                        <li>--%>
<%--                            <div class="product-item">--%>
<%--                                <div class="product-top">--%>
<%--                                    <a href="product?pid=${relatedProduct.id}" class="product-thumb">--%>
<%--                                        <img src="${relatedProduct.img}" alt="${relatedProduct.name}">--%>
<%--                                    </a>--%>
<%--                                    <a href="product?pid=${relatedProduct.id}" class="buy-now">Xem chi tiết</a>--%>
<%--                                </div>--%>
<%--                                <div class="product-info">--%>
<%--                                    <a href="product?pid=${relatedProduct.id}" class="product-cat">${relatedProduct.type}</a>--%>
<%--                                    <a href="product?pid=${relatedProduct.id}" class="product-name">${relatedProduct.name}</a>--%>
<%--                                    <div class="product-price"><f:formatNumber value="${relatedProduct.price}"/> đ</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>
<%--                </ul>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <p style="text-align: center; margin-top: 20px;">Không có sản phẩm tương tự nào.</p>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </div>--%>
<%--</div>--%>

<c:if test="${param.message == 'success'}">
    <script>
        alert("Đặt xe thành công!");
        setTimeout(function() {
            window.location.href = "order-status.jsp?userId=${sessionScope.user.id}";
        }, 2000);
    </script>
</c:if>
<c:if test="${param.message == 'fail'}">
    <script>
        alert("Đặt xe thất bại. Vui lòng thử lại!");
    </script>
</c:if>

<script>
    function updateDeliveryFee() {
        var deliveryOption = document.getElementById("deliveryOption").value;
        var deliveryFeeInput = document.getElementById("deliveryFee");

        if (deliveryOption === "grab") {
            deliveryFeeInput.value = 30000;
        } else if (deliveryOption === "ghn") {
            deliveryFeeInput.value = 35000;
        } else { // pickup
            deliveryFeeInput.value = 0;
        }
        updateTotalPrice();
    }

    function updateTotalPrice() {
        const pricePerDayElement = document.querySelector('input[name="price"]');
        const deliveryFeeElement = document.getElementById("deliveryFee");
        const startDateElement = document.getElementById("rentalStartDate");
        const endDateElement = document.getElementById("expectedReturnDate");
        const totalPriceElement = document.getElementById("totalPrice");

        if (!pricePerDayElement || !deliveryFeeElement || !startDateElement || !endDateElement || !totalPriceElement) {
            console.error("One or more elements for price calculation are missing.");
            totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: Lỗi tính toán";
            return;
        }

        const pricePerDay = parseFloat(pricePerDayElement.value);
        const deliveryFee = parseFloat(deliveryFeeElement.value);
        const startStr = startDateElement.value;
        const endStr = endDateElement.value;

        if (isNaN(pricePerDay) || isNaN(deliveryFee)) {
            totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: Vui lòng nhập đủ thông tin";
            return;
        }

        if (startStr && endStr) {
            const start = new Date(startStr);
            const end = new Date(endStr);

            if (!isNaN(start.getTime()) && !isNaN(end.getTime())) {
                if (end < start) {
                    totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: Ngày trả không hợp lệ";
                    return;
                }
                let rentalDays = 0;
                if (end.getTime() >= start.getTime()) {
                    // Calculate the difference in days
                    const diffInMilliseconds = end.getTime() - start.getTime();
                    // If start and end are the same day, it's 1 day.
                    // Otherwise, it's the number of 24-hour periods rounded up, plus one.
                    if (start.toDateString() === end.toDateString()) {
                        rentalDays = 1;
                    } else {
                        // Number of full 24-hour periods
                        rentalDays = Math.ceil(diffInMilliseconds / (1000 * 60 * 60 * 24)) +1 ;
                        // This logic ensures that even a few hours into the next day counts as an additional day if that's the business rule.
                        // Or more simply, for rental days inclusive of start and end:
                        // rentalDays = Math.round(diffInMilliseconds / (1000 * 60 * 60 * 24)) + 1;
                        // The user's original `Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;`
                        // with same day check `rentalDays = 1;` is generally fine for counting calendar days involved.
                        // Let's use a clear version for "inclusive days":
                        const oneDay = 1000 * 60 * 60 * 24;
                        rentalDays = Math.floor(diffInMilliseconds / oneDay) + 1;
                        if (start.toDateString() === end.toDateString()) { rentalDays = 1;}


                    }
                } else { // This case should not be reached if end < start is already checked
                    totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: Ngày trả không hợp lệ";
                    return;
                }

                const totalRentalCost = pricePerDay * rentalDays;
                const grandTotal = totalRentalCost + deliveryFee;
                totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: " + grandTotal.toLocaleString('vi-VN') + " đ";

            } else {
                totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: Ngày không hợp lệ";
            }
        } else {
            const grandTotal = deliveryFee;
            totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: " + grandTotal.toLocaleString('vi-VN') + " đ (chưa tính ngày thuê)";
        }
    }

    document.getElementById("rentalStartDate").addEventListener("change", updateTotalPrice);
    document.getElementById("expectedReturnDate").addEventListener("change", updateTotalPrice);

    document.addEventListener('DOMContentLoaded', function() {
        updateDeliveryFee();
    });
</script>

<%@ include file="footer.jsp" %>
</body>
<style>
    /* Comment Section Styling */
    .comment-section-wrapper.container { /* Thêm .container nếu nó là class của wrapper */
        display: flex; /* Sử dụng flexbox cho layout tổng thể của wrapper */
        flex-direction: column; /* Xếp các section con theo chiều dọc */
        gap: 30px; /* Khoảng cách giữa form-section và list-section */
        margin-top: 40px;
        padding-top: 20px;
        border-top: 1px solid #e0e0e0;
        width: 100%; /* Đảm bảo wrapper chiếm đủ không gian */
        box-sizing: border-box;
    }

    /* Không cần đặt width:100% cho các section con nữa nếu wrapper là flex column */
    .comment-form-section {
        /* margin-bottom: 40px;  Đã dùng gap ở wrapper */
    }
    .comments-list-section {
        /* margin-bottom: 30px; Đã dùng gap ở wrapper */
    }

    .comment-section-wrapper h3 {
        font-size: 1.4em; /* Có thể giảm nhẹ nếu 1.5em quá lớn */
        color: #333;
        margin-top: 0;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #f0f0f0;
    }

    .comment-section-wrapper h3 i {
        margin-right: 10px; /* Tăng nhẹ khoảng cách icon */
        color: #007bff;
    }

    /* Comment Form */
    .comment-form textarea {
        width: 100%;
        padding: 12px 15px; /* Tăng padding ngang một chút */
        border: 1px solid #ced4da; /* Màu viền Bootstrap-like */
        border-radius: 5px;
        margin-bottom: 15px;
        font-family: 'Roboto', sans-serif;
        font-size: 1rem; /* Sử dụng rem cho font-size */
        line-height: 1.5;
        resize: vertical;
        box-sizing: border-box;
        transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }

    .comment-form textarea:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        outline: none;
    }

    .comment-form button.btn.btn-primary {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
        font-weight: 500; /* Làm nút chữ đậm hơn chút */
        transition: background-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        display: inline-block;
    }

    .comment-form button.btn.btn-primary:hover {
        background-color: #0056b3;
        box-shadow: 0 2px 5px rgba(0,0,0,0.15);
    }
    .comment-form button.btn.btn-primary:active {
        background-color: #004085;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.2);
    }

    .login-prompt {
        background-color: #e9ecef; /* Màu nền nhẹ nhàng hơn */
        border-left: 4px solid #007bff;
        padding: 15px 20px;
        margin-top: 10px;
        border-radius: 4px;
        font-size: 0.95rem;
    }
    .login-prompt a {
        color: #0056b3;
        font-weight: 500;
    }

    /* Comments List */
    .comments-list-section .no-comments-message {
        color: #6c757d;
        font-style: italic;
        text-align: center;
        padding: 25px 20px;
        background-color: #f8f9fa;
        border: 1px dashed #ced4da; /* Thêm viền dashed nhẹ */
        border-radius: 5px;
        font-size: 0.95rem;
    }

    .comment-item {
        display: flex;
        background-color: #ffffff;
        border: 1px solid #e9ecef;
        border-radius: 8px;
        padding: 18px 20px; /* Tăng padding cho comment item */
        margin-bottom: 18px; /* Giảm nhẹ margin bottom */
        box-shadow: 0 1px 3px rgba(0,0,0,0.04); /* Shadow rất nhẹ */
        transition: box-shadow 0.2s ease-in-out;
    }
    .comment-item:hover {
        box-shadow: 0 3px 8px rgba(0,0,0,0.08);
    }
    .comment-item:last-child {
        margin-bottom: 0;
    }

    .comment-avatar {
        margin-right: 18px; /* Tăng khoảng cách avatar */
        flex-shrink: 0;
        display: flex;
        align-items: flex-start; /* Căn avatar lên trên nếu nội dung dài */
        padding-top: 2px; /* Căn chỉnh nhỏ cho avatar */
    }

    .avatar-initials {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 42px; /* Giảm nhẹ kích thước avatar nếu cần */
        height: 42px;
        border-radius: 50%;
        background-color: #6c757d;
        color: white;
        font-weight: 500;
        font-size: 1.2em;
        text-transform: uppercase;
    }

    .comment-content {
        flex-grow: 1;
        display: flex;
        flex-direction: column; /* Sắp xếp header và body theo chiều dọc */
    }

    .comment-header {
        display: flex;
        justify-content: space-between; /* Giữ nguyên */
        align-items: center;
        margin-bottom: 6px; /* Giảm nhẹ margin bottom */
    }

    .comment-username {
        font-weight: 600;
        color: #212529; /* Màu đen đậm hơn cho username */
        font-size: 1rem; /* Kích thước font username */
        margin-right: 10px; /* Khoảng cách với timestamp nếu chúng sát nhau trên mobile */
    }

    .comment-timestamp {
        font-size: 0.78rem; /* Font nhỏ hơn cho timestamp */
        color: #6c757d;
        white-space: nowrap; /* Ngăn timestamp xuống dòng */
    }
    .comment-timestamp i {
        margin-right: 5px; /* Khoảng cách icon đồng hồ */
        font-size: 0.75rem; /* Kích thước icon đồng hồ */
    }

    .comment-body p {
        margin: 0;
        line-height: 1.65; /* Tăng line-height cho dễ đọc */
        color: #495057;
        font-size: 0.9rem; /* Kích thước font nội dung comment */
        word-wrap: break-word;
    }

    /* Responsive adjustments for comments if needed */
    @media (max-width: 768px) { /* Điều chỉnh breakpoint nếu cần */
        .comment-header {
            /* flex-direction: column; Giữ nguyên hoặc đổi tùy ý */
            /* align-items: flex-start; */
        }
        .comment-username {
            font-size: 0.95rem;
        }
        .comment-timestamp {
            font-size: 0.75rem;
        }
        .comment-body p {
            font-size: 0.88rem;
        }
    }
    @media (max-width: 600px) {
        .comment-header {
            flex-direction: column;
            align-items: flex-start;
        }
        .comment-timestamp {
            margin-top: 5px;
        }
        .comment-item {
            padding: 12px 15px;
        }
        .avatar-initials {
            width: 38px;
            height: 38px;
            font-size: 1.1em;
        }
        .comment-form-section {
            margin-bottom: 30px;
        }
        .comment-section-wrapper.container {
            gap: 20px;
        }
    }
</style>
</html>