<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/12/2025
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.model.User"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao"%>

<%@page import="java.time.LocalDate"%>

<%
    // Nhận dữ liệu từ fetch POST
    String email = request.getParameter("email");
    String name = request.getParameter("name");

    if (email == null || name == null) {
        response.sendRedirect("login-error.jsp");
        return;
    }

    UserDao dao = new UserDao();
    User user;

    // Nếu email chưa có trong DB, thêm người dùng mới
    if (!dao.isEmailExists(email)) {
        // Tạo thông tin mặc định
        UserInfo userInfo = new UserInfo(name, "", "", LocalDate.now());

        // Tạo user mới với quyền khách (role = 2) và trạng thái = 1 (đang hoạt động)
        user = new User(0, email, "", userInfo, 2, 1);

        // Lưu vào CSDL
        dao.addUser(user);
    }

    // Lấy user từ DB sau khi thêm (hoặc đã có)
    user = dao.getUserByEmail(email);

    // Lưu user vào session
    session.setAttribute("user", user);

    // Chuyển hướng về trang chính hoặc dashboard
    response.sendRedirect("index.jsp");
%>