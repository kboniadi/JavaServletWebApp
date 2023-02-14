<%@ page import="com.cs137.javaservletwebapp.model.Product" %><%--
  Created by IntelliJ IDEA.
  User: hanna
  Date: 2/14/2023
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
</head>
<body>
<h1>Our Products</h1>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        for(Product product:products){
    %>
    <div class="mygrid">
        <div class="item">
            <img src="<%=product.getImageUrl()%>" alt="pic">
            <div><%=product.getName()%></div>
            <div><%=product.getPrice()%></div>
            <div><%=product.getReviews()%></div>
        </div>
    </div>
<%}%>
<link rel="stylesheet" href="eComStyle.css">
</body>
</html>
