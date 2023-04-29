<%-- 
    Document   : editProduct
    Created on : 02-Mar-2023, 21:25:39
    Author     : NGUYEN THANH LUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boppee - Trang người bán</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="product-detail-container" class="container">
            <div><img src="${requestScope.productInfor[0].toString()}" alt="alt" id="product-img"/></div>
            <div id="product-detail">
                <div id="product-name">${requestScope.productInfor[1]}</div>
                <div id="product-price"><fmt:formatNumber  value="${requestScope.productInfor[2].toString()}" type = "currency"/></div>
            </div>
            <div id="add-to-cart">
                <input type="submit" value="Thêm vào giỏ hàng" class="btn" id="add-to-cart-btn">
                <a href="payment?action=buy-now&product-id=${requestScope.productInfor[6]}&product-quantity=1" class="btn" id="buy-btn">Mua ngay</a>
            </div>  
            <div id="product-describe">
                <h6>Mô tả sản phẩm</h6>
                <textarea name="product-describe" id="product-describe-input" cols="65" rows="10" disabled>${requestScope.productInfor[3]}</textarea>
            </div> 
        </div>
                <form action="addtocart?saveId=${requestScope.productInfor[6]}" method="POST" id="add-cart" hidden></form>
                <form action="payment?action=buy-now&product-id=${requestScope.productInfor[6]}&product-quantity=1" method="GET" id="to-payment" hidden></form>
        <div class="container part">
            <h5>BÌNH LUẬN</h5>
            <c:if test="${sessionScope.customer != null}">
                <div class="container mt-5 mb-5">
                    <div class="row height d-flex justify-content-center align-items-center">

                        <div class="col-md-12">

                            <div class="card">

                                <div class="p-3">

                                    <h6>Thêm bình luận</h6>

                                </div>

                                <form class="mt-3 d-flex flex-row align-items-center p-3 form-color" action="<%=request.getContextPath()%>/product?saveId=${requestScope.productInfor[6]}&action=post" method="POST">

                                    <img src="https://i.imgur.com/zQZSWrt.jpg" width="50" class="rounded-circle mr-2">
                                    <input type="text" class="form-control" placeholder="Nhập bình luận của bạn..." name="comment">
                                    <button type="submit" class="btn btn-primary rounded-circle">Đăng</button>
                                </form>
                                <c:forEach var="p" items="${requestScope.comments}">
                                    <c:set var = "customerId" scope = "session" value = "${sessionScope.customer.getCustomerId()}"/>
                                    <div class="mt-2">
                                        <div class="d-flex flex-row p-3">
                                            <img src="https://i.imgur.com/zQZSWrt.jpg" width="40" height="40" class="rounded-circle mr-3">
                                            <div class="w-100">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <span class="mr-2">${p[0].toString()}</span>
                                                        <small class="c-badge">Top Comment</small>
                                                    </div>
                                                    <small>12h ago</small>
                                                </div>
                                                <p class="text-justify comment-text mb-0">${p[1]}</p>
                                                <div class="d-flex flex-row user-feed">
                                                    <c:if test="${p[2] eq 5}">
                                                        <a class="wish" href="<%=request.getContextPath()%>/product?saveId=${requestScope.productInfor[6]}&action=edit">Chỉnh sửa</a>
                                                        <a class="ml-2" href="<%=request.getContextPath()%>/product?saveId=${requestScope.productInfor[6]}&action=delete">Xóa</a>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                        </div>
                    </div>

                </c:if>
            </div>




            <div class="container part">
                <h5>SẢN PHẨM TƯƠNG TỰ</h5>
                <c:forEach var="p" items="${requestScope.products}" begin="0" end="5">
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


    </body>
    <style>
        *{
            margin: 0;
            box-sizing: border-box
        }

        body {
            background-color: #F5F5F5;
        }

        .card{

            background-color: #fff;
            border: none;
        }

        .form-color{

            background-color: #fafafa;

        }

        .form-control{

            height: 48px;
            border-radius: 25px;
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #35b69f;
            outline: 0;
            box-shadow: none;
            text-indent: 10px;
        }

        .c-badge{
            background-color: #35b69f;
            color: white;
            height: 20px;
            font-size: 11px;
            width: 92px;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 2px;
        }

        .comment-text{
            font-size: 13px;
        }

        .wish{

            color:#35b69f;
        }


        .user-feed{

            font-size: 14px;
            margin-top: 12px;
        }

        #product-detail-container{
            margin-top: 1rem;
            background-color: white;
            padding: 20px;
        }
        #product-img {
            margin-left: 10rem;
            width: 25%;
            height: auto;
            position: absolute;
        }

        #product-detail {
            margin-left: 50vw;
            position: relative;
        }

        #product-name {
            font-size: 2rem;
        }

        #product-price {
            font-size: 1.5rem;
            color: #F04D2D;
        }

        #product-describe {
            margin-top: 3rem;
            margin-left: 50vw;
            position: relative;
        }

        #add-to-cart {
            margin-top: 1rem;
            margin-left: 50vw;
            position: relative;
        }

        .btn {
            padding: 5px;
            border: 1px solid #F04D2D;
            border-radius: 0px;
        }

        #add-to-cart-btn {
            background-color: #FFEEE8;
        }

        #buy-btn {
            color: white;
            background-color: #F04D2D;
        }

        textarea {
            resize: none;
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

        .part a {
            color: black;
        }
    </style>

    <script>
        $("#add-to-cart-btn").on('click', function () {
            $("#add-cart").submit();
        });
    </script>
</html>
