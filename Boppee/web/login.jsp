<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>
        <div>
            <a href="<%=request.getContextPath()%>/home"><img src="img/Boppee.svg" alt="" id="Boppee-logo"></a>
            <span id="head-title">Đăng nhập</span>
        </div>
        <form action="<%= request.getContextPath()%>/login" method="post">
            <div class="content-container">
                <div id="left-login-logo"><img src="img/Boppee.svg" alt=""></div>
                <div class="login-content">
                    <h5>Đăng nhập</h5>
                    <div class="input-part">
                        <div>Tên đăng nhập</div>
                        <input type="text" name="username" id="">
                        <%
                            String errUser = (String)request.getAttribute("errUser");
                            if(errUser != null){
                        %>
                        <div style="color: red"><%=errUser%></div>
                        <%
                            }
                        %>
                    </div>

                    <div class="input-part">
                        <div>Mật khẩu</div>
                        <input type="password" name="password" id="">
                        <%
                            String errPass = (String)request.getAttribute("errPass");
                            if(errPass != null){
                        %>
                        <div style="color: red"><%=errPass%></div>
                        <%
                            }
                        %>
                    </div>
                    <div class="input-part">
                        <div>Loại tài khoản</div>
                        <select name="account-type" id="">
                            <option value="seller">Người bán</option>
                            <option value="user">Người mua</option>
                        </select>
                    </div>

                    <div class="input-part">
                        <input type="submit" value="Đăng nhập" id="submit-btn">
                    </div>
                    <div id="register">
                        <span>Bạn mới biết đến Boppee</span>
                        <span><a href="register.jsp" style="text-decoration: none;">Đăng kí</a></span>
                    </div>
                </div>
            </div>

        </form>
    </body>

</html>