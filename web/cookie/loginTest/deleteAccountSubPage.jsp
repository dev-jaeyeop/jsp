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

    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {
            String[] userInfo = cookies[i].getValue().split("/");
            String id = cookies[i].getName();
            String password = userInfo[0];
            if (id.equals(request.getParameter("id")) && password.equals(request.getParameter("password"))) {
                Cookie cookie = new Cookie(cookies[i].getName(), cookies[i].getValue());
                cookie.setMaxAge(0);
                response.addCookie(cookie);
%>
success! <br><br>
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<%
    break;
} else {
%>
error! <br><br>
<input type="button" value="previous page" onclick="location='deleteAccountMainPage.jsp'">
<%
                break;
            }
        }
    }
%>
</body>
</html>
