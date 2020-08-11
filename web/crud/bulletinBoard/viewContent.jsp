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
    String sessionId = (String) session.getAttribute("id");
    String reply = request.getParameter("reply");

    String deleteContent = request.getParameter("deleteContent");
    String deleteReply = request.getParameter("deleteReply");

    UserDAO userDAO = new UserDAO();
    ContentDAO contentDAO = new ContentDAO();
    ReplyDAO replyDAO = new ReplyDAO();

    if (deleteContent != null) {
        contentDAO.delete(idx);
        replyDAO.delete(idx);
%>
<script>
    alert("삭제가 완료되었습니다.");
    location.href='loginPage.jsp';
</script>
<%
    }

    if (reply != null) {
        if (replyDAO.create(idx, sessionId, reply) > 0) {
%>
<script>
    location.href = 'viewContent.jsp?idx=<%=idx%>'
</script>
<%
        }
    }

    if (deleteContent == null && idx != null) {
        Content findContent = contentDAO.findByIdx(idx);
        User findUser = userDAO.find(findContent.getId());
        ArrayList<Reply> findReplies = replyDAO.findByIdx(idx);

        if (findContent != null && findUser != null) {
%>
<table>
    <tr>
        <td style="width: 100px">
            작성자
        </td>
        <td style="width: 400px">
            제목
        </td>
        <td style="width: 150px">
            날짜
        </td>
    </tr>
    <tr>
        <td>
            <%=findUser.getName()%>
        </td>
        <td>
            <%=findContent.getTitle().split("/")[0]%>
        </td>
        <td>
            <%
                if (findContent.getTitle().split("/").length > 1) {
                    out.print(findContent.getDate().split(":")[0] + ":" + findContent.getDate().split(":")[1] + " (수정됨)");
                } else {
                    out.print(findContent.getDate().split(":")[0] + ":" + findContent.getDate().split(":")[1]);
                }
            %>
        </td>
    </tr>
    <tr>
        <td colspan="3"
            style="width: 400px; height: 300px; text-align: left; vertical-align: text-top; padding: 10px; border-bottom: none">
            <%=findContent.getContent()%>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="border-top: none; padding: 5px; text-align: right">
            <%
                if (sessionId != null && sessionId.equals(findUser.getId())) {
            %>
            <input type="button" value="수정하기" onclick="location.href='updateContent.jsp?idx=<%=idx%>'">
            <input type="button" value="삭제하기" onclick="location.href='viewContent.jsp?idx=<%=idx%>&deleteContent=true'">
            <%
                }
            %>
            <input type="button" value="뒤로가기" onclick="location.href='loginPage.jsp'">
        </td>
    </tr>
    <%
        if (findReplies.size() > 0) {
    %>
    <tr>
        <td>
            아이디
        </td>
        <td>
            댓글
        </td>
        <td>
            작성일
        </td>
    </tr>
    <%
        for (int i = 0; i < findReplies.size(); i++) {
    %>
    <tr>
        <td style="height: 30px">
            <%=findReplies.get(i).getId()%>
        </td>
        <td>
            <div style="display: flex; justify-content: space-between; padding: 5px">
                <%=findReplies.get(i).getReply()%>
                <%
                    if (sessionId != null && sessionId.equals(findReplies.get(i).getId())) {
                %>
                <input type="button" value="수정">
                <%
                    }
                %>
            </div>
        </td>
        <td>
            <%=findReplies.get(i).getDate().split(":")[0] + ":" + findReplies.get(i).getDate().split(":")[1]%>
        </td>
    </tr>
    <%
            }
        }
    %>
    <tr>
        <form action="viewContent.jsp" method="post" name="reply">
            <td colspan="3">
                <div style="display: flex; justify-content: space-between; padding: 5px">
                    <input type="hidden" name="idx" value="<%=idx%>">
                    <input type="hidden" id="sessionId" value="<%=sessionId%>">
                    <textarea name="reply" cols="30" rows="5" placeholder="댓글을 입력해주세요."
                              style="width: 90%; padding: 10px; resize: none; outline: none; border-style: none;"></textarea>
                    <input type="button" value="등록하기" onclick="replyFun()" style="height: min-content">
                </div>
            </td>
        </form>
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
        if (document.getElementById("sessionId").value == "null") {
            alert("로그인을 해주세요.")
            location.href = 'loginPage.jsp';
        } else if (reply.reply.value == "") {
            alert("댓글을 입력해주세요.")
        } else {
            reply.submit();
        }
    }
</script>
</body>
</html>
