<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>mainLoginPage</title>
</head>
<body>
<form action="subLoginPage.jsp">
    <table>
        <%
            if (session.getAttribute("id") == null) {
        %>
        <tr>
            <td>
                id
            </td>
            <td>
                <input type="text" name="id">
            </td>
        </tr>
        <tr>
            <td>
                password
            </td>
            <td>
                <input type="password" name="password">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="login">
            </td>
        </tr>
        <%
        } else {
        %>
        <tr>
            <td>
                <%="Welcome " + session.getAttribute("id") + "!"%>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="changeAccountPage" onclick="location='changeAccountPage.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="cartPage" onclick="location='cartPage.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="mailPage" onclick="location='mailPage.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="logout" onclick="location='logoutPage.jsp'">
            </td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
