<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/10/2025
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");

  session.setAttribute("facebookUser", name); // lưu để dùng sau nếu cần
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Trang dành cho người dùng Facebook</title>
</head>
<body>
<h1>Chào mừng, <%= name %>!</h1>
<p>Email: <%= email %></p>
<a href="index.jsp">Quay lại trang chính</a>
</body>
</html>
