<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="crudTest.DataAccessObject" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    DataAccessObject dataAccessObject = new DataAccessObject();
    dataAccessObject.insert(id, password, name, email);
%>
<script>
    alert("success")
    location.href = 'view.jsp';
</script>
</body>
</html>
