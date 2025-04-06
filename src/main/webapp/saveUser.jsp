<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/5/2025
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*" %>

    <%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String token = request.getParameter("token");

    if (id != null && name != null && email != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password");
            String query = "INSERT INTO users (id, name, email, token) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, email);
            stmt.setString(4, token);
            stmt.executeUpdate();
            out.print("Đăng nhập thành công!");
            conn.close();
        } catch (Exception e) {
            out.print("Lỗi: " + e.getMessage());
        }
    }
%>
