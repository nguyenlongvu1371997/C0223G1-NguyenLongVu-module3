<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/1/2023
  Time: 6:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/users-servlet?action=update">
    <input name="id" value="${user.id}" hidden>
    <input name="name" value="${user.name}">
    <input name="email" value="${user.email}">
    <input name="country" value="${user.country}">
    <input type="submit" value="Sửa">
</form>
</body>
</html>
