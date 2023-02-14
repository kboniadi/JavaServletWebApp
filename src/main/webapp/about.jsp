<%@ page import="com.cs137.javaservletwebapp.model.Employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> Students Information </h3>
<%
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    for (Employee employee : employees) {
%>
    <div>
        <img src="<%=employee.getProfilePicUrl()%>" alt="profile pic">
        <div><%=employee.getName()%></div>
    </div>
    <br>
<%}%>
</body>
</html>
