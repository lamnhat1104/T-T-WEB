<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/16/2025
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.model.User"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao"%>
<%@page import="java.time.LocalDate"%>

<%
  // Nhận thông tin từ form hoặc JavaScript (Google Sign-In)
  String googleEmail = request.getParameter("email");
  String googleFullName = request.getParameter("fullName");

  if (googleEmail != null && googleFullName != null) {
    UserDao userDao = new UserDao();

    // Nếu email chưa tồn tại thì thêm mới vào DB
    if (!userDao.isEmailExists(googleEmail)) {
      userDao.addUserByGoogle(googleEmail, googleFullName);
    }

    // Lấy thông tin người dùng từ DB
    User user = userDao.getUserByEmail(googleEmail);

    // Lưu vào session
    session.setAttribute("user", user);

    // Chuyển hướng về trang chủ
    response.sendRedirect("index.jsp");
  } else {
%>
<script>
  alert("Không nhận được thông tin từ Google. Vui lòng thử lại.");
  window.location.href = "login.jsp";
</script>
<%
  }
%>
