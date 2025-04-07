<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/7/2025
  Time: 10:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    // Lấy thông tin từ form đăng ký lái thử
    String fullName = request.getParameter("fullName");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String bike = request.getParameter("bike");
    String testDriveDate = request.getParameter("testDriveDate");

    // Kiểm tra nếu dữ liệu hợp lệ
    if (fullName != null && !fullName.isEmpty() &&
            phone != null && !phone.isEmpty() &&
            email != null && !email.isEmpty() &&
            bike != null && !bike.isEmpty() &&
            testDriveDate != null && !testDriveDate.isEmpty()) {

        // Lưu thông tin vào cơ sở dữ liệu hoặc gửi email xác nhận
        // Ở đây, ví dụ là in ra thông tin
        out.println("<h2>Đăng ký lái thử thành công</h2>");
        out.println("<p>Chúng tôi đã nhận được yêu cầu của bạn.</p>");
        out.println("<p><strong>Họ và Tên:</strong> " + fullName + "</p>");
        out.println("<p><strong>Số điện thoại:</strong> " + phone + "</p>");
        out.println("<p><strong>Email:</strong> " + email + "</p>");
        out.println("<p><strong>Xe muốn lái thử:</strong> " + bike + "</p>");
        out.println("<p><strong>Ngày lái thử:</strong> " + testDriveDate + "</p>");

        // Có thể gửi email xác nhận cho khách hàng tại đây
        // Chức năng gửi email sẽ yêu cầu cấu hình máy chủ SMTP
    } else {
        out.println("<h2>Đăng ký lái thử thất bại!</h2>");
        out.println("<p>Vui lòng điền đầy đủ thông tin và thử lại.</p>");
    }
%>

