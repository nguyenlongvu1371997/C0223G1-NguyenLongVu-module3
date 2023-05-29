<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product discount calculator</title>
</head>
<body>
<form method="post" action="/ChangeServlet.java">
    <input type="text" name="description" placeholder="Product Description">
    <input type="number" name="price" placeholder="List price">
    <input type="number" name="discount" placeholder="Discount percent">
    <button type="submit">send</button>
</form>
</body>
</html>