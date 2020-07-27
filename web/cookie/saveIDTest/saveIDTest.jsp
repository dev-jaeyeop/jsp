<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>saveID</title>
    <style>
        td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<form action="viewSaveIDTest.jsp">
    <table>
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
                <input type="checkbox" name="saveID">
            </td>
            <td>
                saveID
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="login">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
