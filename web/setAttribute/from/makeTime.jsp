<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>setAttribute</title>
</head>
<body>
<%
    Calendar calendar = Calendar.getInstance();
    request.setAttribute("time", calendar);
%>
<jsp:forward page="/setAttribute/to/viewTime.jsp"></jsp:forward>
</body>
</html>
