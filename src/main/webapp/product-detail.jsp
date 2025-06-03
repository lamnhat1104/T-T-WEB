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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${p.name}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/product-detail.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <script src="assets/js/ValidateAndCalculate.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* (Your existing CSS here) */
        .comment-section-wrapper.container {
            display: flex;
            flex-direction: column;
            gap: 30px;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
            width: 100%;
            box-sizing: border-box;
        }
        .comment-section-wrapper h3 {
            font-size: 1.4em;
            color: #333;
            margin-top: 0;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
        }
        .comment-section-wrapper h3 i {
            margin-right: 10px;
            color: #007bff;
        }
        .comment-form textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            margin-bottom: 15px;
            font-family: 'Roboto', sans-serif;
            font-size: 1rem;
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
            font-weight: 500;
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
            background-color: #e9ecef;
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
        .comments-list-section .no-comments-message {
            color: #6c757d;
            font-style: italic;
            text-align: center;
            padding: 25px 20px;
            background-color: #f8f9fa;
            border: 1px dashed #ced4da;
            border-radius: 5px;
            font-size: 0.95rem;
        }
        .comment-item {
            display: flex;
            background-color: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 18px 20px;
            margin-bottom: 18px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
            transition: box-shadow 0.2s ease-in-out;
        }
        .comment-item:hover {
            box-shadow: 0 3px 8px rgba(0,0,0,0.08);
        }
        .comment-item:last-child {
            margin-bottom: 0;
        }
        .comment-avatar {
            margin-right: 18px;
            flex-shrink: 0;
            display: flex;
            align-items: flex-start;
            padding-top: 2px;
        }
        .avatar-initials {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 42px;
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
            flex-direction: column;
        }
        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
        }
        .comment-username {
            font-weight: 600;
            color: #212529;
            font-size: 1rem;
            margin-right: 10px;
        }
        .comment-timestamp {
            font-size: 0.78rem;
            color: #6c757d;
            white-space: nowrap;
        }
        .comment-timestamp i {
            margin-right: 5px;
            font-size: 0.75rem;
        }
        .comment-body p {
            margin: 0;
            line-height: 1.65;
            color: #495057;
            font-size: 0.9rem;
            word-wrap: break-word;
        }
        @media (max-width: 768px) {
            .comment-username { font-size: 0.95rem; }
            .comment-timestamp { font-size: 0.75rem; }
            .comment-body p { font-size: 0.88rem; }
        }
        @media (max-width: 600px) {
            .comment-header { flex-direction: column; align-items: flex-start; }
            .comment-timestamp { margin-top: 5px; }
            .comment-item { padding: 12px 15px; }
            .avatar-initials { width: 38px; height: 38px; font-size: 1.1em; }
            .comment-form-section { margin-bottom: 30px; }
            .comment-section-wrapper.container { gap: 20px; }
        }
        #comment-error-message {
            color: red;
            margin-top: 10px;
            font-size: 0.9em;
        }
    </style>
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
            <%-- Changed form action to # and added id="commentForm" --%>
            <form id="commentForm" action="#" method="post" class="comment-form">
                <input type="hidden" name="product_id" value="${p.id}">
                <textarea name="comment" id="commentText" placeholder="Chia sẻ ý kiến của bạn..." required rows="4"></textarea>
                <button type="submit" class="btn btn-primary">Gửi bình luận</button>
            </form>
            <div id="comment-error-message"></div>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <p class="login-prompt">Bạn cần <a href="login.jsp">đăng nhập</a> để bình luận.</p>
        </c:if>
    </div>

    <div class="comments-list-section">
        <h3 id="comments-title"><i class="fas fa-comments"></i> Các bình luận (<span id="commentCount">${fn:length(comments)}</span>)</h3>
        <%-- Added id="commentsListContainer" --%>
        <div id="commentsListContainer">
            <c:choose>
                <c:when test="${not empty comments}">
                    <c:forEach var="c" items="${comments}">
                        <div class="comment-item">
                            <div class="comment-avatar">
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
                    <p class="no-comments-message" id="noCommentsMessage">Chưa có bình luận nào cho sản phẩm này. Hãy là người đầu tiên!</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<%-- (Related Products Section - unchanged) --%>

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
    // Function to update delivery fee (unchanged)
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

    // Function to update total price (unchanged)
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
                    const oneDay = 1000 * 60 * 60 * 24;
                    rentalDays = Math.floor((end.getTime() - start.getTime()) / oneDay) + 1;
                    if (start.toDateString() === end.toDateString()) { rentalDays = 1;}
                } else {
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
            const grandTotal = deliveryFee; // If dates are not set, only show delivery fee
            totalPriceElement.textContent = "Tổng tiền thuê + vận chuyển: " + grandTotal.toLocaleString('vi-VN') + " đ (chưa tính ngày thuê)";
        }
    }

    document.getElementById("rentalStartDate").addEventListener("change", updateTotalPrice);
    document.getElementById("expectedReturnDate").addEventListener("change", updateTotalPrice);

    document.addEventListener('DOMContentLoaded', function() {
        updateDeliveryFee(); // Initial call to set delivery fee and total price

        // AJAX for comment submission
        const commentForm = document.getElementById('commentForm');
        if (commentForm) {
            commentForm.addEventListener('submit', function(event) {
                event.preventDefault(); // Prevent default form submission

                const formData = new FormData(commentForm);
                const commentText = formData.get('comment').trim();
                const commentErrorMessage = document.getElementById('comment-error-message');
                commentErrorMessage.textContent = ''; // Clear previous error

                if (!commentText) {
                    commentErrorMessage.textContent = 'Nội dung bình luận không được để trống.';
                    return;
                }

                fetch('CommentController', {
                    method: 'POST',
                    body: new URLSearchParams(formData) // Sends data as application/x-www-form-urlencoded
                })
                    .then(response => {
                        if (!response.ok) {
                            // Try to parse error from JSON if server sends it
                            return response.json().then(err => { throw err; });
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.success && data.comment) {
                            prependComment(data.comment);
                            document.getElementById('commentText').value = ''; // Clear textarea
                            updateCommentCount(1); // Increment count
                            const noCommentsMsg = document.getElementById('noCommentsMessage');
                            if (noCommentsMsg) {
                                noCommentsMsg.style.display = 'none'; // Hide "no comments" message
                            }
                        } else {
                            commentErrorMessage.textContent = data.message || 'Không thể gửi bình luận.';
                            console.error('Error submitting comment:', data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Fetch error:', error);
                        let msg = 'Lỗi kết nối hoặc lỗi từ server.';
                        if (error && error.message) { // If error is an object with a message property
                            msg = error.message;
                        } else if (typeof error === 'string') { // If error is just a string
                            msg = error;
                        }
                        commentErrorMessage.textContent = msg;
                    });
            });
        }
    });

    function prependComment(commentData) {
        const commentsListContainer = document.getElementById('commentsListContainer');
        if (!commentsListContainer) return;

        // Sanitize comment text - simple HTML entity encoding
        const sanitizedCommentText = commentData.comment.replace(/</g, "<").replace(/>/g, ">");
        const sanitizedUsername = commentData.username.replace(/</g, "<").replace(/>/g, ">");

        const commentItemHTML = `
            <div class="comment-item">
                <div class="comment-avatar">
                    <span class="avatar-initials">${sanitizedUsername.substring(0, 1).toUpperCase()}</span>
                </div>
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="comment-username">${sanitizedUsername}</span>
                        <span class="comment-timestamp">
                            <i class="far fa-clock"></i> ${commentData.createdAt}
                        </span>
                    </div>
                    <div class="comment-body">
                        <p>${sanitizedCommentText}</p>
                    </div>
                </div>
            </div>
        `;
        commentsListContainer.insertAdjacentHTML('afterbegin', commentItemHTML); // Prepend
    }

    function updateCommentCount(change) {
        const countSpan = document.getElementById('commentCount');
        if (countSpan) {
            let currentCount = parseInt(countSpan.textContent) || 0;
            countSpan.textContent = currentCount + change;
        }
    }

    // Scroll to top button (unchanged)
    let mybutton = document.getElementById("myBtn");
    window.onscroll = function() {scrollFunction()};
    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
</script>

<%@ include file="footer.jsp" %>
</body>
</html>