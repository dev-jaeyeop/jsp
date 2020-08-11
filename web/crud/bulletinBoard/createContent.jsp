<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-10
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bulletinBoard.dao.ContentDAO" %>
<html>
<head>
    <title>createContent</title>
</head>
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    table, td {
        border-collapse: collapse;
        border: 1px solid black;
        text-align: center;
    }
</style>
<body>
<%
    if (session.getAttribute("id") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = 'loginPage.jsp';
</script>
<%
} else {
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String id = (String) session.getAttribute("id");

    if (title != null && content != null) {
        ContentDAO contentDAO = new ContentDAO();

        if (contentDAO.create(id, title, content) > 0) {
%>
<script>
    location.href = 'loginPage.jsp';
</script>
<%
        }
    }
%>
<form action="createContent.jsp" method="post" name="content" >
    <table>
        <tr>
            <td>
                title
            </td>
            <td>
                <input type="text" name="title">
            </td>
        </tr>
        <tr>
            <td>
                content
            </td>
            <td>
                <textarea name="content" cols="30" rows="10" style="border: none"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="작성완료" onclick="contentFun()">
            </td>
        </tr>
    </table>
</form>
<%
    }
%>
<script>
    function contentFun() {
        if (content.title.value == "") {
            alert("제목을 입력해주세요");
        } else if (contentPage.content.value == "") {
            alert("내용을 입력해주세요.")
        } else {
            content.submit();
        }
    }
</script>
</body>
</html>
