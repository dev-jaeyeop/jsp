<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="joinTest.DataAccessObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="joinTest.DataTransferObject" %>
<html>
<head>
    <title>view</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("id") == null) {
%>
<script>
    alert("error");
    location.href = 'login.jsp';
</script>
<%
    }
    DataAccessObject dataAccessObject = new DataAccessObject();
    if (dataAccessObject.getLevel((String) session.getAttribute("id")) == 10) {
        ArrayList<DataTransferObject> members = dataAccessObject.select();
%>
<table>
    <tr>
        <td colspan="6">
            member list
        </td>
    </tr>
    <tr>
        <td>
            idx
        </td>
        <td>
            id
        </td>
        <td>
            password
        </td>
        <td>
            name
        </td>
        <td>
            level
        </td>
        <td>
            update
        </td>
    </tr>
    <%
        for (int i = 0; i < members.size(); i++) {
    %>
    <tr>
        <td>
            <%=members.get(i).getIdx()%>
        </td>
        <td>
            <%=members.get(i).getId()%>
        </td>
        <td>
            <%= members.get(i).getPassword()%>
        </td>
        <td>
            <%=members.get(i).getName()%>
        </td>
        <form action="setLevel.jsp">
            <td>
                <input type="hidden" name="id" value="<%=members.get(i).getId()%>">
                <input type="text" name="level" value="<%=members.get(i).getLevel()%>">
            </td>
            <td>
                <input type="submit" value="save">
            </td>
        </form>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="7">
            <input type="button" value="login" onclick="location.href='login.jsp'">
        </td>
    </tr>
    <%
    } else {
    %>
    <script>
        alert("error");
        location.href = 'login.jsp'
    </script>
    <%
        }
    %>
</table>

</body>
</html>
