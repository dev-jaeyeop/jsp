<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" scope="request" class="beanTest.UseBeanTest"/>
<html>
<head>
    <title>sub</title>
</head>
<body>
name:
<jsp:getProperty name="bean" property="name"/>
<br>
age:
<jsp:getProperty name="bean" property="age"/>
<br>
isMarried:
<jsp:getProperty name="bean" property="married"/>
<br>
</body>
</html>
