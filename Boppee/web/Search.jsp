<%-- 
    Document   : Search
    Created on : 06-Mar-2023, 19:22:40
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boppee - Tìm kiếm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body >
        <%@include file="Header.jsp" %>
        <div class="container">
            <%@include file="Sidebar.jsp" %>
            <div id="product-container">
                <div>Số lượng sản phẩm tìm thấy: ${requestScope.products.size()}</div>
                <form action="search" method="GET" id="sort-form">
                    <input hidden type="text" value="${requestScope.keyword}" id="re-search-bar" name="search-bar">
                    Sắp xếp theo: <select name="sort" id="sort-by" >
                         <!--onchange="location = 'search?search-bar=${requestScope.keyword}&sort=low-to-high';-->
                        <option class="sort" value="" disabled>Sắp xếp theo</option>
                        <option class="sort" value="high-to-low">Giá từ cao xuống thấp</option>
                        <option class="sort" value="low-to-high">Giá từ thấp đến cao</option>
                        <option class="sort" value="a-z">Sắp xếp từ a - z</option>
                    </select>
                </form>
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
                    <span id="des" style="color: red;">đ<%=pd.convertMoneyFormat(p.getProductPrice())%></span>
                    <form action="<%=request.getContextPath()%>/product" method="get" id="form-<%=p.getProductId()%>">
                        <input type="text" name="saveId" value="" class="save-id" hidden>
                    </form>
                </div>

                <%
                    }
                %>
            </div>
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
            margin-left: 12vw;
            color:#F5F5F5;

        }

        .product {
            margin-right: 1px;
            width: 15%;
            height: 40vh;
            margin-bottom: 1rem;
            border: 1px solid white;
            text-align: center;
            display: inline-block;
            background-color: white;
        }

        #product-container {
            position: relative;
            margin-left: 16rem;
            margin-top: 2rem;
        }

        #img-container {
            width: 90%;
            height: 50%;
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

        a{
            text-decoration: none;
            color: white;
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

            $(document).on('change', 'select', function () {
                var keyword = $('#re-search-bar').val();
                var sort = $("select option:selected").val();
                location = 'search?search-bar=${requestScope.keyword}&sort=' + sort;
            });


            
//            $('#search-bar').text($('#search-bar').val());
//            $('#search-bar').on('change', function () {
//                
//            });


        });



    </script>
</html>
