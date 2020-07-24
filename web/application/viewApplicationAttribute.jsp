<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오전 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Enumeration<String> attrEnum = application.getAttributeNames();
    while (attrEnum.hasMoreElements()) {
        String name = attrEnum.nextElement();
        Object value = application.getAttribute(name);
%>
application attribute: <b><%=name%>
</b>: <%=value%> <br>
<%
    }
%>
</body>
</html>
