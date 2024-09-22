<%-- 
    Document   : viewCart
    Created on : Oct 15, 2022, 4:36:03 PM
    Author     : hd
--%>

<%@page import="Product.BookDTO"%>
<%@page import="Product.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Page</title>
    </head>
    <body>
        <h1>Sản phẩm bạn đã chọn :</h1>
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Change</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (BookDTO p : cart.getCart().values()) {
                        total += p.getPrice() * p.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td> 
                        <input type="text" name="sku" value="<%= p.getSKU()%>" readonly=""/>
                    </td>
                    <td><%= p.getName()%></td>
                    <td>
                        <input type="number" min="1" name="quantity" value="<%= p.getQuantity()%>" required=""/>
                    </td>
                    <td><%= p.getPrice()%> VND</td>
                    <td><%= p.getPrice() * p.getQuantity()%> VND</td>
                    <td>
                        <input type="submit" name="action" value="Change"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>

        </tbody>
    </table>

    <h1>Total:<%= total%> VND  </h1>      
    <%
        }
    %>
    </br>
    <a href="shopping.jsp">Add more</a>
    <br>
    <br>
    <a href="http://localhost:8084/loginform/login.jsp">Go back to Login Page</a>


</body>
</html>
