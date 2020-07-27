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
    <title>joinMainPage</title>
    <style>
        table {
            border: 1px solid black;
        }

        td {
            text-align: center;
        }
    </style>
</head>
<form action="joinSubPage.jsp">
    <body>
    <table>
        <tr>
            <td colspan="2">
                join
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
            <td>email</td>
            <td><input type="email" name="email"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="sign up"></td>
        </tr>
    </table>
    </body>
</form>
</html>
