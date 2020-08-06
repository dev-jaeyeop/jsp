<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<%@ page import="guestBook.DataTransferObject" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>view</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td colspan="3">
            guest book
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>
            name
        </td>
        <td>
            date
        </td>
    </tr>
    <%
        DataAccessObject guestBook = new DataAccessObject();

        ArrayList<DataTransferObject> guestBooks = guestBook.select();

        for (int i = 0; i < guestBooks.size(); i++) {
    %>
    <tr>
        <td>
            <%=i + 1%>
        </td>
        <td>
            <a href="reply.jsp?idx=<%=guestBooks.get(i).getIdx()%>">
                <%=guestBooks.get(i).getName()%>
            </a>
        </td>
        <td>
            <%=guestBooks.get(i).getDate()%>
        </td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="3">
            <input type="button" value="insert" onclick="location='insert.jsp'">
        </td>
    </tr>
</table>
</body>
</html>
