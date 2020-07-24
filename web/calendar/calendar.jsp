<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Locale" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-22
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calendar</title>
    <style>
        table {
            border: 1px solid black;
        }

        td {
            width: 50px;
            height: 50px;
            border: 1px solid black;
        }

        tr :first-child {
            color: red;
        }

        tr :last-child {
            color: blue;
        }
    </style>
</head>
<body>
<%
    Calendar calendar = Calendar.getInstance();
    int month = calendar.get(Calendar.MONTH);
    if (request.getParameter("month") != null) {
        month = Integer.parseInt(request.getParameter("month"));
    }
    calendar.set(Calendar.MONTH, month - 1);
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMM. yyyy", Locale.ENGLISH);
    int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
    int lastDays = calendar.getActualMaximum(Calendar.DAY_OF_MONTH) + 1;
    int count = 1;
    int num = 1;
%>
<%=simpleDateFormat.format(calendar.getTime())%>
<table>
    <tr>
        <td>Sun</td>
        <td>Mon</td>
        <td>Tue</td>
        <td>Wed</td>
        <td>Thu</td>
        <td>Fri</td>
        <td>Sat</td>
    </tr>
    <%for (int i = 0; i < 5; i++) {%>
    <tr>
        <%for (int j = 0; j < 7; j++) {%>
        <td>
            <%if (firstDayOfWeek <= count && num != lastDays) {%>
            <%=num%>
            <% num++;
            }
                count++;%>
        </td>
        <%}%>
    </tr>
    <%}%>
</table>
<form action="calendar.jsp" name="frm">
    <input type="hidden" name="month" value="<%=month%>">
    <input type="button" value="prev" onclick="prev()">
    <input type="button" value="next" onclick="next()">
</form>
<script>
    function prev() {
        document.frm.month.value = Number(document.frm.month.value) - 1
        document.frm.submit();
    }

    function next() {
        document.frm.month.value = Number(document.frm.month.value) + 1
        document.frm.submit();
        ;
    }
</script>
</body>

</html>