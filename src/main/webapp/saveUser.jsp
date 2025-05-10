<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/5/2025
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.model.User"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo"%>
<%@page import="vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao"%>
<%@page import="java.time.LocalDate"%>

<%
    String email = request.getParameter("email");
    String name = request.getParameter("name");

    UserDao dao = new UserDao();
    User user;

    if (!dao.isEmailExists(email)) {
        UserInfo userInfo = new UserInfo(name, "", "", LocalDate.now());
        user = new User(0, email, "", userInfo, 2, 1); // roleId 2 = user
        dao.addUser(user);
    }

    user = dao.getUserByEmail(email);

    session.setAttribute("user", user);
    response.sendRedirect("index.jsp");
%>
