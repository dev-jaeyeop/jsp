<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insert</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<form action="insertProcess.jsp">
    <table>
        <tr>
            <td colspan="2">
                join
            </td>
        </tr>
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
                name
            </td>
            <td>
                <input type="text" name="name">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="login" onclick="location='login.jsp'">
            </td>
            <td>
                <input type="submit" value="join">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
