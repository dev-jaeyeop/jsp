<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-23
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="sub.jsp">
    <div class="wrap">
        <div class="text">
            <input type="text" name="url"><input type="button" value="+" onclick="add()"><input type="button" value="-"
                                                                                                onclick="remove()">
        </div>
    </div>
    <input type="submit" value="ok">
</form>
<script>
    function add() {
        let texts = document.getElementsByClassName("text");
        texts[0].outerHTML += (texts[0].outerHTML)
    }

    function remove() {
        let texts = document.getElementsByClassName("text");
        if (texts.length > 1) {
            document.getElementsByClassName("text")[texts.length - 1].remove();
        }
    }
</script>
</body>
</html>

