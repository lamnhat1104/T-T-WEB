package vn.edu.hcmuaf.fit.doancuoiki.util;


import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Email {
    final static String email = "pn4503628@gmail.com";
    final static String password = "kqrapxydkuszumcf";

    public static void send(String to, String subject, String body) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            // nguoi gui
            msg.setFrom(email);
            //nguoi nhan
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            // tieu de email
            msg.setSubject(subject);
            // Quy dinh ngay gui
            msg.setSentDate(new Date());
            //Noi dung
            msg.setText(body, "UTF-8");

            // gui emai
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

