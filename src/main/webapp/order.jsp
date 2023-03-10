<jsp:useBean id="product" scope="session" type="com.cs137.javaservletwebapp.model.Product"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order</title>
    <script src="https://kit.fontawesome.com/f7ec9befb7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/orderStyle.css">
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="selected" value="order" />
</jsp:include>
<div class="main container d-lg-flex">
    <div class="box-1 bg-light user">
        <div class="d-flex align-items-center mb-3">
            <img
                    src="img/profile-pic.jpg"
                    class="pic rounded-circle" alt="">
            <p class="ps-2 name">Guest User</p>
        </div>
        <div class="box-inner-1 pb-3 mb-3 ">
            <div class="d-flex justify-content-between mb-3 userdetails">
                <p class="fw-bold">${product.name}</p>
                <p class="fw-lighter">
                    <%--                    <span class="fas fa-dollar-sign"></span>--%>
                    ${product.price}
                </p>
            </div>
            <div id="my" class="carousel slide carousel-fade img-details" data-bs-ride="carousel"
                 data-bs-interval="5000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active" aria-current="true"
                            aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <% for (int i = 0; i < product.getImageUrlGallery().size(); i++) {%>
                        <div class="carousel-item <%=i == 0 ? "active" : ""%>">
                            <img src="<%=product.getImageUrlGallery().get(i)%>" class="d-block w-100" style="object-fit: contain;" alt="">
                        </div>
                    <%}%>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#my" data-bs-slide="prev">
                    <div class="icon">
                        <span class="fas fa-arrow-left"></span>
                    </div>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#my" data-bs-slide="next">
                    <div class="icon">
                        <span class="fas fa-arrow-right"></span>
                    </div>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <div class="box-2">
        <div class="box-inner-2">
            <form action="order" method="post">
                <p class="dis my-3 info">${product.description}</p>
                <p class="dis mb-3 updates">${product.maker}</p>
                <div class="different">
                    <div class="rate">
                        <input type="radio" id="star5" name="rate" value="5" />
                        <label for="star5" title="text">5 stars</label>
                        <input type="radio" id="star4" name="rate" value="4" />
                        <label for="star4" title="text">4 stars</label>
                        <input type="radio" id="star3" name="rate" value="3" />
                        <label for="star3" title="text">3 stars</label>
                        <input type="radio" id="star2" name="rate" value="2" />
                        <label for="star2" title="text">2 stars</label>
                        <input type="radio" id="star1" name="rate" value="1" />
                        <label for="star1" title="text">1 star</label>
                    </div>
                </div>
                <button class="btn btn-primary mt-2" type="submit">
                    Add to Cart
                </button>
            </form>
        </div>
    </div>
<%--    <div class="box-2">--%>
<%--        <div class="box-inner-2">--%>
<%--            <div>--%>
<%--                <div class="h5 fw-bold">Payment Details</div>--%>
<%--                <p class="dis mb-3">Complete your purchase by providing your payment details</p>--%>
<%--            </div>--%>
<%--            <form action="order" method="post" autocomplete="on" class="needs-validation" novalidate>--%>
<%--                <div class="mb-3">--%>
<%--                    <p class="dis fw-bold mb-2">Email address</p>--%>
<%--                    <input class="form-control" type="email" placeholder="Timmy@gmail.com" name="email"  autocomplete="email" required>--%>
<%--                    <div class="invalid-feedback">--%>
<%--                        Please input correct email.--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    <p class="dis fw-bold mb-2">Card details</p>--%>
<%--                    <div class="d-flex align-items-center justify-content-between card-atm border rounded">--%>
<%--                        <div class="fab fa-cc-visa ps-3"></div>--%>
<%--                        <input type="text" class="form-control" placeholder="Card Details" pattern="[0-9\s]{13,19}" autocomplete="cc-number"  required>--%>
<%--                        <div class="d-flex w-50">--%>
<%--                            <input type="text" class="form-control px-0" placeholder="MM/YY" pattern="[0-9]{2}\/[0-9]{2}" autocomplete="cc-exp" required>--%>
<%--                            <input type="password" maxlength=3 class="form-control px-0" placeholder="CVV" pattern="[0-9]{3}" autocomplete="cc-csc" required>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="invalid-feedback">--%>
<%--                        Please input correct card information.--%>
<%--                    </div>--%>

<%--                    <div class="my-3 cardname">--%>
<%--                        <p class="dis fw-bold mb-2">Cardholder name</p>--%>
<%--                        <input class="form-control" type="text" autocomplete="cc-name" required>--%>
<%--                        <div class="invalid-feedback">--%>
<%--                            Please input cardholder name.--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="address">--%>
<%--                        <p class="dis fw-bold mb-3">Billing address</p>--%>
<%--                        <select class="form-select" aria-label="Default select example" required>--%>
<%--                            <option selected disabled value>Choose</option>--%>
<%--                            <option value="1">London</option>--%>
<%--                            <option value="2">Australia</option>--%>
<%--                            <option value="3">Canada</option>--%>
<%--                            <option value="4">United States</option>--%>
<%--                        </select>--%>
<%--                        <div class="d-flex">--%>
<%--                            <input class="form-control zip" type="text" placeholder="ZIP" pattern="[0-9]+" autocomplete="postal-code" required>--%>
<%--                            <input class="form-control state" type="text" placeholder="State" pattern="[\w]+" required>--%>
<%--                        </div>--%>
<%--                        <div class="invalid-feedback">--%>
<%--                            Please input correct billing address.--%>
<%--                        </div>--%>
<%--                        <div class="my-3">--%>
<%--                            <p class="dis fw-bold mb-2">Discount Code</p>--%>
<%--                            <input class="form-control text-uppercase" type="text" value="" id="discount">--%>
<%--                        </div>--%>
<%--                        <div class="d-flex flex-column dis">--%>
<%--                            <div class="d-flex align-items-center justify-content-between mb-2">--%>
<%--                                <p>Subtotal</p>--%>
<%--                                <p>--%>
<%--                                    &lt;%&ndash;                                    <span class="fas fa-dollar-sign"></span>&ndash;%&gt;--%>
<%--                                    ${product.price}--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex align-items-center justify-content-between mb-2">--%>
<%--                                <div class="d-flex align-items-center">--%>
<%--                                    <p class="pe-2">Discount <span--%>
<%--                                            class="d-inline-flex align-items-center justify-content-between bg-light px-2 couponCode d-none"> <span--%>
<%--                                            id="code" class="pe-2"></span> <span--%>
<%--                                            class="fas fa-times close"></span> </span>--%>
<%--                                    </p>--%>
<%--                                </div>--%>
<%--                                <p><span class="fas fa-dollar-sign"></span><span id="discount-value">0.00</span></p>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex align-items-center justify-content-between mb-2"><p class="fw-bold">--%>
<%--                                Total</p>--%>
<%--                                <p id="total" class="fw-bold">--%>
<%--                                    &lt;%&ndash;                                    <span class="fas fa-dollar-sign"></span>&ndash;%&gt;--%>
<%--                                    ${product.price}--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--&lt;%&ndash;                            <span class="fas fa-dollar-sign px-1"></span>&ndash;%&gt;--%>
<%--                            <button class="btn btn-primary mt-2" type="submit">--%>
<%--                                Pay <span id="pay-total">${product.price}</span>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
