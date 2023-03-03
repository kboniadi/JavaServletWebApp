<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script defer async src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link href="css/header.css" rel="stylesheet">
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
                                    <li class="nav-item ${param.selected == "home" ? "active" : ""}">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                                    </li>
                                    <li class="nav-item ${param.selected == "about" ? "active" : ""}">
                                        <a class="nav-link" href="about">About</a>
                                    </li>
                                    <li class="nav-item ${param.selected == "products" ? "active" : ""}">
                                        <a class="nav-link" href="products">Products</a>
                                    </li>
                                    <li class="nav-item">
                                        <a style="padding: 0" class="nav-link" href="checkout">
                                            <div id="ex4">
                                                  <span class="p1 fa-stack fa-xl" data-count="${sessionScope.cart != null ? sessionScope.cart.size() : 0}">
<%--                                                    <i class="p2 fa fa-circle fa-stack-2x"></i>--%>
                                                    <i class="p3 fa-solid fa-cart-shopping fa-stack-1x xfa-inverse" data-count="4b"></i>
                                                  </span>
                                            </div>
                                        </a>
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
</body>
</html>
