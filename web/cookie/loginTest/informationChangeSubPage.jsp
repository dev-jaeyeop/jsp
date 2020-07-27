<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>informationChangeSubPage</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {
            switch (cookies[i].getName()) {
                case "id":
                    response.addCookie(new Cookie(cookies[i].getName(), request.getParameter("id")));
                    break;
                case "password":
                    response.addCookie(new Cookie(cookies[i].getName(), request.getParameter("password")));
                    break;
                case "email":
                    response.addCookie(new Cookie(cookies[i].getName(), request.getParameter("email")));
                    break;
            }
        }
%>
success!
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<%
    }
%>
</body>
</html>
