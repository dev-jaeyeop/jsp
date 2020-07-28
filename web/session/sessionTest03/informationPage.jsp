<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sessionTest.MemberInfo" %>
<%
    MemberInfo memberInfo = (MemberInfo) session.getAttribute("user");
%>
<html>
<head>
    <title>informationPage</title>
    <style>
        table, td {
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td colspan="2">
            information
        </td>
    </tr>
    <tr>
        <td>
            id
        </td>
        <td>
            <%=memberInfo.getId()%>
        </td>
    </tr>
    <tr>
        <td>
            password
        </td>
        <td>
            <%=memberInfo.getPassword()%>
        </td>
    </tr>
    <tr>
        <td>
            email
        </td>
        <td>
            <%=memberInfo.getEmail()%>
        </td>
    </tr>
</table>
</body>
</html>
