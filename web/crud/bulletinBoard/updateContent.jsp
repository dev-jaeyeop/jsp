<%@ page import="bulletinBoard.dao.ContentDAO" %>
<%@ page import="bulletinBoard.dto.Content" %><%--
  Created by IntelliJ IDEA.
  User: Jaeyeop
  Date: 8/11/2020
  Time: 9:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateContent</title>
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
</head>
<body>
<%
    String sessionId = (String) session.getAttribute("id");
    String idx = request.getParameter("idx");

    if (sessionId == null && idx == null) {
%>
<script>
    alert("잘못된 접근입니다.")
    location.href = 'loginPage.jsp';
</script>
<%
    }

    String update = request.getParameter("update");

    ContentDAO contentDAO = new ContentDAO();
    Content findContent = contentDAO.findByIdx(idx);

    if (update != null) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (contentDAO.update(idx, title, content) > 0) {
%>
<script>
    location.href = 'viewContent.jsp?idx=<%=idx%>';
</script>
<%
} else {
%>
<script>
    alert("update error");
    location.href = 'loginPage.jsp';
</script>
<%
        }
    }
%>
<form action="updateContent.jsp" method="post" name="update">
    <table>
        <tr>
            <td>
                제목
            </td>
            <td>
                <input type="text" name="title" value="<%=findContent.getTitle().split("/")[0]%>"
                       style="width: 400px; padding: 10px; outline: none; border-style: none;">
            </td>
        </tr>
        <tr>
            <td>
                내용
            </td>
            <td>
                <textarea name="content" id="content" cols="30" rows="10"
                          style="width: 100%; height:300px; padding: 10px; resize: none; outline: none; border-style: none;"><%=findContent.getContent()%></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" name="idx" value="<%=idx%>">
                <input type="hidden" name="update" value="true">
                <input type="button" value="수정하기" onclick="updateFun()">
                <input type="button" value="뒤로가기" onclick="history.back()">
            </td>
        </tr>
    </table>
</form>
<script>
    function updateFun() {
        if (update.title == "") {
            alert("제목을 입력해주세요.");
        } else if (update.content == "") {
            alert("내용을 입력해주세요.")
        } else {
            update.submit();
        }
    }
</script>
</body>
</html>
