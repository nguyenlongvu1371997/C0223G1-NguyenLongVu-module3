<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/1/2023
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <td colspan="2"><a href="/users-servlet?action=create">
            <button type="submit">Thêm mới</button>
        </a></td>
    </tr>
    <c:forEach var="user" items="${list}">
        <tr>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td>
                <form action="/users-servlet" method="get">
                    <input name="action" value="update" hidden>
                    <input name="id" value="${user.id}" hidden>
                    <input name="name" value="${user.name}" hidden>
                    <input name="email" value="${user.email}" hidden>
                    <input name="country" value="${user.country}" hidden>
                    <button type="submit">Sửa</button>
                </form>
            </td>
            <td>
                <form action="/users-servlet?action=remove&id=${user.id}" method="post">
                    <button type="submit">Xóa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
