<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-22
  Time: 오후 2:11
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
    <title>sub</title>
</head>
<body>
subPage <br>
<%
    Map<String, String[]> map = request.getParameterMap();
    String id = map.get("id")[0];
    String pw = map.get("pw")[0];
    String gender = map.get("gender")[0];
    String[] hobbies = map.get("hobby");
%>
<%="id: " + id%><br>
<%="pw: " + pw%><br>
<%="gender: " + gender%><br>
<%="hobby: "%>
<%
    for (String hobby : hobbies) {%>
<%=hobby + " "%>
<%
    }
%>
</body>
</html>
