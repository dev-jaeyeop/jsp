<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>joinSubPage</title>
</head>
<body>
<%
    if (!request.getParameter("id").equals("") && !request.getParameter("password").equals("") && !request.getParameter("email").equals("")) {
        response.addCookie(new Cookie("id", request.getParameter("id")));
        response.addCookie(new Cookie("password", request.getParameter("password")));
        response.addCookie(new Cookie("email", request.getParameter("email")));
%>
success<br><br>
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<%
} else {
%>
error
<input type="button" value="previous page" onclick="location='joinMainPage.jsp'">
<%
    }
%>
</body>
</html>
