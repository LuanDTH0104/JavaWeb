/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.CartDao;
import fpt.entities.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.time.LocalDate;
import java.util.Properties;

/**
 *
 * @author NGUYEN THANH LUAN
 */
@WebServlet(name = "Payment", urlPatterns = {"/payment-confirm"})
public class ConfirmPayment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Payment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Payment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            HttpSession session = request.getSession();
            Customer c = (Customer) session.getAttribute("customer");
            CartDao cd = new CartDao();
            if (action == null || action.equals("")) {
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().contains("cart")) {
                        String quantity = request.getParameter("product-quantity-" + cookie.getValue());
                        cd.insertCart(c.getCustomerId(), Integer.parseInt(cookie.getValue()), Integer.parseInt(quantity));
                    }
                }
                for (Cookie cookie : cookies) {
                    if (cookie.getName().contains("cart")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            } else if (action.equals("buy-now")){
                String proId = request.getParameter("product-id");
                String quan = request.getParameter("product-quantity");
                cd.insertCart(c.getCustomerId(), Integer.parseInt(proId), Integer.parseInt(quan));
            }

            // Gửi email xác nhân đơn hàng
//            sendConfirmEmail(email, address);
            // Chuyển trang xác nhận đơn hàng thành công
            request.getRequestDispatcher("Success.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void sendConfirmEmail(String email, String address) {
        String to = email;
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
        try {
            // Create a new message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Boppee: Confirm your order");
            message.setText("We has received your order at " + LocalDate.now() + " .We has send it to " + address + " the seller. Please wait 3 -4 days for shipping service.\nThank you for using Boppee. Hope you have a nice day.");
            // Send the message
            Transport.send(message);
            System.out.println("Message sent successfully!");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
