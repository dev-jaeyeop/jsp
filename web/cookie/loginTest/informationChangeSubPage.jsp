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
            if (cookies[i].getName().equals(request.getParameter("id"))) {
                String[] userInfo = cookies[i].getValue().split("/");
                userInfo[0] = request.getParameter("password");
                userInfo[1] = request.getParameter("email");
                String updateInfo = "";
                for (int j = 0; j < userInfo.length; j++) {
                    updateInfo += userInfo[j] + "/";
                }
                response.addCookie(new Cookie(cookies[i].getName(), updateInfo));
            }
        }
%>
success! <br><br>
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<%
    }
%>
</body>
</html>
