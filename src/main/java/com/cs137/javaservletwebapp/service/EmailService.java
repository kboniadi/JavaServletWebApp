package com.cs137.javaservletwebapp.service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;
import java.util.Random;

public class EmailService {
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(String email, String code) {
        String fromEmail = "noreplykrd@gmail.com";
        String password = "ffwqcvqjmeuadggq";

        try {
            // your host email smtp server details
            Properties pr = new Properties();

            // gmail smtp server
            pr.put("mail.smtp.host", "smtp.gmail.com");
            pr.put("mail.smtp.port", "465");
            pr.put("mail.smtp.auth", "true");
            pr.put("mail.smtp.ssl.enable", "true");
            pr.put("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.ssl.trust", "smtp.gmail.com");

            // yahoo smtp server
//            pr.put("mail.smtp.host", "smtp.mail.yahoo.com");
//            pr.put("mail.smtp.port", "465");
//            pr.put("mail.smtp.auth", "true");
//            pr.put("mail.smtp.ssl.enable", "true");
//            pr.put("mail.smtp.starttls.enable", "true");
//            pr.put("mail.smtp.ssl.trust", "smtp.mail.yahoo.com");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
//            session.setDebug(true);
            Message mess = new MimeMessage(session);

            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            mess.setSubject("User Email Verification");
            mess.setText("Registered successfully.Please verify your account using this code: " + code);
            Transport.send(mess);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
