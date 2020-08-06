<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-03
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestBook.DataAccessObject" %>
<%@ page import="guestBook.DataTransferObject" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>reply</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }

        td {
            width: 70px;
            word-break: break-all;
        }

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
    ArrayList<DataTransferObject> replys = guestBook.selectReply(idx);
%>
<form action="replyProcess.jsp">
    <table>
        <tr>
            <td colspan="4">
                reply
            </td>
        </tr>
        <tr>
            <td>
                name
            </td>
            <td colspan="3">
                <%=findGuestBook.getName()%>
            </td>
        </tr>
        <tr>
            <td>
                date
            </td>
            <td colspan="3">
                <%=findGuestBook.getDate()%>
            </td>
        </tr>
        <tr>
            <td>
                content
            </td>
            <td colspan="3">
                <%=findGuestBook.getText()%>
            </td>
        </tr>
        <tr>
            <td>
                reply
            </td>
            <td colspan="3">
                <%
                    if (replys != null) {
                        for (int i = 0; i < replys.size(); i++) {
                %>
                <%=replys.get(i).getReply()%><br>
                <%
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <input type="hidden" name="idx" value="<%=findGuestBook.getIdx()%>">
                <textarea name="reply" cols="30" rows="10"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="reply">
            </td>
            <td>
                <input type="button" value="view" onclick="location='view.jsp'">
            </td>
            <td>
                <input type="button" value="update" onclick="location='update.jsp?idx=<%=idx%>'">
            </td>
            <td>
                <input type="button" value="delete" onclick="location='delete.jsp?idx=<%=idx%>'">
            </td>
        </tr>
    </table>
</form>
</form>
</body>
</html>
