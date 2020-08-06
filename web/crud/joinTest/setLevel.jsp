<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="joinTest.DataAccessObject" %>
<html>
<head>
    <title>levelProcess</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String level = request.getParameter("level");

    DataAccessObject dataAccessObject = new DataAccessObject();

    if (!id.equals("") && !level.equals("") && dataAccessObject.setLevel(id, Integer.parseInt(level)) > 0) {
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
    location.href = 'view.jsp';
</script>
<%
    }
%>
</body>
</html>
