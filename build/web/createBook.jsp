<%-- 
    Document   : user
    Created on : May 18, 2024, 12:25:41 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Product.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="User.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Input your information</h1>
        <h3 style="color: red">${error}</h3>
        <form action="CreateBook" method="POST">
            SKU  <input type="text" name="SKU" required=""/>
            </br>
            Name  <input type="text" name="Name" required=""/>
            </br>
            Price  <input type="text" name="Price" required=""/></br>
            Description  <input type="text" name="Description" required=""/></br>
            Quantity  <input type="text" name="Quantity" required=""/>
            </br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset"  value="Reset"/>
        </form>
    </body>
</html>
