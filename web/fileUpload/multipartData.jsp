<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-11
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
<head>
    <title>multipartData</title>
</head>
<body>
<%
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
    String str = "";
    while ((str = bufferedReader.readLine()) != null) {
        out.print(str + "<br>");
    }
    bufferedReader.close();
%>
</body>
</html>
