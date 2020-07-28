<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오후 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("name", "Tom");
%>
<html>
<head>
    <title>useELObject</title>
</head>
<body>
<c:out value="Hellow World"/> <br>
request URI: ${pageContext.request.requestURI} <br>
request name: ${requestScope.name} <br>
code parameter: ${param.code} <br>
</body>
</html>
