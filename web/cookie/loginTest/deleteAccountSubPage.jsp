<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleteAccountSubPage</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    Cookie existId = null;
    Cookie existPassword = null;

    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("id") || cookies[i].getName().equals("password") || cookies[i].getName().equals("email")) {
                Cookie cookie = new Cookie(cookies[i].getName(), cookies[i].getValue());
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
%>
success!
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<%
} else {
%>
error!
<input type="button" value="previous page" onclick="location='deleteAccountMainPage.jsp'">
<%
    }
%>
</body>
</html>
