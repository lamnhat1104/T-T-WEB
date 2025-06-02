<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.dao.CommentDao" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/22/2024
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>"${p.name}"</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/product-detail.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <script src="assets/js/ValidateAndCalculate.js"></script>
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
                    <h3 id="type">Loại xe: Xe số</h3>
                    <p class="note">* Giá thuê chưa bao gồm: Xăng phục vụ suốt chuyến đi, Bảo hiểm hành khách, Thuế VAT,
                        Phụ thu dịp Lễ Tết.</p>
                </div>
                <div class="fill-in-info">
                    <div class="fill-in-item">





                        <%--@declare id="paymentmethods"--%><label for="coupon">Mã giảm giá</label>
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
                            <option value="momo">Thanh toán bằng MoMo</option>
                            <option value="cod">Thanh toán khi nhận xe</option>
                            <option value="vnpay">Thanh toán bằng Vnpay</option>
                        </select>
                        <div class="fill-in-item">
                            <h3 id="totalPrice">Tổng tiền thuê + vận chuyển: 0 đ</h3>
                        </div>


                    </div>

                    <div class="button">
                        <button type="submit">Đặt xe</button>
                        <%--                        <a href="add-cart?pid=${p.id}"><button type="button" onclick="alert('Bạn đã thêm vào giỏ hàng thành công.')">Thêm vào giỏ hàng</button></a>--%>
                        <button type="button" onclick="alert('Bạn đã thêm vào giỏ hàng thành công.')"><a
                                href="add-cart?pid=${p.id}">Thêm vào giỏ hàng</a></button>
                    </div>
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
<div class="comment-section">
    <h3>Viết bình luận</h3>
    <c:if test="${user != null}">
        <form action="CommentController" method="post">
            <input type="hidden" name="product_id" value="${productId}">
            <textarea name="comment" placeholder="Viết bình luận..." required></textarea><br><br>
            <button type="submit">Gửi bình luận</button>
        </form>
    </c:if>
    <c:if test="${user == null}">
        <p>Bạn cần <a href="login.jsp">đăng nhập</a> để bình luận.</p>
    </c:if>

    <h3>Các bình luận</h3>
    <c:forEach var="c" items="${comments}">
        <p><b>${c.username}</b>: ${c.comment} <i>(${c.createdAt})</i></p>
        <hr>
    </c:forEach>
    <c:if test="${empty comments}">
        <p>Chưa có bình luận nào cho sản phẩm này.</p>
    </c:if>
</div>


<%--<div class="cac-san-pham-khac">--%>
<%--    <h1>Các sản phẩm tương tự</h1>--%>
<%--<c:forEach var="relatedProduct" items="${relatedProducts}">--%>
<%--    <div id="wrapper">--%>
<%--        <div class="headline">--%>
<%--            <ul class="products">--%>
<%--                <li>--%>
<%--                    <div class="product-item">--%>
<%--                        <div class="product-top">--%>
<%--                            <a href="" class="product-thumb">--%>
<%--                                <img src="${relatedProduct.img}" alt="">--%>
<%--                            </a>--%>
<%--                            <!--Mua ngay-->--%>
<%--                            <a href="/product?pid=${relatedProduct.id}" class="buy-now">Đặt ngay</a>--%>
<%--                          </div>--%>
<%--                        <div class="product-info">--%>
<%--                            <a href="" class="product-cat"> ${relatedProduct.type}</a>--%>
<%--                            <a href="" class="product-name"> ${relatedProduct.name}</a>--%>
<%--                            <div class="product-price"><f:formatNumber value="${relatedProduct.price}"/></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div >--%>
<%--</c:forEach>--%>
<%--</div>--%>

<c:if test="${param.message == 'success'}">
    <script>
        alert("Đặt xe thành công!");
        // Sau khi thông báo, tự động chuyển trang sau 2 giây
        setTimeout(function() {
            window.location.href = "order-status.jsp?userId=${user.id}";
        }, 2000);
    </script>
</c:if>
<c:if test="${param.message == 'fail'}">
    <script>alert("Đặt xe thất bại. Vui lòng thử lại!");</script>
</c:if>

<script>
    function updateDeliveryFee() {
        var deliveryOption = document.getElementById("deliveryOption").value;
        var deliveryFeeInput = document.getElementById("deliveryFee");

        if (deliveryOption === "grab") {
            deliveryFeeInput.value = 30000;
        } else if (deliveryOption === "ghn") {
            deliveryFeeInput.value = 35000;
        } else {
            deliveryFeeInput.value = 0;
        }

        updateTotalPrice();
    }

    function updateTotalPrice() {
        const pricePerDay = parseFloat(document.querySelector('input[name="price"]').value);
        const deliveryFee = parseFloat(document.getElementById("deliveryFee").value);
        const start = new Date(document.getElementById("rentalStartDate").value);
        const end = new Date(document.getElementById("expectedReturnDate").value);

        if (!isNaN(start.getTime()) && !isNaN(end.getTime())) {
            const days = Math.max(1, (end - start) / (1000 * 3600 * 24));
            const total = pricePerDay * days + deliveryFee;

            document.getElementById("totalPrice").textContent = "Tổng tiền thuê: " + total.toLocaleString('vi-VN') + " đ";
        }
    }

    // Tự động cập nhật khi chọn ngày
    document.getElementById("rentalStartDate").addEventListener("change", updateTotalPrice);
    document.getElementById("expectedReturnDate").addEventListener("change", updateTotalPrice);
</script>

<%@ include file="footer.jsp" %>
</body>
</html>

