<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/31/2023
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product-servlet?action=add" method="post">
    Nhập ID: <input name="id"><br>
    Nhập tên: <input name="name"><br>
    Nhập hãng: <input name="brand"><br>
    Nhập giá: <input name="price"><br>
    Thêm <input type="submit">
</form>
<a href="/product-servlet?action=display">Quay lại danh sách sản phẩm</a>
</body>
</html>
