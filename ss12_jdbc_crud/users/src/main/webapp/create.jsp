<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/1/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/users-servlet?action=create">
    Nhập tên <input name="name"><br>
    Nhập email <input name="email"><br>
    Nhập quốc tịch <input name="country"><br>
    <input type="submit" value="Thêm">
</form>
<a href="/users-servlet">
    <button type="submit">Về danh sách</button>
</a>
</body>
</html>
