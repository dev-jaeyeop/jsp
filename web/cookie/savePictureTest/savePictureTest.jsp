<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
    <style>
        td {
            border: 1px solid black;
            width: 50px;
            height: 50px;
        }

        td img {
            width: 100px;
            height: 100px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<form action="viewSavePictureTest.jsp">
    <table>
        <tr>
            <td>
                <a href="viewSavePictureTest.jsp?img=calcifer1.jpg">
                    <img src="calcifer1.jpg" alt="">
                </a>
            </td>
            <td>
                picture1
            </td>
        </tr>
        <tr>
            <td>
                <a href="viewSavePictureTest.jsp?img=calcifer2.jpg">
                    <img src="calcifer2.jpg" alt="">
                </a>
            </td>
            <td>
                picture2
            </td>
        </tr>
        <tr>
            <td>
                <a href="viewSavePictureTest.jsp?img=calcifer3.jpg">
                    <img src="calcifer3.jpg" alt="">
                </a>
            </td>
            <td>
                picture3
            </td>
        </tr>
        <tr>
            <td colspan="2">
                cookie!!
            </td>
        </tr>
        <tr>
            <%
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length > 0) {
                    for (int i = 0; i < cookies.length; i++) {
                        if (cookies[i].getName().indexOf("calcifer") != -1) {
            %>
            <td>
                <img src=<%=cookies[i].getValue()%> alt="">
            </td>
            <%
                        }
                    }
                }
            %>
        </tr>
    </table>
</form>
</body>
</html>
