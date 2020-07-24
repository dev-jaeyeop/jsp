<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberInfo" class="beanTest.MemberInfoTest"/>
<jsp:setProperty name="memberInfo" property="*"/>
<jsp:setProperty name="memberInfo" property="password" value="<%=memberInfo.getId()%>"/>
<html>
<head>
    <title>Member Info</title>
</head>
<body>
<table width="400px" border="1px" cellpadding="0" cellspacing="0">
    <tr>
        <td>id</td>
        <td>
            <jsp:getProperty name="memberInfo" property="id"/>
        </td>
    </tr>
    <tr>
        <td>password</td>
        <td>
            <jsp:getProperty name="memberInfo" property="password"/>
        </td>
    </tr>
    <tr>
        <td>name</td>
        <td>
            <jsp:getProperty name="memberInfo" property="name"/>
        </td>
    </tr>
    <tr>
        <td>email</td>
        <td>
            <jsp:getProperty name="memberInfo" property="email"/>
        </td>
    </tr>
</table>
</body>
</html>
