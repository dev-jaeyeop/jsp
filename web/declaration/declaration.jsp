<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-23
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Declaration</title>
</head>
<body>
    10 * 25 = <%=multiply(10, 25)%>
</body>
</html>
<%!
    public int multiply(int a, int b) {
        int c = a * b;
        return c;
    }
%>
