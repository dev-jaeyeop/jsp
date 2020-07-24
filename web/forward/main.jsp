<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
main
<%--<jsp:forward page="sub.jsp?value=????"/>--%>
<jsp:forward page="sub.jsp">
    <jsp:param value="????" name="value"/>
</jsp:forward>
<%--<script>--%>
<%--    location.href = "sub.jsp?value=????";--%>
<%--</script>--%>
</body>
</html>
