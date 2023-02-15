<jsp:useBean id="product" scope="request" type="com.cs137.javaservletwebapp.model.Product"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <link rel="stylesheet" href="css/orderStyle.css">
</head>
<body>
<div class="container d-lg-flex">
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
                 data-bs-interval="2000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active" aria-current="true"
                            aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img
                                src="${product.imageUrl}"
                                class="d-block w-100" style="object-fit: contain;"></div>
                    <div class="carousel-item">
                        <img
                                src="${product.imageUrl}"
                                class="d-block w-100" style="object-fit: contain;"></div>
                    <div class="carousel-item">
                        <img
                                src="${product.imageUrl}"
                                class="d-block w-100" style="object-fit: contain;"></div>
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
            <p class="dis my-3 info">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate quos ipsa sed
                officiis odio libero consectetur placeat dignissimos et ab dolorum, nemo id provident quidem modi,
                dolorem dolores quas quasi. </p>
            <p class="dis mb-3 updates">${product.maker}</p>
            <p class="dis mb-3 updates">${product.reviews}</p>
            <p class="dis mb-3 different">Three different colored sets:</p>
            <div class="dis">
                <p class="black"><span class="fas fa-arrow-right mb-3 pe-2"></span>Black</p>
                <p class="white"><span class="fas fa-arrow-right mb-3 pe-2"></span>White</p>
                <p class="pastel"><span class="fas fa-arrow-right mb-3 pe-2"></span>Pastel</p></div>
        </div>
    </div>
    <div class="box-2">
        <div class="box-inner-2">
            <div>
                <div class="h5 fw-bold">Payment Details</div>
                <p class="dis mb-3">Complete your purchase by providing your payment details</p>
            </div>
            <form action="">
                <div class="mb-3">
                    <p class="dis fw-bold mb-2">Email address</p>
                    <input class="form-control" type="email" value="Timmy@gmail.com">
                </div>
                <div>
                    <p class="dis fw-bold mb-2">Card details</p>
                    <div class="d-flex align-items-center justify-content-between card-atm border rounded">
                        <div class="fab fa-cc-visa ps-3"></div>
                        <input type="text" class="form-control" placeholder="Card Details">
                        <div class="d-flex w-50">
                            <input type="text" class="form-control px-0" placeholder="MM/YY">
                            <input type="password" maxlength=3 class="form-control px-0" placeholder="CVV">
                        </div>
                    </div>
                    <div class="my-3 cardname">
                        <p class="dis fw-bold mb-2">Cardholder name</p>
                        <input class="form-control" type="text">
                    </div>
                    <div class="address">
                        <p class="dis fw-bold mb-3">Billing address</p>
                        <select class="form-select" aria-label="Default select example">
                            <option selected hidden>United States</option>
                            <option value="1">London</option>
                            <option value="2">Australia</option>
                            <option value="3">Canada</option>
                        </select>
                        <div class="d-flex">
                            <input class="form-control zip" type="text" placeholder="ZIP">
                            <input class="form-control state" type="text" placeholder="State">
                        </div>
                        <div class="my-3">
                            <p class="dis fw-bold mb-2">Discount Code</p>
                            <input class="form-control text-uppercase" type="text" value="" id="discount">
                        </div>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>Subtotal</p>
                                <p>
                                    <%--                                    <span class="fas fa-dollar-sign"></span>--%>
                                    ${product.price}
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
                                    ${product.price}
                                </p>
                            </div>
                            <div class="btn btn-primary mt-2">Pay<span
                                    class="fas fa-dollar-sign px-1"></span><span id="pay-total">${product.price}</span>
                            </div>
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
