<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create your account</title>
</head>
<body>
<form action="processJoining.jsp" method="post">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>id</td>
            <td><input type="text" name="id" size="10"></td>
        </tr>
        <tr>
            <td>name</td>
            <td><input type="text" name="name" size="10"></td>
        </tr>
        <tr>
            <td>email</td>
            <td><input type="email" name="email" size="10"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Create account">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
