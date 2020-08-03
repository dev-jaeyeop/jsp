<%@ page import="guestBook.DataAccessObject" %>
<%@ page import="guestBook.DataTransferObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Array" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>replyProcess</title>
</head>
<body>
<%
    String idx = request.getParameter("idx");
    String reply = request.getParameter("reply");

    DataAccessObject dataAccessObject = new DataAccessObject();
    dataAccessObject.insertReply(idx, "ㄴ" + reply);
%>
<script>
    alert("success");
    location = 'view.jsp';
</script>
</body>
</html>
