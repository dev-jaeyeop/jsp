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

        textarea {
            width: 100%;
        }
    </style>
</head>
<body>
<%
    String idx = request.getParameter("idx");
    DataAccessObject dataAccessObject = new DataAccessObject();
    DataTransferObject findUser = dataAccessObject.find(idx);
    ArrayList<DataTransferObject> replyList = dataAccessObject.selectReply(idx);
%>
<form action="replyProcess.jsp">
    <table>
        <tr>
            <td colspan="3">
                reply
            </td>
        </tr>
        <tr>
            <td>
                name
            </td>
            <td colspan="2">
                <%=findUser.getName()%>
            </td>
        </tr>
        <tr>
            <td>
                date
            </td>
            <td colspan="2">
                <%=findUser.getDate()%>
            </td>
        </tr>
        <tr>
            <td>
                content
            </td>
            <td colspan="2">
                <%=findUser.getText()%>
            </td>
        </tr>
        <tr>
            <td>
                reply
            </td>
            <td colspan="2">
                <%
                    if (replyList != null) {
                        for (int i = 0; i < replyList.size(); i++) {
                %>
                <%=replyList.get(i).getReply()%><br>
                <%
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="hidden" name="idx" value="<%=findUser.getIdx()%>">
                <textarea name="reply" cols="30" rows="10"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="view" onclick="location='view.jsp'">
            </td>
            <td>
                <input type="submit" value="reply">
            </td>
            <td>
                <input type="button" value="delete" onclick="location='delete.jsp'">
            </td>
        </tr>
    </table>
</form>
</form>
</body>
</html>
