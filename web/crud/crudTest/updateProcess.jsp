<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오후 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="crudTest.DataAccessObject" %>
<html>
<head>
    <title>updateProcess</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String oid = request.getParameter("oid");

    DataAccessObject dataAccessObject = new DataAccessObject();
    dataAccessObject.update(id, password, name, email, oid);
%>
<script>
    alert("success")
    location.href = 'view.jsp';
</script>
</body>
</html>


