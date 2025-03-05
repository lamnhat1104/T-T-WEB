<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang san pham moi </title>
    <link rel="stylesheet" href="csssp.css">
    <script src="../../js/locsanphamgiathapdencao.js"></script>
    <script>
        function sortProducts() {
            const priceFilter = document.getElementById('price-filter').value;
            const productList = document.querySelector('.products');
            const products = Array.from(productList.children);

            if (priceFilter === 'asc') {
                products.sort((a, b) => parseFloat(a.getAttribute('data-price')) - parseFloat(b.getAttribute('data-price')));
            } else if (priceFilter === 'desc') {
                products.sort((a, b) => parseFloat(b.getAttribute('data-price')) - parseFloat(a.getAttribute('data-price')));
            }

            productList.innerHTML = '';
            products.forEach(product => productList.appendChild(product));
        }
        // Chèn header
        fetch('header.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('header').innerHTML = data);

        // Chèn footer
        fetch('footer.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('footer').innerHTML = data);
        function filterBestSellers() {
            window.location.href = 'ProductBestSeller';

        }
        function redirectToNewPage() {
            window.location.href = 'ProductNew';
        }
    </script>
</head>
<body>
<header id="header"></header>
<!-- boc loc san pham-->
<div class="hom-filter">
    <span class="hom-filter-label">Sắp xếp theo</span>

    <button class="btnloc" onclick="redirectToNewPage()">Mới nhất </button>
    <button class="btnloc" onclick="filterBestSellers()">Bán chạy </button>
    <div class="filter-group">
        <label for="price-filter">Sắp xếp giá:</label>
        <select id="price-filter" onchange="sortProducts()">
            <option value="default">Mặc định</option>
            <option value="asc">Thấp đến cao</option>
            <option value="desc">Cao đến thấp</option>
        </select>
    </div>
</div>
<!-- boc loc san pham-->
<div id="wrapper">

    <div class="headline">

        <ul class="products">
            <c:forEach var="p" items="${listN}">
            <li data-best-seller="true" data-price="${p.price}">
                <div class="product-item">
                    <div class="product-top">
                        <a class="add-to-cart" onclick="addToCart()">+</a>
                        <a href="" class="product-thumb">
                            <img src="${p.img}" alt="">
                        </a>
                        <!--Mua ngay-->
                        <a href="product?pid=${p.id}" class="buy-now">Đặt ngay</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat"> ${p.type}</a>
                        <a href="" class="product-name"> ${p.name}</a>
                        <div class="product-price">Giá: <f:formatNumber value="${p.price}"/> </div>
                    </div>
                </div>
            </li>
            </c:forEach>

        </ul>
    </div>
</div>
<div id="footer"></div>
</body>
</html>
