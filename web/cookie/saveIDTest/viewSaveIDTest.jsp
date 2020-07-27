<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("saveID") != null) {
        Cookie cookie = new Cookie("userID", request.getParameter("id"));
        response.addCookie(cookie);
    }
%>
<html>
<head>
    <title>viewSaveID</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0 && request.getParameter("saveID") != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("userID")) {
%>
<%=cookies[i].getName()%>
<%=cookies[i].getValue()%> <br>
<% }
}
} else {
%>
not found
<%
    }
%>
</body>
</html>
