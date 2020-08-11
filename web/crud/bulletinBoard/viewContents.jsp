<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-11
  Time: 오전 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bulletinBoard.dto.Content" %>
<%@ page import="bulletinBoard.dto.User" %>
<%@ page import="bulletinBoard.dto.Reply" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bulletinBoard.dao.ContentDAO" %>
<%@ page import="bulletinBoard.dao.ReplyDAO" %>
<%@ page import="bulletinBoard.dao.UserDAO" %>
<html>
<head>
    <title>viewContent</title>
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
    String idx = request.getParameter("idx");
    String id = (String) session.getAttribute("id");
    String reply = request.getParameter("reply");

    UserDAO userDAO = new UserDAO();
    ContentDAO contentDAO = new ContentDAO();
    ReplyDAO replyDAO = new ReplyDAO();

    if (reply != null) {
        if (replyDAO.create(idx, id, reply) > 0) {
%>
<script>
    location.href = 'viewContents.jsp?idx=<%=idx%>'
</script>
<%
        }
    }

    if (idx != null && id != null) {
        Content findContent = contentDAO.findByIdx(idx);
        User findUser = userDAO.find(findContent.getId());
        ArrayList<Reply> findReplies = replyDAO.findByIdx(idx);

        if (findContent != null && findUser != null) {
%>
<table>
    <tr>
        <td>
            작성자
        </td>
        <td>
            제목
        </td>
        <td>
            날짜
        </td>
    </tr>
    <tr>
        <td>
            <%=findUser.getName()%>
        </td>
        <td>
            <%=findContent.getTitle()%>
        </td>
        <td>
            <%=findContent.getDate()%>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <textarea name="content" rows="10" readonly="readonly"
                      style="resize: none; width: 100%; text-align: left; outline: none">
                <%=findContent.getContent()%>
            </textarea>
        </td>
    </tr>
    <%
        if (findReplies.size() > 0) {
    %>
    <tr>
        <td>
            id
        </td>
        <td colspan="2">
            reply
        </td>
    </tr>
    <%
        for (int i = 0; i < findReplies.size(); i++) {
    %>
    <tr>
        <td>
            <%=findReplies.get(i).getId()%>
        </td>
        <td colspan="2">
            <%=findReplies.get(i).getReply()%>
        </td>
    </tr>
    <%
            }
        }
    %>
    <tr>
        <td>
            comment
        </td>
        <form action="viewContents.jsp" method="post" name="reply">
            <td>
                <input type="hidden" name="idx" value="<%=idx%>">
                <textarea name="reply" cols="30" rows="2" style="resize: none; outline: none"></textarea>
            </td>
            <td>
                <input type="button" value="reply" onclick="replyFun()">
            </td>
        </form>
    </tr>
    <tr>
        <td colspan="3">
            <input type="button" value="수정하기">
            <input type="button" value="삭제하기">
            <input type="button" value="뒤로가기" onclick="location.href='loginPage.jsp'">
        </td>
    </tr>
</table>
<%
    }
} else {
%>
<script>
    alert("잘못된 접근입니다.")
    location.href = 'loginPage.jsp';
</script>
<%
    }
%>
<script>
    function replyFun() {
        if (reply.reply.value == "") {
            alert("댓글을 입력해주세요.")
        } else {
            reply.submit();
        }
    }
</script>
</body>
</html>
