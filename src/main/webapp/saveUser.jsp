<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/5/2025
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    request.setCharacterEncoding("UTF-8");
    // Lấy thông tin người dùng từ request
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String token = request.getParameter("token");

    // Kiểm tra dữ liệu đầu vào
    if (id != null && name != null && email != null) {
        // Lưu thông tin người dùng vào session
        session.setAttribute("facebook_id", id);
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("access_token", token);

        // Ghi log server (có thể bỏ)
        System.out.println("✅ Người dùng Facebook đăng nhập:");
        System.out.println("ID: " + id);
        System.out.println("Tên: " + name);
        System.out.println("Email: " + email);

        // Trả về phản hồi cho JavaScript biết là OK
        out.print("success");
    } else {
        // Nếu thiếu dữ liệu, trả về lỗi
        response.setStatus(400);
        out.print("error: thiếu thông tin người dùng");
    }
%>
