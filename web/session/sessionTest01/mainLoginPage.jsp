<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sessionMainPage</title>
</head>
<body>
<%
    if (session.getAttribute("id") == null) {
%>
<form action="subLoginPage.jsp" method="post">
    <table>
        <tr>
            <td>
                id: <input type="text" name="id"> <br>

            </td>
        </tr>
        <tr>
            <td>
                password: <input type="password" name="password"> <br>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="login"> <br>
            </td>
        </tr>
    </table>
</form>
<%
} else {
%>
<%="Welcome " + session.getAttribute("id") + "!"%>
<a href="logoutPage.jsp">logout</a>
<%
    }

%>
</body>
</html>
