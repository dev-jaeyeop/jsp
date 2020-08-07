<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-07
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bulletinBoard.DataAccessObject" %>
<%@ page import="bulletinBoard.Member" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>loginPage</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<table>
    <%
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        DataAccessObject dataAccessObject = new DataAccessObject();
        Member member = null;

        // member check
        if (id != null && password != null) {
            member = dataAccessObject.checkID(id);
            if (member != null) {
                session.setAttribute("id", id);
            }
        }
        // login check
        if (session.getAttribute("id") != null) {
            ArrayList<Member> members = dataAccessObject.select();
            for (int i = 0; i < members.size(); i++) {
            }
        } else {
    %>
    <form action="loginPage.jsp" method="post">
        <tr>
            <td colspan="2">
                login
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
            <td colspan="2">
                <input type="button" value="join" onclick="location.href='joinPage.jsp'">
                <input type="submit" value="login">
            </td>
        </tr>
    </form>
    <%
        }
    %>
</table>
</body>
</html>