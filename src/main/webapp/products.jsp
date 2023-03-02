<%@ page import="com.cs137.javaservletwebapp.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/f7ec9befb7.js" crossorigin="anonymous"></script>
    <link href="css/header.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<header id="sticky-header" class="header-area sticky">
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="main-menu">
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                                <h3 style="margin: 0;">
                                    <i class="fa-solid fa-laptop"></i>
                                </h3>
                            </a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about">About</a>
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link" href="products">Products</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="checkout">Checkout</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="main container text-center">
    <%
        List<Product> productsPurchased = (List<Product>) request.getAttribute("productsPurchased");
    %>
    <h1>Recently Purchased</h1>
    <div class="<%=!productsPurchased.isEmpty() ? "d-none" : ""%>">
        No Recent Purchases
    </div>
    <div id="my" class="carousel slide carousel-fade img-details <%=productsPurchased.isEmpty() ? "d-none" : ""%>" data-bs-ride="carousel"
         data-bs-interval="5000">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active" aria-current="true"
                    aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <%
                for (int i = 0; i < productsPurchased.size(); i++) {%>
            <div class="carousel-item <%=i == 0 ? "active" : ""%>">
                <img src="<%=productsPurchased.get(i).getImageUrl()%>" class="d-block w-100" style="object-fit: contain;"
                     alt="">
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
    <h1 style="margin-top: 2rem;">Our Products</h1>
    <div id="cards-hover" style="margin-top: 2rem;">
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 gx-3 gy-5">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product product : products) {
            %>
            <div class="col">
                <a href="order?productId=<%=product.getId()%>">
                    <div class="card">
                        <div class="image-box">
                            <img class="card-img-top" src="<%=product.getImageUrl()%>" height="200" width="auto"
                                 style="object-fit: contain" alt="phone">
                        </div>
                        <div class="card-body">
                            <h6><%=product.getName()%>
                            </h6>
                            <div class="body">
                                <div><%=product.getMaker()%>
                                </div>
                                <div><strong><%=product.getPrice()%>
                                </strong></div>
                            </div>
                            <div class="star-rating">
                                <% for (int i = 0; i < 5; i++) {
                                    if (i + 1 <= product.getReviews()) {%>
                                <span class="fa fa-star checked"></span>
                                <%} else {%>
                                <span class="fa fa-star"></span>
                                <%}%>
                                <%}%>
                            </div>
                        </div>

                    </div>

                </a>
            </div>

            <%}%>
        </div>
    </div>
</div>
<footer style="margin-top: 2rem">
    <div class="footer-area black-bg pt-4 pb-4">
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
