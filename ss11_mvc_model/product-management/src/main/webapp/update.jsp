<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/31/2023
  Time: 6:38 PM
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
        <td></td>
    </tr>
    <form method="get" action="/product-servlet?action=update">
        <td><input name="id" ></td>
        <td><input name="name" ></td>
        <td><input name="brand" ></td>
        <td><input name="price" ></td>
        <td><input type="submit"></td>
    </form>
</table>
</body>
</html>
