<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-29
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>use_timezone_tag</title>
</head>
<body>
<c:set var="now" value="<%=new Date()%>"/>
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
<br>
<fmt:timeZone value="Hongkong">
    <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>
</body>
</html>
