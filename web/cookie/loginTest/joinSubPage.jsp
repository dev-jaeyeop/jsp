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
        String userInfo = request.getParameter("password") + "/" + request.getParameter("email") + "/";
        response.addCookie(new Cookie(request.getParameter("id"), userInfo));
%>
success! <br><br>
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<%
} else {
%>
error! <br><br>
<input type="button" value="create account" onclick="location='joinMainPage.jsp'">
<%
    }
%>
</body>
</html>
