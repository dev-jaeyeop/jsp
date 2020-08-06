<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오전 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<html>
<head>
    <title>updateProcess</title>
</head>
<body>
<%
    String text = request.getParameter("text");
    String idx = request.getParameter("idx");

    DataAccessObject guestBook = new DataAccessObject();

    if (!idx.equals("")) {
        guestBook.update(text, idx);
%>
<script>
    alert("success");
    location = 'reply.jsp?idx=<%=idx%>';
</script>
<%
} else {
%>
<script>
    alert("error");
    location = 'reply.jsp?idx=<%=idx%>';
</script>
<%
    }
%>
</body>
</html>
