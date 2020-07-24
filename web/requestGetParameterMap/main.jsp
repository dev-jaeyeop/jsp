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
    <title>main</title>
</head>
<body>
mainPage <br>
<form action="sub.jsp">
    id:
    <input type="text" name="id"><br>
    pw:
    <input type="text" name="pw"><br>
    gender:
    <input type="radio" name="gender" value="male">male
    <input type="radio" name="gender" value="female">female<br>
    hobby:
    <input type="checkbox" name="hobby" value="a">a
    <input type="checkbox" name="hobby" value="b">b
    <input type="checkbox" name="hobby" value="c">c<br>
    <input type="submit" value="login">
</form>
</body>
</html>
