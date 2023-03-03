<%@ page import="com.cs137.javaservletwebapp.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs137.javaservletwebapp.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/f7ec9befb7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/orderStyle.css">
</head>
<body>
<div class="container d-lg-flex">
    <div class="box-1 bg-light user">
        <%
            Cart cart = (Cart) request.getAttribute("cart");
        %>
        <div class="d-flex align-items-center mb-3">
            <img
                    src="img/profile-pic.jpg"
                    class="pic rounded-circle" alt="">
            <p class="ps-2 name">Guest User</p>
        </div>

        <div class="box-inner-1 pb-3 mb-3">
            <h1>Checkout</h1>
            <div class="<%=!cart.isEmpty() ? "d-none" : ""%>">
                Nothing in Checkout
            </div>
            <div class="<%=cart.isEmpty() ? "d-none" : ""%>">
                <ul class ="list-group">
                    <%
                        for (Product product : cart.getProducts()) {
                    %>
                    <li class="list-group-item"><%=product.getName()%></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
    <div class="box-2">
        <div class="box-inner-2">
            <div>
                <div class="h5 fw-bold">Payment Details</div>
                <p class="dis mb-3">Complete your purchase by providing your payment details</p>
            </div>
            <form action="checkout" method="post" autocomplete="on" class="needs-validation" novalidate>
                <div class="mb-3">
                    <p class="dis fw-bold mb-2">Email address</p>
                    <input class="form-control" type="email" placeholder="Timmy@gmail.com" name="email"  autocomplete="email" required>
                    <div class="invalid-feedback">
                        Please input correct email.
                    </div>
                </div>
                <div>
                    <p class="dis fw-bold mb-2">Card details</p>
                    <div class="d-flex align-items-center justify-content-between card-atm border rounded">
                        <div class="fab fa-cc-visa ps-3"></div>
                        <input type="text" class="form-control" placeholder="Card Details" pattern="[0-9\s]{13,19}" autocomplete="cc-number"  required>
                        <div class="d-flex w-50">
                            <input type="text" class="form-control px-0" placeholder="MM/YY" pattern="[0-9]{2}\/[0-9]{2}" autocomplete="cc-exp" required>
                            <input type="password" maxlength=3 class="form-control px-0" placeholder="CVV" pattern="[0-9]{3}" autocomplete="cc-csc" required>
                        </div>
                    </div>
                    <div class="invalid-feedback">
                        Please input correct card information.
                    </div>

                    <div class="my-3 cardname">
                        <p class="dis fw-bold mb-2">Cardholder name</p>
                        <input class="form-control" type="text" autocomplete="cc-name" required>
                        <div class="invalid-feedback">
                            Please input cardholder name.
                        </div>
                    </div>
                    <div class="address">
                        <p class="dis fw-bold mb-3">Billing address</p>
                        <select class="form-select" aria-label="Default select example" required>
                            <option selected disabled value>Choose</option>
                            <option value="1">London</option>
                            <option value="2">Australia</option>
                            <option value="3">Canada</option>
                            <option value="4">United States</option>
                        </select>
                        <div class="d-flex">
                            <input class="form-control zip" type="text" placeholder="ZIP" pattern="[0-9]+" autocomplete="postal-code" required>
                            <input class="form-control state" type="text" placeholder="State" pattern="[\w]+" required>
                        </div>
                        <div class="invalid-feedback">
                            Please input correct billing address.
                        </div>
                        <div class="my-3">
                            <p class="dis fw-bold mb-2">Discount Code</p>
                            <input class="form-control text-uppercase" type="text" value="" id="discount">
                        </div>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>Subtotal</p>
                                <p class="<%=!cart.isEmpty() ? "d-none" : ""%>">
                                    0
                                </p>
                                <p class="<%=cart.isEmpty() ? "d-none" : ""%>">
                                    <%--                                    <span class="fas fa-dollar-sign"></span>--%>
                                    $<%=cart.getRawTotal()%>
                                </p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <div class="d-flex align-items-center">
                                    <p class="pe-2">Discount <span
                                            class="d-inline-flex align-items-center justify-content-between bg-light px-2 couponCode d-none"> <span
                                            id="code" class="pe-2"></span> <span
                                            class="fas fa-times close"></span> </span>
                                    </p>
                                </div>
                                <p><span class="fas fa-dollar-sign"></span><span id="discount-value">0.00</span></p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2"><p class="fw-bold">
                                Total</p>
                                <p id="total" class="fw-bold">
                                    <%--                                    <span class="fas fa-dollar-sign"></span>--%>
                                    $<%=cart.getRawTotal()%>
                                </p>
                            </div>
                            <%--                            <span class="fas fa-dollar-sign px-1"></span>--%>
                            <button class="btn btn-primary mt-2" type="submit" disabled="${sessionScope.cart.isEmpty() ? true : false}">
                                Pay <span id="pay-total">$<%=cart.getRawTotal()%></span>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
