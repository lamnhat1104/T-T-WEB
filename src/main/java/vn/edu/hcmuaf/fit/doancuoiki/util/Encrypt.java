package vn.edu.hcmuaf.fit.doancuoiki.util;

import java.security.MessageDigest;

public class Encrypt {

    public static String encrypt(String password) {
        String salt = "PhucNguyenNhat";
        StringBuilder passwordEncrypt = new StringBuilder(); // Dùng StringBuilder để tạo chuỗi
        password = password + salt;

        try {
            // Tạo đối tượng MessageDigest với thuật toán MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Chuyển đổi mật khẩu thành mảng byte
            byte[] hashBytes = md.digest(password.getBytes("UTF-8"));

            // Chuyển mỗi byte thành định dạng hex
            for (byte b : hashBytes) {
                passwordEncrypt.append(String.format("%02x", b)); // %02x để định dạng byte thành hex
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return passwordEncrypt.toString(); // Trả về chuỗi MD5 dạng hex
    }

    public static void main(String[] args) {
        String rawPassword = "Nh123456";
        String encryptedPassword = Encrypt.encrypt(rawPassword);

        System.out.println("Mật khẩu gốc: " + rawPassword);
        System.out.println("Mật khẩu mã hóa (MD5): " + encryptedPassword);
    }

}

