<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-07
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bulletinBoard.dao.UserDAO" %>
<html>
<head>
    <title>joinPage</title>
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

        td:nth-child(2) {
            text-align: left;
        }

        #checkID {
            font-size: 12px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");

    if (id != null && password != null && name != null && email != null && phoneNumber != null) {
        UserDAO userDAO = new UserDAO();
        userDAO.create(id, password, name, email, phoneNumber);
%>
<script>
    location.href = 'loginPage.jsp';
</script>
<%
    }
%>
<form action="joinPage.jsp" method="post" name="join">
    <table>
        <tr>
            <td colspan="3">
                회원가입
            </td>
        </tr>
        <tr>
            <td>
                아이디
            </td>
            <td style="border-right: 0">
                <input type="text" name="id" id="id">
            </td>
            <td name="checkID" id="checkID" style="width: 60px; border-left: 0">

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
            <td colspan="3">
                <input type="button" value="이전 페이지" onclick="history.back()">
                <input type="button" value="회원가입" onclick="joinFun()">
            </td>
        </tr>
    </table>
</form>
<script>
    function joinFun() {
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
        } else if ($("#checkID").text() == "사용 불가") {
            alert("사용할 수 없는 아이디 입니다.")
        } else if ($("#checkID").text() == "사용 가능") {
            join.submit();
        }
    }

    $("#id").keyup(function () {
        var params = "id=" + $("#id").val();
        $.ajax({
            type: "POST",
            url: "checkID.jsp",
            data: params,
            dataType: "json",
            success: function (args) {
                if ($("#id").val() != "") {
                    $("#checkID").html(args.result);
                    if (args.result == '사용 가능') {
                        $("#checkID").css("color", "green");
                    } else {
                        $("#checkID").css("color", "red");
                    }
                } else {
                    $("#checkID").html("");
                }
            },
        });
    });
</script>
</body>
</html>
