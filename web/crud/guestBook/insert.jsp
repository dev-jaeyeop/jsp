<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오전 10:46
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

        textarea {
            width: 100%;
        }
    </style>
</head>
<body>
<form action="insertProcess.jsp">
    <table>
        <tr>
            <td colspan="2">
                guest book
            </td>
        </tr>
        <tr>
            <td>
                name
            </td>
            <td>
                <input type="text" name="name" maxlength="10">
            </td>
        </tr>
        <tr>
            <td>
                password
            </td>
            <td>
                <input type="password" name="password" maxlength="10">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                text
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea name="text" cols="30" rows="10"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="write">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
