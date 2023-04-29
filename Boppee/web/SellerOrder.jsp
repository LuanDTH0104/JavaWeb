<%-- 
    Document   : SellerInfor
    Created on : 05-Mar-2023, 00:50:01
    Author     : NGUYEN THANH LUAN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a href="<%=request.getContextPath()%>/page" style="text-decoration: none;"><h5 id="header" >Thông tin đơn hàng</h5></a>
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
            <h4>Đơn hàng đã nhận</h4>

            <div>Thông tin đơn hàng</div>
            <hr>
            <table>
                <tr>
                    <th>Ngày đặt hàng</th>
                    <th>Người nhận</th>
                    <th>Số điện thoại</th>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Tổng thanh toán</th>
                    <th>Trạng thái đơn hàng</th>
                </tr>
                <c:forEach items="${requestScope.orders}" var="o">
                    <tr>
                        <td>${o[0]}</td>
                        <td>${o[1]}</td>
                        <td>${o[2]}</td>
                        <td>${o[3]}</td>
                        <td>${o[4]}</td>
                        <td><fmt:formatNumber value="${o[5]}" type="currency"/></td>
                        <td>Chưa hoàn thành</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
    <style>
        body{
            margin: 0;
            box-sizing: border-box;
            background-color: #F5F5F5;
        }

        table, th, td {
            border: 1px solid black;
        }
        
        th {
            text-align: center;
        }
        
        td {
            text-align: center;
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
