<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>informationChangePage</title>
</head>
<body>
<form action="informationChangeSubPage.jsp">
    <%
        String id = "";
        String password = "";
        String email = "";
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            switch (cookies[i].getName()) {
                case "id":
                    id = cookies[i].getValue();
                    break;
                case "password":
                    password = cookies[i].getValue();
                    break;
                case "email":
                    email = cookies[i].getValue();
                    break;
            }
        }
    %>
    <table>
        <tr>
            <td>id</td>
            <td>
                <input type="text" name="id" value="<%=id%>">
            </td>
        </tr>
        <tr>
            <td>password</td>
            <td>
                <input type="text" name="password" value="<%=password%>">
            </td>
        </tr>
        <tr>
            <td>email</td>
            <td>
                <input type="email" name="email" value="<%=email%>">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="informationChange">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
