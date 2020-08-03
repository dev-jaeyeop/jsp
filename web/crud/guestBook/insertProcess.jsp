<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String text = request.getParameter("text");

    if (name != null && password != null && text != null) {
        DataAccessObject guestBook = new DataAccessObject();
        guestBook.insert(name, password, text);
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
