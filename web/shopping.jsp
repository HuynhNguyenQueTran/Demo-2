<%-- 
    Document   : shopping
    Created on : Oct 15, 2022, 3:45:27 PM
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABC Book Store</title>
    </head>
    <body>
        <h1>Welcome to ABC Book Store</h1>
        <div style="display: flex ">
            <form action="AddToCartController" method="POST">
                <select name="cmbName" >
                    <option value="BOOK01-Java-150000">Java Book - 150000vnd</option>
                    <option value="BOOK010-EL-10000">EL Book - 10000vnd</option>
                    <option value="BOOK011-EU-150000">EU Book - 15000vnd</option>
                    <option value="BOOK02-MVC2-90000">MVC2 Book - 9000vnd</option>
                    <option value="BOOK03-Tomcat-180000">Tomcat Book - 180000vnd</option>
                    <option value="BOOK04-C++-75000">C++ Book - 75000vnd</option>
                    <option value="BOOK05-Servlet-60000">Servlet Book - 60000vnd</option>
                    <option value="BOOK06-JavaBean-50000">JavaBean - 50000vnd</option>
                    <option value="BOOK07-JSP-40000">JSP Book - 40000vnd</option>
                    <option value="BOOK08-JDBC-30000">JDBC Book - 30000vnd</option>
                    <option value="BOOK09-Scripting Elements-250000">Scripting Elements Book - 250000</option>
                </select>
                <select name="cmbQuantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="50">50</option>

                </select>
                <input type="submit" name="action" value="Add"/>
            </form>
            <form action="viewCart.jsp">
                <input type="submit" name="action" value="View"/>
            </form>
        </div>
        <%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
    </body>
</html>
