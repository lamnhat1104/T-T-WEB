package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import java.io.IOException;
@WebServlet("/VnPayHandler2")
public class VnPayHandler2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy giá trị từ request
        String amountStr = req.getParameter("amount");
        double amountDouble = Double.parseDouble(amountStr); // Chuyển đổi sang double
        long amount = (long) amountDouble * 100; // Nhân với 100 để chuyển sang số tiền nguyên

        String bankCode = req.getParameter("bankCode");
        String language = Optional.ofNullable(req.getParameter("language")).orElse("vn"); // Mặc định là "vn"

        // Tham số yêu cầu thanh toán
        String vnp_TxnRef = Config.getRandomNumber(8); // Tạo mã giao dịch
        String vnp_IpAddr = Config.getIpAddress(req); // Lấy địa chỉ IP người dùng
        String vnp_CreateDate = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7")).getTime()); // Thời gian tạo giao dịch

        // Thời gian hết hạn (15 phút)
        Calendar expire = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        expire.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = new SimpleDateFormat("yyyyMMddHHmmss").format(expire.getTime());

        // Tạo các tham số gửi đến VNPAY
        Map<String, String> params = new HashMap<>();
        params.put("vnp_Version", "2.1.0");
        params.put("vnp_Command", "pay");
        params.put("vnp_TmnCode", Config.vnp_TmnCode); // Mã cửa hàng
        params.put("vnp_Amount", String.valueOf(amount)); // Số tiền
        params.put("vnp_CurrCode", "VND"); // Đơn vị tiền tệ
        if (bankCode != null && !bankCode.isEmpty()) params.put("vnp_BankCode", bankCode); // Mã ngân hàng nếu có
        params.put("vnp_TxnRef", vnp_TxnRef); // Mã giao dịch
        params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef); // Thông tin đơn hàng
        params.put("vnp_OrderType", "other"); // Loại đơn hàng
        params.put("vnp_Locale", language); // Ngôn ngữ
        params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl); // URL trả về sau thanh toán
        params.put("vnp_IpAddr", vnp_IpAddr); // Địa chỉ IP người dùng
        params.put("vnp_CreateDate", vnp_CreateDate); // Thời gian tạo
        params.put("vnp_ExpireDate", vnp_ExpireDate); // Thời gian hết hạn

        // Tạo chuỗi hashData
        List<String> fieldNames = new ArrayList<>(params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        hashData.append("vnp_Version=").append(URLEncoder.encode(params.get("vnp_Version"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_Command=").append(URLEncoder.encode(params.get("vnp_Command"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_TmnCode=").append(URLEncoder.encode(params.get("vnp_TmnCode"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_Amount=").append(URLEncoder.encode(params.get("vnp_Amount"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_CurrCode=").append(URLEncoder.encode(params.get("vnp_CurrCode"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_TxnRef=").append(URLEncoder.encode(params.get("vnp_TxnRef"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_OrderInfo=").append(URLEncoder.encode(params.get("vnp_OrderInfo"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_OrderType=").append(URLEncoder.encode(params.get("vnp_OrderType"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_Locale=").append(URLEncoder.encode(params.get("vnp_Locale"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_ReturnUrl=").append(URLEncoder.encode(params.get("vnp_ReturnUrl"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_IpAddr=").append(URLEncoder.encode(params.get("vnp_IpAddr"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_CreateDate=").append(URLEncoder.encode(params.get("vnp_CreateDate"), StandardCharsets.US_ASCII));
        hashData.append("&vnp_ExpireDate=").append(URLEncoder.encode(params.get("vnp_ExpireDate"), StandardCharsets.US_ASCII));
        for (Iterator<String> it = fieldNames.iterator(); it.hasNext(); ) {
            String key = it.next();
            String value = URLEncoder.encode(params.get(key), StandardCharsets.US_ASCII);
            hashData.append(key).append("=").append(value);
            if (it.hasNext()) {
                hashData.append("&");
            }
        }

        // Tính toán chữ ký
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());

        // Thêm chữ ký vào URL
        StringBuilder query = new StringBuilder();
        query.append("vnp_SecureHash=").append(vnp_SecureHash);

        // Tạo URL thanh toán
        for (Iterator<String> it = fieldNames.iterator(); it.hasNext(); ) {
            String key = it.next();
            String value = URLEncoder.encode(params.get(key), StandardCharsets.US_ASCII);
            query.append("&").append(key).append("=").append(value);
        }

        String paymentUrl = Config.vnp_PayUrl + "?" + query.toString();

        // Lưu URL thanh toán vào session để hiển thị mã QR
        HttpSession session = req.getSession();
        session.setAttribute("paymentUrl", paymentUrl);
        session.setAttribute("totalPrice", amount / 100); // Lưu số tiền vào session

        // Chuyển hướng tới vnpay_qr.jsp để hiển thị mã QR
        resp.sendRedirect("vnpay_qr.jsp");
    }
}