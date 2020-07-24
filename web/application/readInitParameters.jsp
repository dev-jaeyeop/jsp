<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-23
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read Init Parameters</title>
</head>
<body>
list:
<ul>
    <%

//        init parameters => WEB-INF/web.xml
//        <context-param>
//        <param-name></param-name>
//        <param-value></param-value>
//        </context-param>
        Enumeration<String> initParamEnum = application.getInitParameterNames();
        while (initParamEnum.hasMoreElements()) {
            String initParamName = initParamEnum.nextElement();
    %>
    <li>
        <%=initParamName%> =
        <%=application.getInitParameter(initParamName)%>
        <%
            }
        %>
    </li>
</ul>
</body>
</html>
