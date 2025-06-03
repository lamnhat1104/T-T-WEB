package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name = "VnPayHandler", value = "/VnPayHandler")
public class VnPayHandler extends HttpServlet {
    private static final String vnp_TmnCode = "AFYGUICN"; // Mã đối tác
    private static final String vnp_HashSecret = "PAD3HH8JAX1A2PMJ8EEVSWW8099N6MAF"; // Chuỗi bí mật
    private static final String vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static final String vnp_Returnurl = "http://localhost:8080/demo/vnpay_return.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            // 1. Lấy và chuẩn hóa amount
            String amountStrRaw = request.getParameter("amount");
            if (amountStrRaw == null || amountStrRaw.trim().isEmpty()) {
                throw new IllegalArgumentException("Amount is missing");
            }
            // Loại bỏ ký tự không phải số
            String amountStr = amountStrRaw.replaceAll("[^0-9]", "");
            long amount = Long.parseLong(amountStr) * 100; // VNPAY tính theo đơn vị 100 đồng

            // 2. Lấy orderInfo và orderId
            String orderInfo = request.getParameter("orderInfo");
            String orderId = request.getParameter("orderId");
            if (orderId == null || orderId.trim().isEmpty()) {
                throw new IllegalArgumentException("OrderId is missing");
            }

            // 3. Lấy IP khách hàng
            String ipAddress = request.getHeader("X-FORWARDED-FOR");
            if (ipAddress == null || ipAddress.isEmpty()) {
                ipAddress = request.getRemoteAddr();
            }

            // 4. Tạo tham số gửi lên VNPAY
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", "2.1.0");
            vnp_Params.put("vnp_Command", "pay");
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");
            vnp_Params.put("vnp_TxnRef", orderId);
            vnp_Params.put("vnp_OrderInfo", orderInfo != null ? orderInfo : "Thanh toán đơn hàng");
            vnp_Params.put("vnp_Locale", "vn");
            vnp_Params.put("vnp_ReturnUrl", vnp_Returnurl);
            vnp_Params.put("vnp_IpAddr", ipAddress);

            // 5. Tạo vnp_CreateDate bằng Java Time API, múi giờ Asia/Ho_Chi_Minh
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss").withZone(ZoneId.of("Asia/Ho_Chi_Minh"));
            String vnp_CreateDate = dtf.format(Instant.now());
            System.out.println("DEBUG vnp_CreateDate = " + vnp_CreateDate);
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            // 6. Sắp xếp tham số theo tên trường (alphabet) và tạo chuỗi hash + query
            List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();

            for (String fieldName : fieldNames) {
                String value = vnp_Params.get(fieldName);
                if (value != null && value.length() > 0) {
                    if (hashData.length() > 0) {
                        hashData.append('&');
                        query.append('&');
                    }
                    hashData.append(fieldName).append('=').append(value);
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8.toString()))
                            .append('=')
                            .append(URLEncoder.encode(value, StandardCharsets.UTF_8.toString()));
                }
            }

            // 7. Tạo chữ ký bảo mật (HMAC SHA512)
            String vnp_SecureHash = hmacSHA512(vnp_HashSecret, hashData.toString());
            query.append("&vnp_SecureHash=").append(vnp_SecureHash);

            // 8. Tạo URL thanh toán
            String paymentUrl = vnp_Url + "?" + query.toString();

            // 9. Log debug
            System.out.println("VNPAY payment URL: " + paymentUrl);
            System.out.println("JVM Timezone: " + TimeZone.getDefault().getID());

            // 10. Truyền URL sang JSP hiển thị QR code
            request.setAttribute("paymentUrl", paymentUrl);
            request.setAttribute("amount", amount / 100);
            request.getRequestDispatcher("/vnpay-payment.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Lỗi khi xử lý thanh toán VNPAY: " + e.getMessage());
        }
    }

    private String hmacSHA512(String key, String data) {
        try {
            Mac hmac512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(secretKey);
            byte[] bytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder hash = new StringBuilder();
            for (byte b : bytes) {
                hash.append(String.format("%02x", b));
            }
            return hash.toString();
        } catch (Exception e) {
            throw new RuntimeException("Failed to generate HMAC SHA512", e);
        }
    }
}
