<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-29
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dan" value="${param.dan}"/>
<c:set var="begin" value="${param.begin}"/>
<c:set var="end" value="${param.end}"/>
<html>
<head>
    <title>result</title>
</head>
<body>
<c:forEach var="i" begin="${begin}" end="${end}" step="1">
    <c:choose>
        <c:when test="${dan < 2}">
            dan < 2
        </c:when>
        <c:when test="${dan > 9}">
            9 * ${i} = ${9 * i} <br>
        </c:when>
        <c:otherwise>
            ${dan} * ${i} = ${dan * i} <br>
        </c:otherwise>
    </c:choose>
</c:forEach>
</body>
</html>
