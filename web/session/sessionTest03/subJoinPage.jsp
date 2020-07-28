<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" class="sessionTest.MemberInfo"/>

<html>
<head>
    <title>subJoinPage</title>
</head>
<body>
<%
    if (!request.getParameter("id").equals("") && !request.getParameter("password").equals("") && !request.getParameter("email").equals("")) {
%>
<jsp:setProperty name="bean" property="*"/>
<%
    session.setAttribute("user", bean);
%>
<script>
    alert("success!");
    location = 'informationPage.jsp';
</script>
<%
} else {
%>
<script>
    alert("error!");
    location = 'mainJoinPage.jsp';
</script>
<%
    }
%>
</body>
</html>
