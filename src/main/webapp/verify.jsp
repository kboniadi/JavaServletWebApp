<%--
  Created by IntelliJ IDEA.
  User: kord
  Date: 2/15/23
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Verify Page</title>
</head>
<body>
<span>We already send a verification  code to your email.</span>

<form action="verify" method="post">
    <input type="text" name="authcode" >
    <input type="submit" value="verify">
</form>
</body>
</html>
