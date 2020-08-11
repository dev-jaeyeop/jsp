<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오후 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="crudTest.DataAccessObject" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<%
    String id = request.getParameter("id");

    DataAccessObject dataAccessObject = new DataAccessObject();
    dataAccessObject.delete(id);
%>
<script>
    alert("success");
    location.href = 'view.jsp';
</script>
</body>
</html>

