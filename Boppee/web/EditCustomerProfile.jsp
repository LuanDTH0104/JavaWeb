<%-- 
    Document   : EditSellerProfile
    Created on : 05-Mar-2023, 18:38:22
    Author     : NGUYEN THANH LUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boppee - Chỉnh sửa thông tin người dùng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="sidebar">
            <img src="${requestScope.customerInfor[3] eq "male" ? "https://wcsne.org/wp-content/uploads/2017/01/Avatar-Male.png" : "https://vmh.espcdesign.com/wp-content/uploads/2015/12/Female-Avatar.jpg"}" alt="alt" id="avatar-img"/>
            <div>${requestScope.sellerInfor[1]}</div>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrXtFG6gSvN4u664rL6aCSGdKla0FzHummpjqatzo&s" alt="alt" class="logo"/>
            <div class="tag"><a href="<%=request.getContextPath()%>/customer-infor">Hồ sơ của tôi</a></div>
            <img src="https://previews.123rf.com/images/urfandadashov/urfandadashov1808/urfandadashov180822076/108801102-edit-vector-icon-isolated-on-transparent-background-edit-logo-concept.jpg" alt="alt"class="logo"/>
            <div class="tag"><a href="<%=request.getContextPath()%>/sellerprofile">Chỉnh sửa hồ sơ</a></div>
            <img src="https://cdn-icons-png.flaticon.com/512/1250/1250678.png" alt="alt"class="logo"/>
            <div class="tag"><a href="<%=request.getContextPath()%>/login">Đăng xuất</a></div>
        </div>
        <form action="<%=request.getContextPath()%>/customer-profile" method="post">
            <div class="content-container">
                <div class="login-content">
                    <h5>Hồ sơ của tôi</h5>
                    <div style="color: red;" id="inform"></div>
                    <div class="input-part">
                        <div>Tên</div>
                        <input type="text" name="name" id="" value="${requestScope.customerInfor[1]}">
                    </div>
                    <div class="input-part">
                        <div>Số điện thoại</div>
                        <input type="tel" name="phone-number" id="" value="${requestScope.customerInfor[2]}">
                    </div>
                    <div class="input-part">
                        <div>Giới tính</div>
                        <select name="gender" id="gender-select">
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                        </select>
                    </div>
                    <div class="input-part">
                        <div>Ngày sinh</div>
                        <select name="date" class="dob">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                        </select>
                        <select name="month" class="dob">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select name="year" class="dob">
                            <option value="1960">1960</option>
                            <option value="1961">1961</option>
                            <option value="1962">1962</option>
                            <option value="1963">1963</option>
                            <option value="1964">1964</option>
                            <option value="1965">1965</option>
                            <option value="1966">1966</option>
                            <option value="1967">1967</option>
                            <option value="1968">1968</option>
                            <option value="1969">1969</option>
                            <option value="1970">1970</option>
                            <option value="1971">1971</option>
                            <option value="1972">1972</option>
                            <option value="1973">1973</option>
                            <option value="1974">1974</option>
                            <option value="1975">1975</option>
                            <option value="1976">1976</option>
                            <option value="1977">1977</option>
                            <option value="1978">1978</option>
                            <option value="1979">1979</option>
                            <option value="1980">1980</option>
                            <option value="1981">1981</option>
                            <option value="1982">1982</option>
                            <option value="1983">1983</option>
                            <option value="1984">1984</option>
                            <option value="1985">1985</option>
                            <option value="1986">1986</option>
                            <option value="1987">1987</option>
                            <option value="1988">1988</option>
                            <option value="1989">1989</option>
                            <option value="1990">1990</option>
                            <option value="1991">1991</option>
                            <option value="1992">1992</option>
                            <option value="1993">1993</option>
                            <option value="1994">1994</option>
                            <option value="1995">1995</option>
                            <option value="1996">1996</option>
                            <option value="1997">1997</option>
                            <option value="1998">1998</option>
                            <option value="1999">1999</option>
                            <option value="2000">2000</option>
                            <option value="2001">2001</option>
                            <option value="2002">2002</option>
                            <option value="2003">2003</option>
                            <option value="2004">2004</option>
                            <option value="2005">2005</option>
                            <option value="2006">2006</option>
                            <option value="2007">2007</option>
                            <option value="2008">2008</option>
                            <option value="2009">2009</option>
                            <option value="2010">2010</option>
                            <option value="2011">2011</option>
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                        </select>
                    </div>
                    <div class="input-part">
                        <input type="submit" value="Lưu thông tin" id="submit-btn">
                    </div>
                </div>
            </div>

        </form>


    </body>

    <style>
        body {
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
            height: auto;
            position: absolute;
        }

        #sidebar div{
            width: 70%;
            height: auto;
            text-align: center;
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

        #avatar-img{
            width: 70%;
            height: auto;
        }

        #Boppee-logo {
            width: 120px;
            height: auto;
        }

        #head-title {
            font-size: 30px;
        }

        .content-container {
            width: 100vw;
            height: auto;
            /*background-color: #EE4D2D;*/
            position: relative;
        }

        #left-login-logo {
            position: absolute;
        }

        .login-content {
            position: absolute;
            width: 35vw;
            height: auto;
            border: 1px solid #FFFFFF;
            border-radius: 8px;
            padding: 50px;
            background-color: #FFFFFF;
            margin-top: 10vh;
            margin-left: 40vw;
        }

        input {
            height: auto;
            width: 100%;
        }

        #submit-btn {
            padding: 6px;
            border: 1px solid #EE4D2D;
            border-radius: 5px;
            color: #FFFFFF;
            background-color: #EE4D2D;
        }

        .input-part {
            margin-bottom: 10px;
        }

        #login {
            margin-top: 10px;
            text-align: center;
        }

        #gender-select {
            height: auto;
            width: 100%;
            padding: 2px;
            text-align: center;
            border-radius: 5px;
        }

        .dob {
            margin-right: 2%;
            height: auto;
            width: 30%;
            padding: 2px;
            text-align: left;
            border-radius: 5px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("form").on('submit', function () {
                    $("#inform").html("*Cập nhật thông tin thành công");
        });
    </script>
</html>
