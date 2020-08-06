<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<html>
<head>
    <title>replyProcess</title>
</head>
<body>
<%
    String idx = request.getParameter("idx");
    String reply = request.getParameter("reply");

    DataAccessObject guestBook = new DataAccessObject();
    if (!reply.equals("")) {
        guestBook.insertReply(idx, "ㄴ" + reply);
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
    location = 'view.jsp';
</script>
<%
    }
%>

</body>
</html>
