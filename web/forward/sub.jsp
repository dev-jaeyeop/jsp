<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
sub
<%
    String value = request.getParameter("value");
%>
<%=value%>
</body>
</html>
