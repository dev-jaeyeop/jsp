<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-07
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pagingTest.DataAccessObject" %>
<%@ page import="pagingTest.DataTransferObject" %>
<html>
<head>
    <title>paging</title>
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
    String pageIdx = "1";
    if (request.getParameter("pageIdx") != null) {
        pageIdx = request.getParameter("pageIdx");
    }

    DataAccessObject dataAccessObject = new DataAccessObject();
    ArrayList<DataTransferObject> users = dataAccessObject.select(pageIdx);
    int totalPage = dataAccessObject.getTotalPage();
    int prev = Integer.parseInt(pageIdx) - 1;
    int next = Integer.parseInt(pageIdx) + 1;
%>
<table>
    <tr>
        <td>
            no
        </td>
        <td>
            id
        </td>
    </tr>
    <%
        for (int i = 0; i < users.size(); i++) {
    %>
    <tr>
        <td>
            <%=users.get(i).getIdx()%>
        </td>
        <td>
            <%=users.get(i).getId()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
<a href="pagingTest.jsp?pageIdx=1">first</a>
<%
    if (Integer.parseInt(pageIdx) == 1) {
        prev++;
    }
%>
<a href="pagingTest.jsp?pageIdx=<%=prev%>">prev</a>
<%
    for (int i = 1; i <= totalPage; i++) {
%>
<a href="pagingTest.jsp?pageIdx=<%=i%>">
    [<%=i%>]
    <%
        }
    %>
</a>
<%
    if (Integer.parseInt(pageIdx) == totalPage) {
        next--;
    }
%>
<a href="pagingTest.jsp?pageIdx=<%=next%>">next</a>
<a href="pagingTest.jsp?pageIdx=<%=totalPage%>">last</a>
</body>
</html>
