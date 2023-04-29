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


            <div class="container" id="delivery-infor">
                <h5>Thông tin người nhận:</h5>
                <div class="part-infor">Người nhận:</div>
                <div class="out">${sessionScope.customer.getCustomerName()}</div>
                <div class="part-infor">Số điện thoại người nhận:</div>
                <div class="out">${sessionScope.customer.getCustomerPhone()}</div>
                <div class="part-infor">Địa chỉ nhận hàng: </div>
                <input type="text" class="address-input" name="address"/>
                <div class="part-infor">Địa chỉ email: </div>
                <input type="email" class="address-input" name="email"/>
                <h5>Chi tiết đơn hàng:</h5>
            </div>
            <table>
                <c:forEach items="${requestScope.products}" var="p">
                    <tr class="product-inf">
                        <td><img src="${p[0].toString()}" alt="alt" class="product-img"/></td>
                        <td class="product-name">${p[1].toString()}</td>
                        <td>Số lượng: ${p[7]}</td>
                        <input type="number" name="product-quantity-${p[6]}" value="${p[7]}" class="product-quantity" hidden/>
                        <td hidden class="default-price">${p[2]*p[7]}</td>
                        <td class="product-price"></td>
                    </tr>
                </c:forEach>
            </table>
            <div id="total-bill">Tổng thanh toán: <span id="total-bill-value"></span></div>

            <button id="payment" type="submit">Xác nhận đơn hàng</button>
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
