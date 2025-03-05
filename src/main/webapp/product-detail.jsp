<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/22/2024
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h3 id="price-per-day">Giá thuê: <f:formatNumber value="${p.price}" />đ/ngày</h3>
                        <h3 id="manufacturer">Nhà sản xuất: ${p.brand}</h3>
                        <h3 id="year-of-manufacture">Năm sản xuất: ${p.year}</h3>
                        <h3 id="type">Loại xe: Xe số</h3>
                        <p class="note">* Giá thuê chưa bao gồm: Xăng phục vụ suốt chuyến đi, Bảo hiểm hành khách, Thuế VAT, Phụ thu dịp Lễ Tết.</p>
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
                      <div class="fill-in-item">
                          <h3 id="totalPrice">Tổng tiền thuê: 0 đ</h3>
                      </div>
                    </div>
                    <div class="button">
                        <button type="submit">Đặt xe</button>
<%--                        <a href="add-cart?pid=${p.id}"><button type="button" onclick="alert('Bạn đã thêm vào giỏ hàng thành công.')">Thêm vào giỏ hàng</button></a>--%>
                        <button type="button" onclick="alert('Bạn đã thêm vào giỏ hàng thành công.')"><a href="add-cart?pid=${p.id}">Thêm vào giỏ hàng</a></button>
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
    <script>alert("Đặt xe thành công!");</script>
</c:if>
<c:if test="${param.message == 'fail'}">
    <script>alert("Đặt xe thất bại. Vui lòng thử lại!");</script>
</c:if>

<%@ include file="footer.jsp" %>
</body>
</html>

