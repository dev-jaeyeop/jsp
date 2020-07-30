<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-29
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>result</title>
</head>
<body>
<c:forEach var="i" items="${paramValues.checkbox}">
    ${i} <br>
</c:forEach>
</body>
</html>
