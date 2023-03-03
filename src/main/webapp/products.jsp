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
    <jsp:include page="purchased.jsp"/>
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
