/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.CustomerAccountDao;
import fpt.dao.CustomerDao;
import fpt.dao.SellerAccountDao;
import fpt.dao.SellerDao;
import fpt.entities.Customer;
import fpt.entities.CustomerAccount;
import fpt.entities.SellerAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author NGUYEN THANH LUAN
 */
@WebServlet("/login")
public class Login extends HttpServlet {

    
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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        session.removeAttribute("sellerId");
        session.removeAttribute("customerId");
        session.removeAttribute("customer");
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
//        PrintWriter out = response.getWriter();
        CustomerDao cd = new CustomerDao();
        SellerDao sd = new SellerDao();
        CustomerAccountDao caDao = new CustomerAccountDao();
        SellerAccountDao seDao = new SellerAccountDao();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("account-type");
        if (type.equals("user")) {
            CustomerAccount account = new CustomerAccount(username, password);
            // Đăng nhập tài khoản cho Customer
            if (caDao.unmatchedPassword(account)) {
                changeDirectandNotify("login.jsp", "Sai mật khẩu!", "errPass", request, response);
            } else if (!caDao.existedUsername(username)) {
                changeDirectandNotify("login.jsp", "Sai tài khoản!", "errUser", request, response);
            } else {
                // Nếu đúng tài khoản và mật khẩu thì cho đăng nhập vào
                Integer customerId;
                customerId = caDao.findIdOfCustomer(username);
                // Truyền vào sesstion giá trị của customerId
                session.setAttribute("customerId", customerId);
                // Truyền vào Session giá trị customer
                Customer c = cd.findCustomerInfor(customerId);
                session.setAttribute("customer", c);
                // Nếu trong database đã tồn tại giá trị của customerId chuyển sang trang chính
                if (cd.isExisted(customerId)) {
                    response.sendRedirect(request.getContextPath()+"/home");
                } else {
                    response.sendRedirect(request.getContextPath()+"/customer");
                }
            }
        } else if (type.equals("seller")) {
            SellerAccount sellerAccount = new SellerAccount(username, password);
            // Đăng nhập tài khoản cho Seller
            if (seDao.unmatchedPassword(sellerAccount)) {
                changeDirectandNotify("login.jsp", "Sai mật khẩu!", "errPass", request, response);
            } else if (!seDao.existedUsername(sellerAccount.getSellerUsername())) {
                changeDirectandNotify("login.jsp", "Sai tài khoản!", "errUser", request, response);
            } else {
                
                // Nếu đúng tài khoản và mật khẩu thì cho đăng nhập vào
                Integer sellerId = seDao.findIdOfSeller(username);
                // Truyền vào sesstion giá trị của sellerId
                session.setAttribute("sellerId", sellerId);
                // Nếu trong database đã tồn tại giá trị của sellerId chuyển sang trang chính
                if (sd.isExisted(sellerId)) {
                    //request.setAttribute("sellerName", cd.findCustomerName(sellerId));
                    //request.getRequestDispatcher("sellerPage.jsp").forward(request, response);
                    response.sendRedirect(request.getContextPath() + "/page");
                } else {
                    response.sendRedirect(request.getContextPath()+"/seller");
                }
            }
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

    public void changeDirectandNotify(String url, String msg, String setAttribute,
            HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(setAttribute, msg);
        request.getRequestDispatcher(url).forward(request, response);
    }
}
