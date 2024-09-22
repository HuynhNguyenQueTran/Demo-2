<%-- 
    Document   : user
    Created on : May 18, 2024, 10:25:41 AM
    Author     : PC
--%>

<%@page import="java.util.List"%>
<%@page import="Product.BookDTO"%>
<%@page import="User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String searchBook = request.getParameter("searchBook");
            if (searchBook == null) {
                searchBook = "";
            }
        %>
        Welcome: <h1><%= loginUser.getFullName()%></h1>
        <form action="SearchBook2" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <br>
        <form action="SearchBook2">
            Search   <input type="text" name="searchBook" value="<%= searchBook%>"/>
            <input type="submit" name="action" value="SearchBook"/>
        </form>
        <%
            List<BookDTO> listBook = (List) request.getAttribute("LIST_BOOK");
            if (listBook != null) {
                if (listBook.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>SKU</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count1 = 1;
                    for (BookDTO user : listBook) {
                %>
            <form action="SearchBook2" method="POST">
                <tr>
                    <td><%= count1++%></td>
                    <td>
                        <input type="text" name="SKU" value="<%= user.getSKU()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="Name" value="<%= user.getName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="Price" value="<%= user.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="Description" value="<%= user.getDescription()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="Quantity" value="<%= user.getQuantity()%>" required=""/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>

        </tbody>
    </table>

    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>

    <%
            }
        }
    %>

    <br>
    <a href="http://localhost:8084/loginform/shopping.jsp">Click here to go Shopping</a>
    <br>
    <br>
    <a href="http://localhost:8084/loginform/login.jsp">Click here to go back to Login Page</a>
</body>
</html>
