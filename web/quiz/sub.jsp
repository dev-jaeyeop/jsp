<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-22
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String question = request.getParameter("question");

        String example01 = request.getParameter("example01");
        String example02 = request.getParameter("example02");
        String example03 = request.getParameter("example03");
        String example04 = request.getParameter("example04");

        String[] answers = request.getParameterValues("example");
        String answer = "wrong!";
        for (int i = 0; i < answers.length; i++) {
            if (answers[i].equals("answer")) {
                answer = "correct!";
            }
        }

        String path = request.getParameter("filePath");
    %>
    <div id="wrap">
        <%="question: " + question%> <br>
        <%="1. " + example01%> <br>
        <%="2. " + example02%> <br>
        <%="3. " + example03%> <br>
        <%="4. " + example04%> <br>
        <%="answer: " + answer%> <br>
        picture <br>
        <img src="<%=path%>" alt="">
    </div>
</body>
</html>
