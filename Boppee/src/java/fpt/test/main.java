/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.test;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class main {
    public static void main(String[] args) throws MessagingException {
        String to = "luanduong14@gmail.com";
        String from = "vlvietnam14@gmail.com";
        String host = "smtp-mail.outlook.com";
        String username = "vlvietnam14@gmail.com";
        String password = "Luanhuy13";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.port", "587");

        // Get the default Session object
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        // Create a new message
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Boppee: Xác nhận đơn hàng");
        message.setText("This is a test email.");

        // Send the message
        Transport.send(message);

        System.out.println("Message sent successfully!");
    }
}


