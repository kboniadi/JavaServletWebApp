<%@ page import="com.cs137.javaservletwebapp.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs137.javaservletwebapp.service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Purchased</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@glidejs/glide/dist/css/glide.core.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@glidejs/glide/dist/css/glide.theme.min.css">
</head>
<body>
<%
    ProductService productService = new ProductService();
    List<Product> productsPurchased = productService.getLastNPurchases(4);
%>
<h1>Recently Purchased</h1>
<div class="<%=!productsPurchased.isEmpty() ? "d-none" : ""%>">
    No Recent Purchases
</div>
<div class="glide <%=productsPurchased.isEmpty() ? "d-none" : ""%>">
    <div class="glide__track" data-glide-el="track">
        <ul class="glide__slides" style="display: flex; align-items: center">
            <%
                for (int i = 0; i < productsPurchased.size(); i++) {%>
            <li class="glide__slide">
                <img src="<%=productsPurchased.get(i).getImageUrl()%>" class="" width="100px" height="auto"
                     alt="">
            </li>
            <%}%>
        </ul>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@glidejs/glide/dist/glide.min.js"></script>
<script>
    new Glide('.glide', {
        type: 'carousel',
        perView: 3,
        focusAt: 'center',
        gap: 30,
        autoplay: 3000,
        hoverpause: true,
        breakpoints: {
            800: {
                perView: 2
            },
            480: {
                perView: 1
            }
        },
        keyboard: true
    }).mount();
</script>
</body>
</html>
