<%-- 
    Document   : Header
    Created on : 06-Mar-2023, 19:16:25
    Author     : NGUYEN THANH LUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Boppee</title>
        <link rel="stylesheet" href="css/index.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>
        <div class="top-bar">
            <form class="d-flex search-bar " role="search" action="<%=request.getContextPath()%>/search" method="GET">
                <span class="Bopppe"><a href="<%=request.getContextPath()%>/home"><img src="img/Boppee.svg" alt="" id="logo"></a></span>
                <input class="form-control me-2" name="search-bar" type="search" placeholder="Search" aria-label="Search" value="${requestScope.keyword}" >
                <button class="btn btn-outline-success" type="submit">Search</button>
                <a href="<%=request.getContextPath()%>/cart"><span><img src="img/cart.svg" alt="" id="cart"></span></a>
                        <c:if test="${sessionScope.customer eq null}">
                    <div id="login"><a href="<%=request.getContextPath()%>/login">Đăng nhập</a></div>
                    <div id="register"><a href="<%=request.getContextPath()%>/register">Đăng kí</a></div>
                </c:if>
                <c:if test="${sessionScope.customer != null}">
                    <div id="customer-name" style="color: white; padding: 15px">
                        <a href="<%=request.getContextPath()%>/customer-infor" ><img src="${sessionScope.customer.getCustomerGender() eq "male" ? "https://wcsne.org/wp-content/uploads/2017/01/Avatar-Male.png" : "https://vmh.espcdesign.com/wp-content/uploads/2015/12/Female-Avatar.jpg"}" alt="alt" id="avatar"/></a>
                        <div>${sessionScope.customer.getCustomerName()}</div>
                    </div>
                </c:if>

            </form>
        </div>

    </body>

    <style>
        body {
        margin: 0;
        box-sizing: border-box;
        }

        a {
        text-decoration: none;
        color: white;
        }

        #login {
        margin-top: 7vh;
        padding: 10px;
        color: white;
        border: 1px solid white;
        border-radius: 8px;
        height: 6vh;
        }

        #register {
        margin-top: 7vh;
        padding: 10px;
        color: white;
        border: 1px solid white;
        border-radius: 8px;
        margin-left: 10px;
        height: 6vh;
        }

        #avatar {
        border-radius: 50%;
        width: 2vw;
        height: auto;
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

        /*        #cart-container {
        height: auto;
        width: 10vw;
        }*/

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


        .banner {
        margin-top: 3vh;
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
        
        a {
            text-decoration: none;
            color: white;
        }
    </style>
</html>
