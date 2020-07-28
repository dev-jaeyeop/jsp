<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Date time = new Date();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head>
    <title>sessionInfo</title>
</head>
<body>
session.getId(): <%=session.getId()%> <br>
<%
    time.setTime(session.getCreationTime());
%>
session.getCreationTime(): <%=simpleDateFormat.format(time)%> <br>
<%
    time.setTime(session.getLastAccessedTime());
%>
session.getLastAccessedTime(): <%=simpleDateFormat.format(time)%> <br>
</body>
</html>
