<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginSubPage</title>
    <style>
        table, td {
            text-align: center;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    String id = "";
    String password = "";
    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("id") && cookies[i].getValue().equals(request.getParameter("id"))) {
                id = cookies[i].getValue();
            }
            if (cookies[i].getName().equals("password") && cookies[i].getValue().equals(request.getParameter("password"))) {
                password = cookies[i].getValue();
            }
        }
        if (!id.equals("") && !password.equals("")) {
%>
<table>
    <tr>
        <td colspan="2">
            <%="Welcome " + id%>
        </td>
    </tr>
    <tr>
        <td>
            <input type="button" value="information change" onclick="location='informationChangeMainPage.jsp'">
        </td>
        <td>
            <input type="button" value="delete account" onclick="location='deleteAccountMainPage.jsp'">
        </td>
    </tr>
</table>

<%
} else {
%>
error
<input type="button" value="previous page" onclick="location='loginMainPage.jsp'">
<input type="button" value="create account" onclick="location='joinMainPage.jsp'">
<%
        }
    }
%>
</body>
</html>
