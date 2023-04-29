/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.CustomerDao;
import fpt.entities.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
/**
 *
 * @author NGUYEN THANH LUAN
 */
@WebServlet(name = "AddCustomerInfor", urlPatterns = {"/customer"})
public class AddCustomerInfor extends HttpServlet {

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
            out.println("<title>Servlet AddCustomerInfor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCustomerInfor at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/user.jsp").forward(request, response);
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
            //processRequest(request, response);
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Integer customerAccountId = (Integer) session.getAttribute("customerId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phone-number");
        String gender = request.getParameter("gender");
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String dateString = year + "-" + month + "-" + date; // example date string
        Date sqldate = Date.valueOf(dateString);
       
        // Them nguoi dung
        CustomerDao cd = new CustomerDao();
        Customer c = new Customer(customerAccountId, name, email, phonenumber, gender, sqldate);
        if(cd.addCustomerInfor(c)){
            response.sendRedirect(request.getContextPath()+"/home");
        }
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

}
