<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Boppee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>
        <%@include file="Header.jsp" %>
        <div id="banner-container">
            <div class="container banner">
                <img src="img/Big Banner.jpg" alt="" id="left-banner-img">
                <img src="img/topright-banner.png" alt="" class="right-banner-img">
                <img src="img/bottomright-banner.png" alt="" class="right-banner-img" id="bottom-right-img">
            </div>
        </div>

        <div class="container part">
            <h5>DANH MỤC</h5>
            <table>
                <tr class="list">

                    <td class="list-items">
                        <a href="<%=request.getContextPath()%>/category?category-id=1" style="text-decoration: none; color: black;">
                            <div class="category-item">
                                <img src="img/cloth.svg" alt="" class="categories-img">
                                <p>Thời trang nam</p>
                            </div>
                        </a>
                    </td>

                    <td class="list-items">
                        <a href="<%=request.getContextPath()%>/category?category-id=2" style="text-decoration: none; color: black;">
                            <div class="category-item">
                                <img src="img/phone.svg" alt="" class="categories-img">
                                <p>Điện thoại & phụ kiện</p>
                            </div>
                        </a>
                    </td>
                    <td class="list-items">
                        <a href="<%=request.getContextPath()%>/category?category-id=3" style="text-decoration: none; color: black;">
                            <div class="category-item">
                                <img src="img/phone.svg" alt="" class="categories-img">
                                <p>Thiết bị điện tử</p>
                            </div>
                        </a>
                    </td>
                    <td class="list-items">
                        <a href="<%=request.getContextPath()%>/category?category-id=4" style="text-decoration: none; color: black;">
                            <div class="category-item">
                                <img src="img/phone.svg" alt="" class="categories-img">
                                <p>Máy tính & Laptop</p>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr class="list">
                <a href="<%=request.getContextPath()%>/category?category-id=5" style="text-decoration: none; color: black;">
                    <td class="list-items">
                        <div class="category-item">
                            <img src="img/phone.svg" alt="" class="categories-img">
                            <p>Máy ảnh & máy quay phim</p>
                        </div>
                </a>
                </td>
                <td class="list-items">
                    <a href="<%=request.getContextPath()%>/category?category-id=6" style="text-decoration: none; color: black;">
                        <div class="category-item">
                            <img src="img/phone.svg" alt="" class="categories-img">
                            <p>Đồng hồ</p>
                        </div>
                    </a>
                </td>
                <td class="list-items">
                    <a href="<%=request.getContextPath()%>/category?category-id=7" style="text-decoration: none; color: black;">
                        <div class="category-item">
                            <img src="img/phone.svg" alt="" class="categories-img">
                            <p>Giày dép nam</p>
                        </div>
                    </a>
                </td>
                <td class="list-items">
                    <a href="<%=request.getContextPath()%>/category?category-id=8" style="text-decoration: none; color: black;">
                        <div class="category-item">  
                            <img src="img/phone.svg" alt="" class="categories-img">
                            <p>Thiết bị điện gia dụng</p>
                        </div>
                    </a>
                </td>
                </tr>
            </table>
        </div>

        <div class="container part">
            <h5>GỢI Ý HÔM NAY</h5>
            <c:forEach var="p" items="${requestScope.products}" begin="1" end="12">
                <a href="<%=request.getContextPath()%>/product?saveId=${p.getProductId()}">
                <div class="product">
                    <div id="img-container">
                        <img src="${p.getPhotoPath()}" alt="product">
                    </div>
                    <div class="product-name">${p.getProductName()}</div>
                    <span class="des" style="color: red;"><fmt:formatNumber value="${p.getProductPrice()}" type="currency"/></span>
                </div>
                </a>
            </c:forEach>
        </div>

        <div class="container part">
            <h5>THỜI TRANG GIÁ SỐC</h5>
            <c:forEach var="p" items="${requestScope.fashion}" begin="0" end="5">
                <a href="<%=request.getContextPath()%>/product?saveId=${p.getProductId()}">
                <div class="product">
                    <div id="img-container">
                        <img src="${p.getPhotoPath()}" alt="product">
                    </div>
                    <div class="product-name">${p.getProductName()}</div>
                    <span class="des" style="color: red;"><fmt:formatNumber value="${p.getProductPrice()}" type="currency"/></span>
                </div>
                </a>
            </c:forEach>
        </div>

        <div class="container part">
            <h5>SIÊU SALE CÔNG NGHỆ</h5>
            <c:forEach var="p" items="${requestScope.phones}" begin="0" end="5">
                <a href="<%=request.getContextPath()%>/product?saveId=${p.getProductId()}">
                    <div class="product">
                        <div id="img-container">
                            <img src="${p.getPhotoPath()}" alt="product">
                        </div>
                        <div class="product-name">${p.getProductName()}</div>
                        <div class="des" style="color: red; text-decoration: line-through #F7452F"><fmt:formatNumber value="${p.getProductPrice() +30000}" type="currency"/></div>
                        <span class="des" style="color: red;"><fmt:formatNumber value="${p.getProductPrice()}" type="currency"/></span>
                    </div>
                </a>

            </c:forEach>
        </div>


    </body>
    <style>
        body {
            margin: 0;
            box-sizing: border-box;
            background-color: #F5F5F5;
        }

        #banner-container {
            background-color: white;
            width: 100%;
            height: auto;
            padding: 2%;
        }


        .top-bar {
            background-color: #F7452F;
            height: 18vh;
        }

        .Bopppe {
            width: 25vw;
            height: auto;
        }

        #customer-name{
            text-align: center;
            margin-top: 4vh;
        }

        #avatar {
            border-radius: 50%;
            width: 2vw;
            height: auto;
        }

        #logo {
            width: 40%;
            height: auto;
            margin-left: 20%;
        }

        #search-bar{
            margin-top: 7vh;
        }

        #submit-btn{
            margin-top: 7vh;
        }

        .search-bar input{
            margin-top: 4%;
            width: 50%;
            height: 50%;
        }

        .search-bar button {
            margin-top: 4%;
            width: 75px;
            height: 10%;
            background-color: #198754;
            color: white;
        }

        #cart {
            margin-top: 5vh;
            width: 5vw;
            height: auto;
            margin-left: 20%;
        }

        .hrf {
            margin-top: 3%;
            border: white 1px solid;
            border-radius: 8px;
            width: 7vw;
            height: 10%;
            padding: 15px;
            margin-right: 20px;
        }

        .hrf a{
            color: white;
            text-decoration: none
        }
        
        .part a{
            color: black;
        }


        .banner {
            height: auto;
            width: 100%;
            margin-top: 3vh;
            background-color: white;
        }



        #left-banner-img {
            position: relative;
            height: 40vh;
            width: auto;
        }

        .right-banner-img {
            margin-left: 5px;
            position: absolute;
            height: 19.5vh;
            width: auto;
        }

        #bottom-right-img {
            margin-top: 20.5vh;
        }


        .part {
            margin-top: 5vh;
            height: auto;
            width: 100%;
            background-color: white;
            padding: 2%;

        }

        .list {
            display: flex;
        }

        .list td {
            text-align: center;
        }

        .list-items div:hover {
            color: red;
        }

        .category-item  {
            border: 1px #F4F4F4 solid;
        }


        .categories-img {
            width: 20vw;
            height: 20vh;
        }

        .product {
            margin-right: 1rem;
            margin-bottom: 1rem;
            width: 15%;
            height: 40vh;
            border: 1px solid #F5F5F5;
            text-align: center;
            display: inline-block;
            border-radius: 5px;
            background-color: white;
            padding: 1rem;

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
            margin-top: 1rem;
            width: auto;
            height: 10vh;
            white-space: nowrap; /* prevent the text from wrapping */
            overflow: hidden; /* hide any overflowing text */
            text-overflow: ellipsis;
        }

        .product:hover{
            border: 1px solid #E7B10A;
        }

        h5 {
            margin-bottom: 1rem;
            text-decoration: underline solid;

        }
        
        



    </style>
    <script>

    </script>
</html>