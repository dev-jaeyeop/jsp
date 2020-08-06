<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>
<%session.invalidate();%>
<script>
    alert("success");
    location.href = 'login.jsp';
</script>
</body>
</html>
