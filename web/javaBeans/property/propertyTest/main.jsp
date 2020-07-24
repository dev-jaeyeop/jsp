<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" scope="request" class="beanTest.UseBeanTest"/>

<jsp:setProperty name="bean" property="name" value="name"/>
<jsp:setProperty name="bean" property="age" value="25"/>
<jsp:setProperty name="bean" property="married" value="false"/>
<html>
<head>
    <title>main</title>
</head>
<body>
<jsp:forward page="sub.jsp"></jsp:forward>
</body>
</html>
