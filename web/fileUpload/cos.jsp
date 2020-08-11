<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-11
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String text1 = "";
    String fileName1 = "";
    String fileName2 = "";
    String originFileName1 = "";
    String originFileName2 = "";

    String path = request.getSession().getServletContext().getRealPath("fileUpload/upload");
    int maxSize = 1024 * 1024 * 10; // 10MB
    String encoding = "utf-8";

    MultipartRequest multipartRequest = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());

    text1 = multipartRequest.getParameter("text1");

    out.print(text1 + "<br>");
    fileName1 = multipartRequest.getFilesystemName("file1");
    fileName2 = multipartRequest.getFilesystemName("file2");
    originFileName1 = multipartRequest.getOriginalFileName("file1");
    originFileName2 = multipartRequest.getOriginalFileName("file2");

    out.print("fileName1: " + fileName1 + "<br>");
    out.print("fileName2: " + fileName2 + "<br>");
    out.print("originFileName1: " + originFileName1 + "<br>");
    out.print("originFileName2: " + originFileName2 + "<br>");
%>
</body>
</html>
