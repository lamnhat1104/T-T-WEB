    package vn.edu.hcmuaf.fit.doancuoiki.controller;

    import jakarta.servlet.*;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;
    import org.json.JSONObject;

    import java.io.*;
    import java.net.HttpURLConnection;
    import java.net.URL;

    @WebServlet(name = "ShippingFeeServlet", value = "/ShippingFeeServlet")
    public class ShippingFeeServlet extends HttpServlet {

        private static final String GHN_TOKEN = "a025d1d8-2e71-11f0-afab-c2dd849a5f98\n";
        private static final int SHOP_ID = 4759998; // ví dụ: 123456
        private static final int FROM_DISTRICT_ID = 1452; // ví dụ: Thủ Đức
        private static final String FROM_WARD_CODE = "21211"; // ví dụ: Linh Trung

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String toDistrictIdStr = req.getParameter("district_id");
            String toWardCode = req.getParameter("ward_code");

            resp.setContentType("application/json;charset=UTF-8");
            PrintWriter out = resp.getWriter();

            if (toDistrictIdStr == null || toWardCode == null) {
                out.print("{\"success\":false,\"message\":\"Thiếu thông tin quận hoặc phường nhận.\"}");
                return;
            }

            int toDistrictId = Integer.parseInt(toDistrictIdStr);

            try {
                URL url = new URL("https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setRequestProperty("Token", GHN_TOKEN);
                conn.setRequestProperty("ShopId", String.valueOf(SHOP_ID));
                conn.setDoOutput(true);

                // Tạo JSON body gửi đi
                JSONObject jsonBody = new JSONObject();
                jsonBody.put("from_district_id", FROM_DISTRICT_ID);
                jsonBody.put("service_type_id", 2); // giao hàng nhanh
                jsonBody.put("to_district_id", toDistrictId);
                jsonBody.put("to_ward_code", toWardCode);
                jsonBody.put("height", 15);
                jsonBody.put("length", 15);
                jsonBody.put("weight", 1000); // 1kg
                jsonBody.put("width", 15);
                jsonBody.put("insurance_value", 500000);

                OutputStream os = conn.getOutputStream();
                os.write(jsonBody.toString().getBytes());
                os.flush();
                os.close();

                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }
                br.close();

                JSONObject responseJson = new JSONObject(sb.toString());
                JSONObject data = responseJson.getJSONObject("data");

                int fee = data.getInt("total");

                out.print("{\"success\":true,\"fee\":" + fee + "}");

            } catch (Exception e) {
                e.printStackTrace();
                out.print("{\"success\":false,\"message\":\"Lỗi khi gọi GHN API.\"}");
            }
        }
    }
