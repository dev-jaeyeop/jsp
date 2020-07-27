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
<%
    String id = "";
    String password = "";
    String email = "";
    Cookie[] cookies = request.getCookies();

    for (int i = 0; i < cookies.length; i++) {
        String[] userInfo = cookies[i].getValue().split("/");
        if (cookies[i].getName().equals(request.getParameter("id"))) {
            id = cookies[i].getName();
            password = userInfo[0];
            email = userInfo[1];
        }
    }
%>
<form action="informationChangeSubPage.jsp">
    <table>
        <tr>
            <input type="hidden" name="id" value="<%=id%>">
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
                <input type="submit" value="information change">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
