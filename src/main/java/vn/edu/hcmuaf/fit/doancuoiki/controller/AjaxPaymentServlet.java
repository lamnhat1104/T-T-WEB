package vn.edu.hcmuaf.fit.doancuoiki.controller;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/AjaxPaymentServlet")
public class AjaxPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = Integer.parseInt(req.getParameter("amount")) * 100; // chuyển sang đơn vị đồng
        String orderInfo = req.getParameter("orderInfo");
        String orderId = req.getParameter("orderId");

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_TmnCode = Config.vnp_TmnCode;

        // Tạo các tham số gửi đến VNPAY
        String vnp_Params = "vnp_Version=" + vnp_Version
                + "&vnp_Command=" + vnp_Command
                + "&vnp_TmnCode=" + vnp_TmnCode
                + "&vnp_Amount=" + amount
                + "&vnp_CurrCode=VND"
                + "&vnp_TxnRef=" + vnp_TxnRef
                + "&vnp_OrderInfo=" + orderInfo
                + "&vnp_OrderType=" + orderType
                + "&vnp_ReturnUrl=" + Config.vnp_ReturnUrl
                + "&vnp_IpAddr=" + vnp_IpAddr;

        // Tạo ngày tạo và ngày hết hạn
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params += "&vnp_CreateDate=" + vnp_CreateDate;

        cld.add(Calendar.MINUTE, 15);  // Hạn thanh toán trong vòng 15 phút
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params += "&vnp_ExpireDate=" + vnp_ExpireDate;

        // Tính toán mã bảo mật
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, vnp_Params);
        vnp_Params += "&vnp_SecureHash=" + vnp_SecureHash;

        // Gửi yêu cầu thanh toán đến VNPAY
        URL url = new URL(Config.vnp_PayUrl + "?" + vnp_Params);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        int responseCode = con.getResponseCode();

        // Xử lý phản hồi từ VNPAY
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String output;
        StringBuffer response = new StringBuffer();
        while ((output = in.readLine()) != null) {
            response.append(output);
        }
        in.close();

        // Trả về kết quả thanh toán
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("responseCode", responseCode);
        jsonResponse.addProperty("paymentUrl", Config.vnp_PayUrl + "?" + vnp_Params);

        // Gửi kết quả JSON trả về cho client
        resp.setContentType("application/json");
        resp.getWriter().write(jsonResponse.toString());
    }

}
