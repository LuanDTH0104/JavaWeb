<%-- 
    Document   : Cart
    Created on : 07-Mar-2023, 21:21:44
    Author     : NGUYEN THANH LUAN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form class="container" id="cart-form" action="<%=request.getContextPath()%>/payment-confirm" method="POST">


            <div class="container">
                
                <div id="delivery-infor">Đặt hàng thành công</div>
                <div class="thank-msg">Đơn hàng sẽ được vận chuyển tới bạn trong 3 - 4 ngày tới</div>
                <div class="thank-msg">Cảm ơn vì đã tin tưởng sử dụng Boppee</div>

            </div>



        </form>     

    </body>
    <style>
        body{
            background-color: #EEEEEE;
        }

        table {
            width: 100%;
            height: auto;
        }

        tr {
            background-color: white;
        }

        .product-name {
            font-size: 18px;
        }

        .product-quantity {
            text-align: right;
        }

        #cart-form {
            margin-top: 2rem;
            padding: 1rem;
        }

        .product-img {
            height: 20vh;
            width: auto;

        }

        #total-bill {
            text-align: right;
            color: white;
            padding: 1rem;
            background-color: #F7452F;
        }

        #payment{
            margin-top: 1rem;
            width: 15vw;
            padding: 8px;
            color: black;
            border: 1px solid #EE4D2D;
            border-radius: 8px;
            background-color: white;
        }

        #payment:hover {
            color: red;
        }

        .delete-btn a{
            text-decoration: none;
        }

        .delete-btn a:hover{
            color: red;
        }

        #delivery-infor {
            background-color: white;
            color: #EE4D2D;
            text-align: center;
            font-size: 50px;
            padding: 10px;

        }

        .thank-msg {
            background-color: white;
            color: #EE4D2D;
            text-align: center;
            font-size: 20px;
            padding: 10px;
        }

        .address-input {
            width: 15vw;
        }

        .part-infor{
            font-weight: bold;
        }

        .quantity-input {
            width: 3vw;
            text-align: right;
        }




        @media (min-width: 1025px) {
            .h-custom {
                height: 100vh !important;
            }
        }
    </style>

    <script>
        $(document).ready(function () {
            //$('.product-price:eq('+"0"+')').text(formatCurrency($('.default-price:first').text()));
            defaulttotalBill();
            writePrice();
            totalBill();


        });


        function defaulttotalBill() {
            var total = 0;
            for (var i = 0; i < $('.product-inf').length; i++) {
                var price = parseInt($('.default-price:eq(' + i + ')').text());
                total += price;
            }
            $('#total-bill-value').text(formatCurrency(total));
        }

        function totalBill() {
            $(document).on('click', '.product-quantity', function () {

                var index = $('.product-quantity').index(this);
                if ($('.product-quantity:eq(' + index + ')').val() < 1) {
                    $('.product-quantity:eq(' + index + ')').val('1');
                }
                var quantity = $('.product-quantity:eq(' + index + ')').val();
                var price = $('.default-price:eq(' + index + ')').text();
                $('.product-price:eq(' + index + ')').text(formatCurrency(price * quantity));

                var total = 0;
                for (var i = 0; i < $('.product-inf').length; i++) {
                    var price = parseInt($('.product-price:eq(' + i + ')').text().replace(/\./g, '').replace('₫', ''));
                    total += parseInt(price);
                }
                $('#total-bill-value').text(formatCurrency(total));
            });
        }

        function writePrice() {
            for (var i = 0; i < $('.product-inf').length; i++) {
                $('.product-price:eq(' + i + ')').text(formatCurrency($('.default-price:eq(' + i + ')').text()));
            }
        }

        function formatCurrency(number) {
            const formatter = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND',
                minimumFractionDigits: 0
            });
            return formatter.format(number);
        }

    </script>
</html>
