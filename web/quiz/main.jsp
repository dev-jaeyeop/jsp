<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-22
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
    </style>
</head>
<body>
<form action="sub.jsp">
    <div id="wrap">
        question: <input type="text" name="question"> <br>
        1. <input type="text" name="example01"><input type="radio" name="example" value="answer"> <br>
        2. <input type="text" name="example02"><input type="radio" name="example" value="wrong"> <br>
        3. <input type="text" name="example03"><input type="radio" name="example" value="wrong"> <br>
        4. <input type="text" name="example04"><input type="radio" name="example" value="wrong"> <br>
        파일 <input type="text" name="filePath"> <br>
        <input type="submit" value="ok">
    </div>
</form>
</body>
</html>
