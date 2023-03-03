<%--
  Created by IntelliJ IDEA.
  User: alice
  Date: 3/2/2023
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.cs137.javaservletwebapp.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs137.javaservletwebapp.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>About us</title>
  <script src="https://kit.fontawesome.com/f7ec9befb7.js" crossorigin="anonymous"></script>
  <link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>Thank you for ordering!</h1>
  <div>
    <h2>These items are on the way</h2>
    <%
      Cart cart = (Cart) request.getAttribute("cart");
    %>
    <div>
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
</body>
</html>