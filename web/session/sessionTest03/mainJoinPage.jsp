<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-28
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>mainJoinPage</title>
    <style>
        table, td {
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<form action="subJoinPage.jsp">
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
                email
            </td>
            <td>
                <input type="email" name="email">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="join">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
