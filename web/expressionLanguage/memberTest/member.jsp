<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-29
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="ELTest.Member" %>
<%
    Member m = new Member();
    m.setName("name1");
%>
<c:set var="m" value="<%=m%>%>"/>
<c:set var="name" value="${m.name}"/>
<%=m.setName("name2")%>
<html>
<head>
    <title>member</title>
</head>
<body>
${name}
</body>
</html>
