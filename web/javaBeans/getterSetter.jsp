<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" scope="request" class="beanTest.UseBeanTest"/>
<%
    bean.setName("name");
    bean.setAge(24);
    bean.setMarried(false);
%>
<html>
<head>
    <title>getterSetter</title>
</head>
<body>
name: <%=bean.getName()%> <br>
age: <%=bean.getAge()%> <br>
isMarried: <%=bean.isMarried()%> <br>
</body>
</html>
