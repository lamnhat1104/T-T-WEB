<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/8/2025
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Date" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.dao.OrderDao" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  // Lấy user từ session
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  // Lấy dữ liệu từ form
  String location = request.getParameter("location");
  String rentalDateStr = request.getParameter("rentalStartDate");
  String returnDateStr = request.getParameter("expectedReturnDate");
  int vehicleTypeId = Integer.parseInt(request.getParameter("vehicleTypeId"));
  double dailyPrice = Double.parseDouble(request.getParameter("dailyPrice"));
  int promotionId = request.getParameter("promotionId") != null && !request.getParameter("promotionId").isEmpty()
          ? Integer.parseInt(request.getParameter("promotionId")) : -1;

  // Chuyển đổi sang java.sql.Date
  Date rentalDate = Date.valueOf(rentalDateStr);
  Date returnDate = Date.valueOf(returnDateStr);

  // Tính số ngày thuê
  long millis = returnDate.getTime() - rentalDate.getTime();
  int rentalDays = (int) (millis / (1000 * 60 * 60 * 24));
  if (rentalDays == 0) rentalDays = 1;

  // Tính tổng giá thuê và phí giao hàng
  double basePrice = rentalDays * dailyPrice;
  double shippingFee = 50000;  // phí giao hàng cố định
  double total = basePrice + shippingFee;

  // Tìm xe có sẵn theo loại
  OrderDao orderDao = new OrderDao();
  String licensePlate = orderDao.getLicensePlate(vehicleTypeId, rentalDate, returnDate);

  if (!licensePlate.equals("")) {
    boolean created = orderDao.createOrder(
            user.getId(),
            location,
            rentalDate,
            returnDate,
            licensePlate,
            total,
            promotionId
    );

    if (created) {
      // Redirect tới trang thành công
      response.sendRedirect("datxe-thanhcong.jsp?userId=" + user.getId());
    } else {
%>
<h3>Đặt xe thất bại. Vui lòng thử lại sau.</h3>
<%
  }
} else {
%>
<h3>Hiện không còn xe khả dụng cho loại bạn chọn trong thời gian này.</h3>
<%
  }
%>
