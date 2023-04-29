/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.CustomerAccountDao;
import fpt.dao.SellerAccountDao;
import fpt.entities.CustomerAccount;
import fpt.entities.SellerAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author NGUYEN THANH LUAN
 */
@WebServlet("/register")
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        CustomerAccountDao customerDao = new CustomerAccountDao();
        SellerAccountDao sellerDao = new SellerAccountDao();
        String username = request.getParameter("user-name");
        String password = request.getParameter("password");
        String accountType = request.getParameter("account-type");

        if (customerDao.existedUsername(username)) {
            String msg = "Tài khoản đã tồn tại";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            //response.sendRedirect(request.getContextPath() + "/html/register.jsp");
        } else if (accountType.equals("user")) {
            CustomerAccount account = new CustomerAccount(username, password);
            if (customerDao.addCustomerAccount(account)) {
                response.sendRedirect(request.getContextPath() + "/login");

            }
        } else if (accountType.equals("seller")) {
            SellerAccount account = new SellerAccount(username, password);
            if (!customerDao.existedUsername(username) && !sellerDao.existedUsername(username) 
                    && sellerDao.addSellerAccount(account)) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                String msg = "Tài khoản đã tồn tại";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("register.jsp").forward(request, response);
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

}
