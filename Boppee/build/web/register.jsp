<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="fpt.dao.CustomerAccountDao"%>
<%@page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="css/register.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="Java Script/register.js"></script>
    </head>

    <body>
        <div>
            <img src="img/Boppee.svg" alt="" id="Boppee-logo">
            <span id="head-title">Đăng kí</span>
        </div>
        <form action="<%= request.getContextPath() %>/register" method="post">
            <div class="content-container">
                <div id="left-login-logo"><img src="img/Boppee.svg" alt=""></div>
                <div class="login-content">
                    <h5>Đăng kí</h5>
                    <div class="input-part">
                        <div>Tên đăng nhập</div>
                        <input type="text" name="user-name" id="username">
                        <%
                        String msg = (String)request.getAttribute("msg");
                        if(msg != null){
                        %>
                            <div style="color: red"><%=msg%></div>
                        <%
                            }
                        %>
                    </div>
                    <div class="input-part">
                        <div>Mật khẩu</div>
                        <input type="password" name="password" id="password">
                    </div>
                    <div class="input-part">
                        <div>Nhập lại mật khẩu</div>
                        <input type="password" name="repassword" id="rePassword">
                        <div style="color: red;"></div>
                    </div>
                    <div class="input-part">
                        <div>Loại tài khoản</div>
                        <select name="account-type" id="">
                            <option value="seller">Người bán</option>
                            <option value="user">Người mua</option>
                        </select>
                    </div>
                    <div class="input-part">
                        <input type="submit" value="Đăng kí" id="submit-btn">
                    </div>
                    <div id="login">
                        <span>Bạn đã có tài khoản Boppee</span>
                        <span><a href="login.jsp" style="text-decoration: none;">Đăng nhập</a></span>
                    </div>
                </div>
            </div>

        </form>
    </body>

</html>