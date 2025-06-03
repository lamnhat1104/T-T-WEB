package vn.edu.hcmuaf.fit.doancuoiki.controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@WebServlet("/MoMoHandler")
public class MoMoHandler extends HttpServlet {
    private static final String endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
    private static final String partnerCode = "MOMO";
    private static final String accessKey = "F8BBA842ECF85";
    private static final String secretKey = "K951B6PE1waDMi640xX08PD3vg6EkVLz";
    private static final String redirectUrl = "http://localhost:8080/demo/momoPayment.jsp";
    private static final String ipnUrl = "http://localhost:8080/demo/MomoNotify";  // hoặc endpoint xử lý notify trong project của bạn
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String amount = request.getParameter("amount");
        String amountStr = String.valueOf(Math.round(Double.parseDouble(amount)));

        String orderInfo = request.getParameter("orderInfo");
        System.out.println("orderInfo raw: " + orderInfo); // debug kiểm tra

        String orderId = request.getParameter("orderId");
        String requestId = UUID.randomUUID().toString();
        String extraData = "";

        // Tạo rawSignature theo docs MoMo với orderInfo chuẩn UTF-8
        String rawSignature = "accessKey=" + accessKey +
                "&amount=" + amountStr +
                "&extraData=" + extraData +
                "&ipnUrl=" + ipnUrl +
                "&orderId=" + orderId +
                "&orderInfo=" + orderInfo +
                "&partnerCode=" + partnerCode +
                "&redirectUrl=" + redirectUrl +
                "&requestId=" + requestId +
                "&requestType=captureMoMoWallet";

        String signature = hmacSHA256(rawSignature, secretKey);

        // Tạo JSON payload an toàn (dùng thư viện Gson hoặc org.json để tránh lỗi escape)
        JsonObject json = new JsonObject();
        json.addProperty("partnerCode", partnerCode);
        json.addProperty("accessKey", accessKey);
        json.addProperty("requestId", requestId);
        json.addProperty("amount", amountStr);
        json.addProperty("orderId", orderId);
        json.addProperty("orderInfo", orderInfo);
        json.addProperty("redirectUrl", redirectUrl);
        json.addProperty("ipnUrl", ipnUrl);
        json.addProperty("extraData", extraData);
        json.addProperty("requestType", "captureMoMoWallet");
        json.addProperty("signature", signature);

        String jsonPayload = json.toString();

        System.out.println("Raw Signature: " + rawSignature);
        System.out.println("Payload JSON: " + jsonPayload);

        URL url = new URL(endpoint);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");

        OutputStream os = conn.getOutputStream();
        os.write(jsonPayload.getBytes(StandardCharsets.UTF_8));
        os.flush();

        int responseCode = conn.getResponseCode();
        InputStream inputStream = (responseCode >= 400) ? conn.getErrorStream() : conn.getInputStream();

        BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
        StringBuilder output = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            output.append(line);
        }
        System.out.println("Response code: " + responseCode);
        System.out.println("Response body: " + output.toString());

        conn.disconnect();

        System.out.println("Response code: " + responseCode);
        System.out.println("Response body: " + output.toString());

        String payUrl = "";
        try {
            org.json.JSONObject jsonResponse = new org.json.JSONObject(output.toString());
            if (jsonResponse.has("payUrl")) {
                payUrl = jsonResponse.getString("payUrl");
            } else {
                System.out.println("Response JSON không có trường payUrl!");
                System.out.println(jsonResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("payUrl", payUrl);
        request.setAttribute("amount", amountStr);
        request.getRequestDispatcher("/momo-payment.jsp").forward(request, response);
    }
    // Hàm tạo chữ ký HMAC SHA256
    private String hmacSHA256(String data, String key) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            mac.init(secretKeySpec);
            byte[] hmacData = mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : hmacData) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException("Failed to calculate HMAC SHA256", e);
        }
    }

}