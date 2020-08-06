<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="joinTest.DataAccessObject" %>
<html>
<head>
    <title>login</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }

        table {
            width: 200px;
        }
    </style>
</head>
<body>
<form action="login.jsp">
    <table>
        <tr>
            <td colspan="2">
                login
            </td>
        </tr>
        <%
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            if (id != null && password != null) {
                DataAccessObject member = new DataAccessObject();
                boolean exist = member.find(id, password);

                if (exist)
                    session.setAttribute("id", id);
            }

            if (session.getAttribute("id") == null) {
        %>
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
                <input type="submit" value="login">
            </td>
        </tr>
        <%
        } else {
        %>
        <tr>
            <td colspan="2">
                <%="Hello " + session.getAttribute("id")%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%
                    DataAccessObject dataAccessObject = new DataAccessObject();
                    if (dataAccessObject.getLevel((String) session.getAttribute("id")) == 10) {
                %>
                <input type="button" value="list" onclick="location.href='view.jsp'">
                <%
                    }
                %>
                <input type="button" value="logout" onclick="location.href='logout.jsp'">
            </td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
