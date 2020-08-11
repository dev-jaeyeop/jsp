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
    String sessionId = (String) session.getAttribute("id");
    if (sessionId == null) {
%>
<script>
    alert("로그인을 해주세요.");
    location.href = 'loginPage.jsp';
</script>
<%
} else {
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    if (title != null && content != null) {
        ContentDAO contentDAO = new ContentDAO();

        if (contentDAO.create(sessionId, title, content) > 0) {
%>
<script>
    location.href = 'loginPage.jsp';
</script>
<%
} else {
%>
<script>
    alert("create error");
    location.href='loginPage.jsp';
</script>
<%
        }
    }
%>
<form action="createContent.jsp" method="post" name="create">
    <table>
        <tr>
            <td>
                제목
            </td>
            <td>
                <input type="text" name="title" style="width: 100%; border: none">
            </td>
        </tr>
        <tr>
            <td>
                내용
            </td>
            <td>
                <textarea name="content" cols="30" rows="10" style="border: none"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="등록" onclick="createFun()">
            </td>
        </tr>
    </table>
</form>
<%
    }
%>
<script>
    function createFun() {
        if (create.title.value == "") {
            alert("제목을 입력해주세요");
        } else if (create.content.value == "") {
            alert("내용을 입력해주세요.")
        } else {
            create.submit();
        }
    }
</script>
</body>
</html>
