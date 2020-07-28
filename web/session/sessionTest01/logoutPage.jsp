<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logoutPage</title>
</head>
<body>
<%
    session.invalidate();
%>
<script>
    alert("logout!")
    location.href = 'mainLoginPage.jsp'
</script>
</body>
</html>
