<%@ page import="com.cs137.javaservletwebapp.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cs137.javaservletwebapp.model.Product" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="css/styles.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/f7ec9befb7.js" crossorigin="anonymous"></script>
</head>
<body>
<header id="sticky-header" class="header-area sticky">
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="main-menu">
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="#top">
                                <h3 style="margin: 0;">
                                    <i class="fa-regular fa-laptop"></i>
                                </h3>
                            </a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ms-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="products">Products</a>
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
<div class="main container">
    <h1>Mission Statement</h1>
    <p>Our business is a retail store that offers a wide variety of products ranging from the latest and
        greatest smartphones to vintage items such as those old bricks popular in the 20th century. The store's mission is to
        provide customers with a diverse selection of products that cater to various interests and needs.

        The store sources its products from various suppliers, including manufacturers of the latest smartphones and
        vendors of vintage and antique items. The store's inventory is constantly changing, as new products are
        introduced and old ones are sold out.

        Customers who visit the store will find a modern and inviting atmosphere that is designed to make their shopping
        experience as enjoyable as possible. The store is organized into sections that make it easy to navigate and find
        the products they are looking for. The staff is knowledgeable and helpful, and they are always willing to assist
        customers with any questions or concerns they may have.

        Overall, the business is well-positioned to serve a diverse range of customers, from tech enthusiasts to
        collectors of vintage and antique items. Its commitment to quality products, excellent customer service, and
        expert repair services make it a popular destination for anyone in search of the latest technology or unique
        vintage items.</p>
    <h1>Meet the team</h1>
    <%
        List<Employee> employees = (List<Employee>) request.getAttribute("employees");
        for (Employee employee : employees) {
    %>
    <div>
        <img src="<%=employee.getProfilePicUrl()%>" alt="profile pic" width="100px"
             style="float: left; margin-right: 15px; object-fit: cover">
        <div>
            <h2 style=""><%=employee.getName()%>
            </h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis dignissimos enim, hic illo incidunt
                inventore iste maxime nam tenetur voluptatem? A accusamus autem dolor fuga ipsum nulla obcaecati
                veritatis.
                Dolorum?</p>
        </div>
    </div>
    <br>
    <%}%>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>