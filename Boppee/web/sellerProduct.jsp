<%-- 
    Document   : sellerProduct
    Created on : 24-Feb-2023, 14:24:38
    Author     : NGUYEN THANH LUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import = 'java.util.List' %>
<%@page import = 'fpt.entities.Product' %>
<%@page import = 'fpt.dao.SellerDao' %>
<%@page import = 'fpt.dao.ProductDao' %>
<%@page import = 'java.io.PrintWriter' %>
<%@page import = 'jakarta.servlet.http.HttpSession' %>


<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Boppee - Trang người bán</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <a href="<%=request.getContextPath()%>/page" style="text-decoration: none;"><h5 id="header">Sản phẩm của tôi</h5></a>
        <div class="container product-content">
            <div>Số lượng sản phẩm: ${requestScope.products.size()}</div>
            <%
        ProductDao pd = new ProductDao();
        List<Product> list = (List<Product>)request.getAttribute("products");
        for(Product p: list){
        pd.convertToPicture(p);
            %>
            <div class="product" id="<%=p.getProductId()%>">
                <div id="img-container">
                    <img src=<%=pd.getProductPath(p)%> alt="product">
                </div>

                <div class="product-name"><%=p.getProductName()%></div>
                <span class="des" style="color: red;">đ<%=pd.convertMoneyFormat(p.getProductPrice())%></span>
                <form action="<%=request.getContextPath()%>/edit" method="get" id="form-<%=p.getProductId()%>">
                    <input type="text" name="saveId" value="" class="save-id" hidden>
                </form>
            </div>

            <%
                }
            %>



        </div>








    </body>
    <style>
        *{
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #F5F5F5;
        }



        #header {
            background-color: #F7452F;
            color: white;
            padding: 2%;
            margin: 0;
        }

        .product-content{
            margin-top: 2rem;
            margin-left: 12vw;
            /*            color:#F5F5F5;*/

        }

        .product {
            margin-right: 1rem;
            margin-bottom: 1rem;
            width: 15%;
            height: 40vh;
            border: 1px solid white;
            text-align: center;
            display: inline-block;
            border-radius: 5px;
            background-color: white;

        }

        #img-container {
            width: 90%;
            height: 50%;
            margin-bottom: 1rem;
        }

        #img-container img {
            width: 70%;
            height: auto;
        }

        .product-name {
            width: auto;
            height: 10vh;
            white-space: nowrap; /* prevent the text from wrapping */
            overflow: hidden; /* hide any overflowing text */
            text-overflow: ellipsis;
        }

        .product:hover{
            border: 1px solid #E7B10A;
        }





    </style>

    <script>
        $(document).ready(function () {
            $('.product').click(function () {
                var id = $(this).attr('id');
                var formId = '#form-' + id;
                $('.save-id').val(id);
                $(formId).submit();
            });
        });

    </script>
</html>
