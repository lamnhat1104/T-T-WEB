<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.Product" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/base.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.6.0/css/all.css">
</head>

<body>
<body>
<div class="app">
  <header id="header"></header>

  <div class="container">
    <div class="container__header">
      <img src="assets/img/home_img/xe/login_background.jpg" height="565" width="1366"/>
    </div>

    <div class="container__content">
      <h2 class="container__title">CÁC DÒNG XE MÁY</h2>


      <div class="container__content-list">
        <%
          List<Product> top8 = (List<Product>) request.getAttribute("top8Products");
          if (top8 != null) {
            for (Product p : top8) {
        %>
        <a href="product?pid=<%= p.getId() %>" class="container__content-list-link">
          <img class="container__content-list-img" src="<%= p.getImg() %>" alt="<%= p.getName() %>">
          <span class="container__content-list-span"><%= p.getName() %></span>
          <p class="price">Giá chỉ từ: <%= String.format("%,.0f", p.getPrice()) %>đ</p>
        </a>
        <%
            }
          }
        %>

        <!-- Add more items as needed -->
      </div>


    </div>
  </div>
</div>
<footer id="footer"></footer>
 <script>
        // Chèn header
        fetch('header.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('header').innerHTML = data);

        // Chèn footer
        fetch('footer.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('footer').innerHTML = data);

        // Get the button
        let mybutton = document.getElementById("myBtn");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function() {scrollFunction()};

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
</body>
</html>
