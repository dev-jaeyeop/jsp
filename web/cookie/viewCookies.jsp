<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>viewCookies</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {
%>
<%=cookies[i].getName()%>:
<%=URLDecoder.decode(cookies[i].getValue(), "utf-8")%> <br>
<%
    }
} else {
%>
not found
<%
    }
%>
</body>
</html>
