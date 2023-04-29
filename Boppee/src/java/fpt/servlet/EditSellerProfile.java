/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.SellerDao;
import fpt.entities.Seller;
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
@WebServlet(name = "EditSellerProfile", urlPatterns = {"/sellerprofile"})
public class EditSellerProfile extends HttpServlet {

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
            out.println("<title>Servlet EditSellerProfile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSellerProfile at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Integer sellerAccountId = (Integer)session.getAttribute("sellerId");
        SellerDao sd = new SellerDao();
        Object[] s = sd.findSellerInfor(sellerAccountId);
        request.setAttribute("sellerInfor", s);
        request.getRequestDispatcher("EditSellerProfile.jsp").forward(request, response);
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
        Integer sellerAccountId = (Integer) session.getAttribute("sellerId");
        String name = request.getParameter("name");
        String storeName = request.getParameter("store-name");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phone-number");
        String gender = request.getParameter("gender");
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String dateString = year + "-" + month + "-" + date; // example date string
        Date sqldate = Date.valueOf(dateString);
       
        // Them nguoi dung
        SellerDao sd = new SellerDao();
        Seller s = new Seller(sellerAccountId, name, storeName, phonenumber, gender, sqldate);
        if(sd.updateSellerInfor(s)){
            //request.getRequestDispatcher("sellerPage.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath()+"/sellerprofile");
        }else{
            response.getWriter().print("Loi");
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
