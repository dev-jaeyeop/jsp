<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-11
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>multipartForm</title>
</head>
<body>
<form action="multipartUpload.jsp" method="post" enctype="multipart/form-data">
    text1: <input type="text" name="text1"> <br>
    file1: <input type="file" name="file1"> <br>
    file2: <input type="file" name="file2"> <br>
    <input type="submit" value="전송">
</form>
</body>
</html>
