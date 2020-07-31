<%--
 Created by IntelliJ IDEA.
 User: user
 Date: 2020-07-31
 Time: 오전 10:25
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="crudTest.DataAccessObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="crudTest.DataTransferObject" %>
<html>
<head>
    <title>view</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }

        .crud {
            display: flex;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td colspan="3">
            LIST
        </td>
    </tr>
    <tr>
        <td>
            NAME
        </td>
        <td>
            ID
        </td>
        <td>
            E-MAIL
        </td>
    </tr>
    <%
        DataAccessObject dataAccessObject = new DataAccessObject();
        ArrayList<DataTransferObject> dataAccessObjects = dataAccessObject.select();
        for (int i = 0; i < dataAccessObjects.size(); i++) {
    %>
    <tr>
        <td>
            <%=dataAccessObjects.get(i).getId()%>
        </td>
        <td>
            <%=dataAccessObjects.get(i).getName()%>
        </td>
        <td>
            <%=dataAccessObjects.get(i).getEmail()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
<br>
<br>
<br>
<div class="crud">
    <form action="insert.jsp">
        <table>
            <tr>
                <td colspan="2">
                    INSERT
                </td>
            </tr>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    <input type="text" name="id"> <br>
                </td>
            </tr>
            <tr>
                <td>
                    PASSWORD
                </td>
                <td>
                    <input type="password" name="password"> <br>
                </td>
            </tr>
            <tr>
                <td>
                    NAME
                </td>
                <td>
                    <input type="text" name="name"> <br>
                </td>
            </tr>
            <tr>
                <td>
                    E-MAIL
                </td>
                <td>
                    <input type="email" name="email"> <br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="INSERT">
                </td>
            </tr>
        </table>
    </form>
    <form action="delete.jsp">
        <table>
            <tr>
                <td colspan="2">
                    DELETE
                </td>
            </tr>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    <input type="text" name="id">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="DELETE">
                </td>
            </tr>
        </table>
    </form>
    <form action="update.jsp">
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
                    <input type="text" name="id">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="UPDATE">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>