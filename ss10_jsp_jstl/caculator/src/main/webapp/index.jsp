<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/31/2023
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/Servlet" method="post">
    <input name="number1" type="number">
    <select name="math">
      <option>plus</option>
      <option>minus</option>
      <option>multiply</option>
      <option>divide</option>
    </select>
    <input name="number2" type="number">
    <input type="submit">
  </form>

  </body>
</html>
