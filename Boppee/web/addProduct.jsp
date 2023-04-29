<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boppee - Trang người bán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<style>
    * {
        margin: 0;
        box-sizing: border-box;
    }

    .heading {
        background-color: #EE4D2D;
        color: white;
        height: 10vh;
    }

    .left-content {
        padding: 2vw;
        height: 100vh;
        width: auto;
        background-color: #f6f6f6;
    }

    .right-content {
        margin-top: 5vh;
        padding-left: 2vw;
    }

    #product-img-label {
        position: relative;
    }

    #product-img-input {
        position: absolute;
        margin-top: 1vh;
        margin-left: 3vw;
        height: 40px;
        width: 70px;
        border: 1px dotted black;
        border-radius: 8px;
        font-size: 12px;
        text-align: center;
    }

    .img-class {
        display: inline-block;
    }

    .parts {
        margin-top: 5vh;
    }

    #product-name-input {
        width: 50vw;
        margin-left: 11vh;
        border: solid #E5E5E5 1px;
        border-radius: 5px;
    }


    #categories-name-input {
        width: 50vw;
        margin-left: 12vh;
        border: solid #E5E5E5 1px;
        border-radius: 5px;
    }

    #img-describe-label {
        position: relative;
    }

    #product-describe-input {
        position: absolute;
        margin-left: 4vw;
        width: 50vw;
        border: 1px solid #E5E5E5;
        border-radius: 5px;

    }

    #last-parts {
        height: 40vh;
        width: auto;
    }

    #submit-btn {
        margin-left: 54vw;
        border: 1px solid #EE4D2D;
        background-color: #EE4D2D;
        color: white;
        height: 2.5vw;
        border-radius: 5px;
    }


    #product-photo {
        margin-left: 3vw;
        border: 1px solid white;
        height: auto;
        width: 15%;
    }
</style>

<body>
    <div class="container-fluid heading">
        <img src="" alt="">
        <a href="<%=request.getContextPath()%>/page"style="text-decoration: none; color: white;"><h5>Thêm sản phẩm mới</h5></a>
    </div>
    <div class="container-fluid content">
        <div class="row">
            <div class="col-2 left-content">Thông tin sản phẩm</div>
            <div class="col-8 right-content">
                <form action="<%=request.getContextPath()%>/addproduct" method="post" 
                      enctype="multipart/form-data">
                    <h5>Thông tin cơ bản</h5>
                    <div class="parts">
                        <div id="product-img-label" class="img-class">Hình ảnh sản phẩm</div>
                        <img id="product-photo">
                        <div id="product-img-input" class="img-class">Thêm hình ảnh</div>
                        <input type="file" name="img-input" id="fileinput" accept="image/*" hidden onchange="previewFile()">
                    </div>
                    <div class="parts">
                        <div class="img-class">Tên sản phẩm</div>
                        <div class="img-class"><input type="text" name="product-name" id="product-name-input"></div>
                    </div>
                    <div class="parts">
                        <div class="img-class">Giá sản phẩm</div>
                        <div class="img-class"><input type="number" name="product-price" id="product-name-input"></div>
                    </div>
                    <div class="parts">
                        <div class="img-class">Ngành hàng</div>
                        <div class="img-class">
                            <select name="categories-classify" id="categories-name-input">
                                <option value="" disabled selected hidden>Chọn ngành hàng</option>
                                <option value="1">Thời trang nam</option>
                                <option value="2">Điện thoại & phụ kiện</option>
                                <option value="3">Thiết bị điện tử</option>
                                <option value="4">Máy tính & Laptop</option>
                                <option value="5">Máy ảnh & máy quay phim</option>
                                <option value="6">Đồng hồ</option>
                                <option value="7">Giày dép nam</option>
                                <option value="8">Thiết bị điện gia dụng</option>
                            </select>
                        </div>
                    </div>
                    <div class="parts" id="last-parts">
                        <div class="img-class" id="img-describe-label">Mô tả sản phẩm</div>
                        <div class="img-class"><textarea name="product-describe" id="product-describe-input" cols="30"
                                rows="10"></textarea></div>
                    </div>
                    <input type="submit" value="Lưu & Hiển thị" id="submit-btn">
                </form>
            </div>
        </div>

    </div>
</body>
<script>
    $("#product-img-input").on('click', function () {
        $("#fileinput").click();
    })

    $("#fileinput").on('click', function(){
        $("#product-img-input").css("display","none");
    })

    function previewFile() {
        var fileInput = document.getElementById('fileinput');
        var preview = document.getElementById('product-photo');

        var file = fileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }


</script>

</html>