<%-- 
    Document   : fail
    Created on : May 10, 2024, 8:29:22 AM
    Author     : Luu Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ms = (String)request.getAttribute("ERROR");
            if(ms== null) ms="You are not able access this page";
        %>
        <h1 style="color: red"><%= ms%></h1>
        <a href="http://localhost:8084/loginform/login.jsp">Click here to try again</a>
    </body>
</html>
