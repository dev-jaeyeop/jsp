<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-04
  Time: 오전 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<%@ page import="guestBook.DataTransferObject" %>
<html>
<head>
    <title>update</title>
    <style>
        textarea {
            width: 100%;
        }
    </style>
</head>
<body>
<%
    String idx = request.getParameter("idx");

    DataAccessObject guestBook = new DataAccessObject();

    DataTransferObject findGuestBook = guestBook.find(idx);
%>
<form action="updateProcess.jsp">
    <table>
        <tr>
            <td>
                <textarea name="text" cols="30" rows="10"><%=findGuestBook.getText()%></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="idx" value="<%=idx%>">
                <input type="submit" value="save">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
