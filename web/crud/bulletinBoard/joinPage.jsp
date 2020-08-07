<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-07
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bulletinBoard.DataAccessObject" %>
<html>
<head>
    <title>joinPage</title>
    <style>
        table, td {
            border-collapse: collapse;
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    DataAccessObject dataAccessObject = new DataAccessObject();
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");

    if (id != null && password != null && name != null && email != null && phoneNumber != null) {
        if (dataAccessObject.checkID(id) == null) {
            dataAccessObject.create(id, password, name, email, phoneNumber);
%>
<script>
    location.href = 'loginPage.jsp';
</script>
<%
} else {
%>
<script>
    alert("이미 사용중인 아이디입니다.")
</script>
<%
        }
    }
%>
<form name="join" action="joinPage.jsp" method="post">
    <table>
        <tr>
            <td colspan="2">
                회원가입
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
            <td colspan="2">
                <input type="password" name="password">
            </td>
        </tr>
        <tr>
            <td>
                이름
            </td>
            <td colspan="2">
                <input type="name" name="name">
            </td>
        </tr>
        <tr>
            <td>
                이메일
            </td>
            <td colspan="2">
                <input type="email" name="email">
            </td>
        </tr>
        <tr>
            <td>
                전화번호
            </td>
            <td colspan="2">
                <input type="text" name="phoneNumber">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="이전 페이지" onclick="location.href='loginPage.jsp'">
                <input type="button" value="회원가입" onclick="check()">
            </td>
        </tr>
    </table>
</form>
<script>
    function check() {
        if (join.id.value == "") {
            alert("아이디를 입력해주세요");
        } else if (join.password.value == "") {
            alert("비밀번호를 입력해주세요.")
        } else if (join.name.value == "") {
            alert("이름을 입력해주세요.")
        } else if (join.email.value == "") {
            alert("이메일을 입력해주세요.")
        } else if (join.phoneNumber.value == "") {
            alert("전화번호를 입력해주세요.")
        } else {
            join.submit();
        }
    }
</script>
</body>
</html>
