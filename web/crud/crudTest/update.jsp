<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="crudTest.DataAccessObject" %>
<%@ page import="crudTest.DataTransferObject" %>
<html>
<head>
    <title>update</title>
    <style>
        table, td {
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");

    DataAccessObject user = new DataAccessObject();
    DataTransferObject findUser = user.find(id);
%>
<form action="updateProcess.jsp">
    <table>
        <tr>
            <td colspan="2">
                UPDATE
            </td>
        </tr>
        <tr>
            <td>
                ID
            </td>
            <td>
                <input type="text" name="id" value="<%=findUser.getId()%>">
            </td>
        </tr>
        <tr>
            <td>
                PASSWORD
            </td>
            <td>
                <input type="text" name="password" value="<%=findUser.getPassword()%>">
            </td>
        </tr>
        <tr>
            <td>
                NAME
            </td>
            <td>
                <input type="text" name="name" value="<%=findUser.getName()%>">
            </td>
        </tr>
        <tr>
            <td>
                E-MAIL
            </td>
            <td>
                <input type="email" name="email" value="<%=findUser.getEmail()%>">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="update">
            </td>
        </tr>
        <input type="hidden" name="oid" value="<%=id%>">
    </table>
</form>
</body>
</html>


