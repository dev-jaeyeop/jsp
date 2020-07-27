<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginMainPage</title>
    <style>
        table {
            border: 1px solid black;
        }

        td {
            text-align: center;
        }
    </style>
</head>
<form action="loginSubPage.jsp">
    <body>
    <table>
        <tr>
            <td colspan="2">
                Sign in
            </td>
        </tr>
        <tr>
            <td>id</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>password</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td>
                <input type="button" value="create account" onclick="location='joinMainPage.jsp'">
            </td>
            <td>
                <input type="submit" value="login">
            </td>
        </tr>
    </table>
    </body>
</form>
</html>
