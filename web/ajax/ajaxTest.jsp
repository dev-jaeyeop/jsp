<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-10
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<input type="text" name="id">
<div></div>
<script>
    // $(function () {
    //     $("input").keyup(function () {
    //         var params = "id=" + $("input").val();
    //         $.ajax({
    //             type: "POST",
    //             url: "ajaxtmpok.jsp",
    //             data: params,
    //             dataType: "text", //받아올 결과 타입
    //             success: function (args) { // 결과는 args에 담김
    //                 $("div").html("<i>" + args + "<i>");
    //             },
    //             error: function (args) {
    //                 $("div").html(args.responseText + "<br>에러 발생!");
    //             }
    //         });
    //     });
    // });
    $(function () {
        $("input").keyup(function () {
            var params = "id=" + $("input").val();
            $.ajax({
                type: "POST",
                url: "ajaxtmpok.jsp",
                data: params,
                dataType: "json", //받는 type은 json방식
                success: function (args) { // 결과값이 json방식으로 args로 들어온 상태
                    $("div").html("<i>" + args.result + "<i>");
                },
                error: function (args) {
                    $("div").html(args.responseText + "<br>에러 발생!");
                }
            });
        });
    });
</script>
</body>
</html>
