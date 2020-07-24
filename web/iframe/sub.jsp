<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-23
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        img {
            width: 200px;
            height: 200px;
            cursor: pointer;
        }

        .video {
            opacity: 0;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
    <div class="thumbnail">
        <%
            String[] urls = request.getParameterValues("url");
            for (int i = 0; i < urls.length; i++) {
                String[] tmp = urls[i].split("/");
                tmp[2] = "img.youtube.com/";
                tmp[3] = "vi/" + tmp[3];
                String url = "";
                for (int j = 0; j < tmp.length; j++) {
                    url += tmp[j];
                }
        %>
        <img src="<%=url + "/0.jpg"%>" alt="">
        <%
            }
        %>
    </div>
    <div class="video">
        <iframe
                width="560"
                height="315"
                src=""
                frameborder="0"
                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
        ></iframe>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("img").click(function () {
            $(".video").animate({
                opacity: "100%"
            }, 500);
            let url = $(this).attr("src");
            let urls = url.split("/");
            $("iframe").attr("src", "https://www.youtube.com/embed/" + urls[urls.length - 2])
        })
    })
</script>
</body>
</html>
