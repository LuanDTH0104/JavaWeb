<%-- 
    Document   : Sidebar
    Created on : 07-Mar-2023, 10:39:07
    Author     : NGUYEN THANH LUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sidebar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body>
        <div id="container">
            <h5>Bộ lọc tìm kiếm</h5>
            <div id="part">
                <div class="head">Theo danh mục</div>
                <input type="checkbox" class="box" name="check-box">Thời trang<br>
                <input type="checkbox" class="box" name="check-box">Điện thoại & phụ kiện<br>
                <input type="checkbox" class="box" name="check-box">Thiết bị điện tử<br>
                <input type="checkbox" class="box" name="check-box">Máy tính & Laptop<br>
                <input type="checkbox" class="box" name="check-box">Máy ảnh & Máy quay phim<br>
                <input type="checkbox" class="box" name="check-box">Đồng hồ<br>
                <input type="checkbox" class="box" name="check-box">Giày dép nam<br>
                <input type="checkbox" class="box" name="check-box">Thiết bị điện gia dụng<br>
                <hr>
                <form action="price" method="GET" id="price-sort-form">
                    <div class="head">Theo giá tiền</div>
                    <input type="number" class="price-box" name="from-price" id="min" placeholder="TỪ" value="0"> -
                    <input type="number" class="price-box" name="to-price" id="max" placeholder="ĐẾN" value="0"><br><br>
                    <div></div>
                    <input type="submit" id="btn" value="ÁP DỤNG">
                </form>
            </div>
        </div>

    </body>

    <style>
        #container{
            width: 20vw;
            height: auto;
            position: absolute;
        }

        .price-box {
            width: 6vw;
            height: auto;
        }

        #btn{
            color: white;
            background-color: #F7452F;
            padding: 3px;
            border: 1px solid white;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#btn").on('click', function () {
                $('#price-sort-form').submit();
            });
            
            checkMax();
        });
        
        function checkMax(e){
            if($('#min').val() > $('#max').val()){
                e.preventDefault();
                $('#max').next().html('Lỗi tìm kiếm');
            }
        }
    </script>
</html>
