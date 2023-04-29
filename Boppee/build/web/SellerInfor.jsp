<%-- 
    Document   : SellerInfor
    Created on : 05-Mar-2023, 00:50:01
    Author     : NGUYEN THANH LUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="fpt.entities.Seller"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boppee - Kênh người bán</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body>
        <a href="<%=request.getContextPath()%>/page" style="text-decoration: none;"><h5 id="header" >Thông tin của tôi</h5></a>
        <div id="sidebar">
            <img src="${requestScope.sellerInfor[4] eq "male" ? "https://wcsne.org/wp-content/uploads/2017/01/Avatar-Male.png" : "https://vmh.espcdesign.com/wp-content/uploads/2015/12/Female-Avatar.jpg"}" alt="alt" id="avatar"/>
            <div>${requestScope.sellerInfor[1]}</div>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrXtFG6gSvN4u664rL6aCSGdKla0FzHummpjqatzo&s" alt="alt" class="logo"/>
            <div class="tag"><a href="<%=request.getContextPath()%>/infor">Hồ sơ của tôi</a></div>
            <img src="https://previews.123rf.com/images/urfandadashov/urfandadashov1808/urfandadashov180822076/108801102-edit-vector-icon-isolated-on-transparent-background-edit-logo-concept.jpg" alt="alt"class="logo"/>
            <div class="tag"><a href="<%=request.getContextPath()%>/sellerprofile">Chỉnh sửa hồ sơ</a></div>
            <img src="https://cdn-icons-png.flaticon.com/512/1250/1250678.png" alt="alt"class="logo"/>
            <div class="tag"><a href="<%=request.getContextPath()%>/login">Đăng xuất</a></div>
        </div>
        <div id="content">
            <h4>Hồ sơ của tôi</h4>
            
            <div>Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
            <hr>
            <span class="part">Tên đăng nhập</span>
            <div class="seller-infor">${requestScope.sellerInfor[6]}</div><br>
            <span class="part">Mật khẩu</span>
            <input type="password" value="${requestScope.sellerInfor[7]}" disabled class="seller-infor"><span id="change-password">Thay đổi mật khẩu</span><br><br>
            <span class="part">Họ và tên</span>
            <div class="seller-infor">${requestScope.sellerInfor[1]}</div><br>
            <span class="part">Tên cửa hàng</span>
            <div class="seller-infor">${requestScope.sellerInfor[2]}</div><br>
            <span class="part">Số điện thoại</span>
            <div class="seller-infor">${requestScope.sellerInfor[3]}</div><br>
            <span class="part">Giới tính</span>
            <div class="seller-infor">${requestScope.sellerInfor[4] eq "male" ? "Nam" : "Nữ"}</div><br>
            <span class="part">Ngày sinh</span>
            <div class="seller-infor">${requestScope.sellerInfor[5]}</div>
        </div>

            <form id="infor-form" action="<%=request.getContextPath()%>/infor" method="POST">
            <!-- The Modal -->
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <div id="close">&times;</div>
                    
                    <img src="img/Boppee.svg" alt="alt"/>
                    <div id="modal-content-div">
                        <h5>Đổi mật khẩu</h5>
                        <div>Mật khẩu của bạn</div>
                        <input type="password" name="password" class="input-form" id="password">
                        <div style="color: red;"></div>
                        <div>Nhập mật khẩu mới</div>
                        <input type="password" name="new-password" class="input-form" id="new-password">
                        <div style="color: red;"></div>
                        <div>Nhập lại mật khẩu</div>
                        <input type="password" name="repassword" class="input-form" id="repassword">
                        <div style="color: red;"></div>
                        <br>
                        <input type="submit" value="Thay đổi" class="input-form" style="background-color:  #FB5330; border: 1px solid black; color: white; padding: 5px;">
                    </div>

                </div>

            </div>

        </form>
    </body>
    <style>
        body{
            margin: 0;
            box-sizing: border-box;
            background-color: #F5F5F5;
        }

        #header {
            padding: 2%;
            background-color: #FB5330;
            color: white;
        }

        #sidebar{
            margin-top: 5%;
            margin-left: 5%;
            width: 15vw;
            position: absolute;
        }

        #sidebar div{
            width: 70%;
            height: auto;
            text-align: center;
        }
        #content{
            margin-top: 5%;
            margin-left: 30%;
            position: relative;
            background-color: white;
            width: 50%;
            height: auto;
            padding: 5%;
        }
        .part{
            font-weight: bold;
            position: absolute;
        }
        .seller-infor{
            position: relative;
            margin-left: 15vw;
        }

        #change-password{
            color: blue;
            margin-left: 1rem;
        }

        #change-password:hover{
            color: red;
        }
        #avatar{
            width: 70%;
            height: auto;
        }
        .logo{
            margin-top: 3vh;
            width: 10%;
            height: auto;
            position: absolute;
        }
        .tag{
            margin-left: 1vw;
            margin-top: 3vh;
            position: relative;
        }
        
        .tag a {
            text-decoration: none;
            color: black;
        }
        
        .tag a:hover {
            color: red;
        }
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */
        }



        .modal-content img {
            margin-top: 3%;
            width: 40%;
            height: auto;
            position: absolute;
        }

        #modal-content-div {
            width: 90%;
            position: relative;
            margin-left: 25vw;

        }

        /* The Close Button */
        #close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .input-form {
            width: 50%;
            height: auto;
        }
    </style>
    <script>

        $(document).ready(function () {
            $("#infor-form").submit(function (event) {
                console.log($('#password').val());
                if ($('#password').val() == '' && $('#new-password').val() == '' && $('#repassword').val() == '') {
                    $('#password').next().html("Vui lòng nhập mật khẩu");
                    $('#repassword').next().html("Vui lòng nhập mật khẩu");
                    $('#new-password').next().html("Vui lòng nhập mật khẩu");
                    event.preventDefault();
                } else if ($('#password').val() != ${requestScope.sellerInfor[7]}) {
                    $('#password').next().html("Sai mật khẩu!");
                    event.preventDefault();
                } else if ($('#new-password').val() != $('#repassword').val()) {
                    $('#repassword').next().html("Mật khẩu không trùng khớp!");
                    event.preventDefault();
                } else if ($('#new-password').val() == '' || $('#repassword').val() == '') {
                    $('#repassword').next().html("Vui lòng nhập mật khẩu");
                    $('#new-password').next().html("Vui lòng nhập mật khẩu");
                    event.preventDefault();
                } else {
                    event.submit();
                }
            });
            $('#change-password').on('click', function () {
                $('#myModal').css('display', 'block');
            });
            $('#close').on('click', function () {
                $('#myModal').css('display', 'none');
            });
        });




    </script>
</html>
