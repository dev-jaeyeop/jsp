<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dbId = "aaa";
    String dbPassword = "1234";

    String id = request.getParameter("id");
    String password = request.getParameter("password");
%>
<html>
<head>
    <title>subLoginPage</title>
</head>
<body>
<%
    if (dbId.equals(id) && dbPassword.equals(password)) {
        session.setAttribute("id", id);
%>
<%="Welcome " + id + "!"%>
<input type="button" value="mainPage" onclick="location='mainLoginPage.jsp';">
<%
} else {
%>
<script>
    alert("error!")
    location='mainLoginPage.jsp';
</script>
<%
    }
%>
</body>
</html>
