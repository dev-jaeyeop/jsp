<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sessionPage</title>
</head>
<body>
<%
    if (session.getAttribute("id") == null) {
%>
<script>
    alert("error!");
    location = 'mainLoginPage.jsp';
</script>
<%
    }
%>
</body>
</html>
