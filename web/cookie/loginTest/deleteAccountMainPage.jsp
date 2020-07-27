<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleteAccountPage</title>
</head>
<body>
<form action="deleteAccountSubPage.jsp">
    <table>
        <tr>
            <td>id</td>
            <td>
                <input type="text" name="id">
            </td>
        </tr>
        <tr>
            <td>password</td>
            <td>
                <input type="password" name="password">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="delete account">
            </td>
        </tr>
    </table>
</form>
</body>
</html>