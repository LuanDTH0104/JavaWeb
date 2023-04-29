/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.CommentDao;
import fpt.dao.CustomerDao;
import fpt.dao.ProductDao;
import fpt.entities.Customer;
import fpt.entities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NGUYEN THANH LUAN
 */
@WebServlet(name = "ProductInfor", urlPatterns = {"/product"})
public class ProductInfor extends HttpServlet {

    private Object[] o = new Object[8];
    private List<Product> products = new ArrayList<>();
    private List<Object[]> comments = new ArrayList<>();
    private ProductDao pd = new ProductDao();
    private CommentDao cd = new CommentDao();

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
            out.println("<title>Servlet ProductInfor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductInfor at " + request.getContextPath() + "</h1>");
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
        try {
            HttpSession session = request.getSession();
            String id = request.getParameter("saveId");
            String action = request.getParameter("action");
            Customer c = (Customer) session.getAttribute("customer");
            String content = request.getParameter("comment");
            CustomerDao cusDao = new CustomerDao();
            if (action == null) {
                o = pd.getProductByProductId(Integer.parseInt(id));
                products = pd.SearchProductsByCategory(Integer.parseInt(o[4].toString()));
                comments = cd.getCommentsByProductId(Integer.parseInt(id));
            } else if (action.equals("edit")) {
                cd.updateComment(Integer.parseInt(id), c.getCustomerId(), content);
                o = pd.getProductByProductId(Integer.parseInt(id));
                products = pd.SearchProductsByCategory(Integer.parseInt(o[4].toString()));
                comments = cd.getCommentsByProductId(Integer.parseInt(id));
            } else if (action.equals("delete")) {
                cd.deleteComment(Integer.parseInt(id), c.getCustomerId());
                o = pd.getProductByProductId(Integer.parseInt(id));
                products = pd.SearchProductsByCategory(Integer.parseInt(o[4].toString()));
                comments = cd.getCommentsByProductId(Integer.parseInt(id));
            }
            // Chuyen sang ten
            request.setAttribute("productId", id);
            request.setAttribute("productInfor", o);
            request.setAttribute("products", products);
            request.setAttribute("comments", comments);
            request.getRequestDispatcher("productDetail.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("404.jsp");
        }

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
        HttpSession session = request.getSession();
        Customer c = (Customer) session.getAttribute("customer");
        String content = request.getParameter("comment");
        String id = request.getParameter("saveId");
        String action = request.getParameter("action");
        if (action.equals("post")) {
            cd.insertComment(Integer.parseInt(id), c.getCustomerId(), content);
            response.sendRedirect("product?saveId="+id);
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
