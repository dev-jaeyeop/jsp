<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오후 5:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<%
    String idx = request.getParameter("idx");
    DataAccessObject guestBook = new DataAccessObject();

    if (!idx.equals("")) {
        guestBook.delete(idx);
        guestBook.deleteReply(idx);
%>
<script>
    alert("success");
    location = 'view.jsp';
</script>
<%
} else {
%>
<script>
    alert("error");
    location = 'reply.jsp';
</script>
<%
    }
%>
</body>
</html>
