<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-22
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        div:nth-child(even) {
            color: red;
        }

        div:nth-child(odd) {
            color: blue;
        }
    </style>
</head>
<body>
<%
    request.getParameter("boom");
%>
<%
    for (int i = 2; i < 10; i++) {
        for (int j = 1; j < 10; j++) {
%>
<div>
    <%=i + " * " + j + " = " + i * j%>
</div>
<%
    }
%>
<br>
<%
    }
%>
</body>
</html>
