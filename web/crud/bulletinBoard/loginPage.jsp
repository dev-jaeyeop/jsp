<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-07
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bulletinBoard.dto.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bulletinBoard.dto.Content" %>
<%@ page import="bulletinBoard.dao.UserDAO" %>
<%@ page import="bulletinBoard.dao.ContentDAO" %>
<html>
<head>
    <title>loginPage</title>
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
<form action="loginPage.jsp" method="post" name="login">
    <table>
        <%
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String logout = request.getParameter("logout");

            if (logout != null) { // logout check
                session.removeAttribute("id");
        %>
        <script>
            location.href = 'loginPage.jsp';
        </script>
        <%
            }

            UserDAO userDAO = new UserDAO();

            if (session.getAttribute("id") == null) { // login check
                User findUser = userDAO.find(id); // user check
                if (findUser != null && findUser.getId().equals(id) && findUser.getPassword().equals(password)) {
                    session.setAttribute("id", id);
        %>
        <script>
            location.href = 'loginPage.jsp';
        </script>
        <%
        } else if (id != null && password != null && findUser == null) {
        %>
        <script>
            alert("아이디와 비밀번호를 확인해주세요.")
        </script>
        <%
            }
        %>
        <tr>
            <td colspan="2">
                로그인
            </td>
        </tr>
        <tr>
            <td>
                아이디
            </td>
            <td>
                <input type="text" name="id">
            </td>
        </tr>
        <tr>
            <td>
                비밀번호
            </td>
            <td>
                <input type="password" name="password">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="회원가입" onclick="location.href='joinPage.jsp'">
                <input type="button" value="로그인" onclick="loginFun()">
            </td>
        </tr>
    </table>
</form>
<%
} else {
%>
<table>
    <tr>
        <td colspan="4">
            <%=session.getAttribute("id")%>님 안녕하세요
            <input type="button" value="로그아웃" onclick="logoutFun()">
        </td>
    </tr>
    <tr>
        <td>
            번호
        </td>
        <td>
            제목
        </td>
        <td>
            작성자
        </td>
        <td>
            작성일
        </td>
    </tr>
    <%
        ContentDAO contentDAO = new ContentDAO();

        ArrayList<Content> contents = contentDAO.findAll();
        for (int i = 0; i < contents.size(); i++) {
    %>
    <tr style="cursor: pointer"
        onclick="location.href='viewContents.jsp?idx=<%=contents.get(i).getIdx()%>'">
        <td>
            <%=i + 1%>
        </td>
        <td>
            <%=contents.get(i).getTitle()%>
        </td>
        <td>
            <%=contents.get(i).getId()%>
        </td>
        <td>
            <%=contents.get(i).getDate()%>
        </td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="4">
            <input type="button" value="글쓰기" onclick="location.href='createContent.jsp'">
        </td>
    </tr>
</table>
<%
    }
%>
<script>
    function loginFun() {
        if (login.id.value == "") {
            alert("아이디를 입력해주세요");
        } else if (login.password.value == "") {
            alert("비밀번호를 입력해주세요.")
        } else {
            login.submit();
        }
    }

    function logoutFun() {
        location.href = 'loginPage.jsp?logout=true'
    }
</script>
</body>
</html>