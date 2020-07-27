<%--
Created by IntelliJ IDEA.
User: user
Date: 2020-07-27
Time: 오후 1:38
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginSubPage</title>
</head>
<body>
<table>
    <tr>
        <td colspan="2">
            <%
                Cookie[] cookies = request.getCookies();

                if (cookies != null && cookies.length > 0) {
                    for (int i = 0; i < cookies.length; i++) {
                        String[] userInfo = cookies[i].getValue().split("/");
                        String id = cookies[i].getName();
                        String password = userInfo[0];
                        if (id.equals(request.getParameter("id")) && password.equals(request.getParameter("password"))) {
            %>
            <%="Welcome " + id%>
        </td>
    <tr>
    <tr>
        <td>
            <input type="button" value="information change"
                   onclick="location='informationChangeMainPage.jsp?id=<%=id%>'">
        </td>
        <td>
            <input type="button" value="delete account" onclick="location='deleteAccountMainPage.jsp?id=<%=id%>'">
        </td>
    </tr>
</table>
<%
    break;
} else {
%>
error! <br><br>
<input type="button" value="login page" onclick="location='loginMainPage.jsp'">
<input type="button" value="create account" onclick="location='joinMainPage.jsp'">
<%
                break;
            }
        }
    }
%>
</body>
</html>
