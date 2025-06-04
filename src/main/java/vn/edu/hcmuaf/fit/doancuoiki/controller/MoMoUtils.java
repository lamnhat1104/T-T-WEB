package vn.edu.hcmuaf.fit.doancuoiki.controller;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class MoMoUtils {
    public static String signHmacSHA256(String rawData, String secretKey) {
        try {
            Mac hmacSHA256 = Mac.getInstance("HmacSHA256");
            SecretKeySpec keySpec = new SecretKeySpec(secretKey.getBytes(), "HmacSHA256");
            hmacSHA256.init(keySpec);
            byte[] bytes = hmacSHA256.doFinal(rawData.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException("Unable to sign HMAC SHA256", e);
        }
    }
}

