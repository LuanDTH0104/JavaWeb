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
        <div class="top-bar" id="header">
            <form class="d-flex search-bar " role="search" action="<%=request.getContextPath()%>/search" method="GET">
                <span class="Bopppe"><a href="<%=request.getContextPath()%>/home"><img src="img/Boppee.svg" alt="" id="logo"></a></span>
                <input class="form-control me-2" name="search-bar" type="search" placeholder="Search" aria-label="Search" >
                <button class="btn btn-outline-success" type="submit">Search</button>
                <a href="<%=request.getContextPath()%>/cart"><span><img src="img/cart.svg" alt="" id="cart"></span></a>

                <div id="login"><a href="<%=request.getContextPath()%>/login">Đăng nhập</a></div>
                <div id="register"><a href="<%=request.getContextPath()%>/register">Đăng kí</a></div>
            </form>
        </div>

        <div class="container banner">
            <img src="img/Big Banner.jpg" alt="" id="left-banner-img">
            <img src="img/topright-banner.png" alt="" class="right-banner-img">
            <img src="  img/bottomright-banner.png" alt="" class="right-banner-img" id="bottom-right-img">
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


        .top-bar {
            background-color: #F7452F;
            height: 18vh;
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


    </style>
    <script>

    </script>
</html>