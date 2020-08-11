<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-11
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>multipartUpload</title>
</head>
<body>
<%=request.getSession().getServletContext().getRealPath("fileUpload/upload")%> <br>
<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    File folder = new File("/tmp");
    int maxFileSize = 1024 * 1024 * 10; // 10MB
    int maxMemorySize = 1024 * 1024; // 1MB

    if (isMultipart) {
//        DiskFileUpload diskFileUpload = new DiskFileUpload();
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        diskFileItemFactory.setSizeThreshold(maxMemorySize); // set max memory size
        diskFileItemFactory.setRepository(folder);

        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setFileSizeMax(maxFileSize); // set max file size

        List<FileItem> items = servletFileUpload.parseRequest(request); // parsing
        Iterator<FileItem> itemIterator = items.iterator();

        while (itemIterator.hasNext()) {
            FileItem fileItem = itemIterator.next();

            if (fileItem.isFormField()) { // input type == ex) text, hidden etc..
                out.print("input type is not file: " + fileItem.getFieldName() + "<br>");
            } else { // input type is 'file' ?
                out.print("input type is file name: " + fileItem.getFieldName() + " size: " + fileItem.getSize() + "<br>");
                if (0 < fileItem.getSize()) {
                    int idx = fileItem.getName().lastIndexOf("\\");
                    if (idx == -1) {
                        idx = fileItem.getName().lastIndexOf("/");
                    }
                    String fileName = fileItem.getName().substring(idx + 1);
                    String path = request.getServletContext().getRealPath("fileUpload/upload");
                    File file = new File(path, fileName);
                    fileItem.write(file);
                }
            }
        }
    } else {
        out.print("not multipart");
    }
%>
</body>
</html>
