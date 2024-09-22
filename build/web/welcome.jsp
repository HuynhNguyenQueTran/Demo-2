<%-- 
    Document   : welcome
    Created on : May 10, 2024, 8:19:30 AM
    Author     : Luu Minh Quan
--%>

<%@page import="Product.BookDTO"%>
<%@page import="java.util.List"%>
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
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("fail.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            String searchBook = request.getParameter("searchBook");
            if (searchBook == null) {
                searchBook = "";
            }
        %>
        Welcome: <h1><%= loginUser.getFullName()%></h1>
        <form action="SearchServlet" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="SearchServlet">
            Search<input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <%
            List<UserDTO> listUser = (List) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="SearchServlet" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="userID" value="<%= user.getUserID()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                    </td>
                    <td><%= user.getPassword()%></td>
                    <!--detele o day ne-->
                    <td>
                        <a href="MainController?userID=<%= user.getUserID()%>&action=Delete&search=<%= search%>">Delete</a>
                    </td>
                    <!--update i day ne-->  
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
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
    <form action="SearchBook" method="POST">
        <input type="submit" name="action" value="Logout"/>
    </form>
    <form action="SearchBook">
        Search<input type="text" name="searchBook" value="<%= searchBook%>"/>
        <input type="submit" name="action" value="SearchBook"/>
    </form>
        
        <form action="createBook.jsp">
            <input type = "submit" value = "Create new book">
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
                <th>Delete</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count1 = 1;
                for (BookDTO user : listBook) {
            %>
        <form action="SearchBook" method="POST">
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
                <!--detele o day ne-->
                <td>
                    <a href="MainController?userID=<%= user.getName()%>&action=Delete&search=<%= search%>">Delete</a>
                </td>
                <!--update i day ne-->  
                <td>
                    <input type="submit" name="action" value="Update"/>
                    <input type="hidden" name="search" value="<%= search%>"/>
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
<a href="http://localhost:8084/loginform/login.jsp">Click here to go back to Login Page</a>
</body>
</html>
