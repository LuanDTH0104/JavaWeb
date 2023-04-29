/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.servlet;

import fpt.dao.ProductDao;
import fpt.dao.SellerDao;
import fpt.entities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

/**
 *
 * @author NGUYEN THANH LUAN
 */
@WebServlet(name = "editProduct", urlPatterns = {"/edit"})
public class editProduct extends HttpServlet {
    private String id = null; 
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
            out.println("<title>Servlet editProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editProduct at " + request.getContextPath()+ "</h1>");
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
        ProductDao pd = new ProductDao();
        id = request.getParameter("saveId");
        Object[] o = pd.getProductByProductId(Integer.parseInt(id));
        request.setAttribute("productId", id);
        request.setAttribute("productInfor", o);
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        
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
        SellerDao sd = new SellerDao();
        //Create sesstion
        HttpSession session = request.getSession();
        // Get the file part from the request

        Part filePart = request.getPart("img-input");

        // Get the input stream from the file part
        InputStream inputStream = filePart.getInputStream();

        // Read the input stream into a byte array
        byte[] photo = IOUtils.toByteArray(inputStream);

        // Nhận dữ liệu tên từ người dùng
        String productName = request.getParameter("product-name");
//        // Nhận mức giá từ người dùng
        Long productPrice = Long.parseLong(request.getParameter("product-price"));
        // Nhận id của mặt hàng người dùng set
        Integer categories = Integer.parseInt(request.getParameter("categories-classify"));
        // Nhận miêu tả về sản phẩm của người dùng
        String productDes = request.getParameter("product-describe");
        // Nhận id của người bán từ người dùng
        Integer sellerId = sd.findIdOfSeller((Integer) session.getAttribute("sellerId"));
        
        Product p = new Product(Integer.parseInt(id) ,photo, productName, productPrice, categories, productDes, sellerId);

        ProductDao pd = new ProductDao();
        if (pd.updateProductInfor(p)) {
            pd.convertToPicture(p);
            response.sendRedirect(request.getContextPath()+"/page");
        }
        else {
            response.getWriter().println(" not Oke");
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
