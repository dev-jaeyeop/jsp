<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String img = request.getParameter("img");
    if (img != null) {
        Cookie cookie = new Cookie(img, img);
        response.addCookie(cookie);
    }
%>
<html>
<head>
    <title>view</title>
</head>
<body>
<div class="wrap">
    <img src=<%=img%> alt="">
    <input type="button" value="prev" onclick="location.href='savePictureTest.jsp'">
</div>
</body>
</html>
