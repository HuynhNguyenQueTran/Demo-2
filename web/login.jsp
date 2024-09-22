<%-- 
    Document   : login
    Created on : May 10, 2024, 8:08:33 AM
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
        <h1>Login</h1>
        <form action="loginservlet" method="post">
            txtUser <input type="text" name="userID"/><br/>
            txtPass <input type="password" name="password"/><br/>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>
        </form>
        <br>

        <a href="create.jsp">Go to Create new User</a><br/>
        <br>
        <a href="shopping.jsp">Go to buy Shopping</a><br/>

    </body>
</html>
