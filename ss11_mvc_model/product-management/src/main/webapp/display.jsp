<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/31/2023
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Brand</td>
        <td>Price</td>
        <td colspan="2"><a href="/product-servlet?action=add">Thêm mới</a></td>

    </tr>
    <c:forEach var="p" items="${list}">
        <tr>

            <td><a>${p.id}</a></td>
            <td>${p.name}</td>
            <td>${p.brand}</td>
            <td>${p.price}</td>
            <td>
                <a href="/product-servlet?action=delete&id=${p.id}">Xóa</a>
            </td>
            <td>
                <a href="/product-servlet?action=update&id=${p.id}&name=${p.name}&brand=${p.brand}&price=${p.price}">Sửa</a>
            </td>
        </tr>
    </c:forEach>
</table>
<form method="get" action="/product-servlet?">
    <input name="action" value="find" hidden>
    <input name="name">
    <input type="submit">
</form>

</body>
</html>
