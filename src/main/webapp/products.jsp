<%@ page import="com.cs137.javaservletwebapp.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <script src="https://kit.fontawesome.com/f7ec9befb7.js" crossorigin="anonymous"></script>
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="selected" value="products" />
</jsp:include>
<div class="main container text-center">
    <%
        List<Product> productsPurchased = (List<Product>) request.getAttribute("productsPurchased");
    %>
    <h1>Recently Purchased</h1>
    <div class="<%=!productsPurchased.isEmpty() ? "d-none" : ""%>">
        No Recent Purchases
    </div>
    <div id="carouselExampleControls" class="carousel slide <%=productsPurchased.isEmpty() ? "d-none" : ""%>" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <%
                for (int i = 0; i < productsPurchased.size(); i++) {%>
            <div class="carousel-item <%=i == 0 ? "active" : ""%>" style="height: 300px; width: 100%;">
                <img src="<%=productsPurchased.get(i).getImageUrl()%>" class="d-block w-100"
                     alt="" style="object-fit: cover">
            </div>
            <%}%>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
<%--    <div id="my" class="carousel slide carousel-fade img-details <%=productsPurchased.isEmpty() ? "d-none" : ""%>" data-bs-ride="carousel"--%>
<%--         data-bs-interval="5000">--%>
<%--        <div class="carousel-indicators">--%>
<%--            <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active" aria-current="true"--%>
<%--                    aria-label="Slide 1"></button>--%>
<%--            <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>--%>
<%--            <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>--%>
<%--        </div>--%>
<%--        <div class="carousel-inner">--%>
<%--            <%--%>
<%--                for (int i = 0; i < productsPurchased.size(); i++) {%>--%>
<%--            <div class="carousel-item <%=i == 0 ? "active" : ""%>">--%>
<%--                <img src="<%=productsPurchased.get(i).getImageUrl()%>" class="d-block" width="100px" style="object-fit: contain;"--%>
<%--                     alt="">--%>
<%--            </div>--%>
<%--            <%}%>--%>
<%--        </div>--%>
<%--        <button class="carousel-control-prev" type="button" data-bs-target="#my" data-bs-slide="prev">--%>
<%--            <div class="icon">--%>
<%--                <span class="fas fa-arrow-left"></span>--%>
<%--            </div>--%>
<%--            <span class="visually-hidden">Previous</span>--%>
<%--        </button>--%>
<%--        <button class="carousel-control-next" type="button" data-bs-target="#my" data-bs-slide="next">--%>
<%--            <div class="icon">--%>
<%--                <span class="fas fa-arrow-right"></span>--%>
<%--            </div>--%>
<%--            <span class="visually-hidden">Next</span>--%>
<%--        </button>--%>
<%--    </div>--%>
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
</body>
</html>
