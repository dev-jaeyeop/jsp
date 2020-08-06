<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="joinTest.DataAccessObject" %>
<html>
<head>
    <title>insertProcess</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    DataAccessObject user = new DataAccessObject();

    if (!id.equals("") && !password.equals("") && !name.equals("")) {
        user.insert(id, password, name);
%>
<script>
    alert("success");
    location.href = 'view.jsp';
</script>
<%
} else {
%>
<script>
    alert("error");
    location.href = 'insert.jsp';
</script>
<%
    }
%>
</body>
</html>
