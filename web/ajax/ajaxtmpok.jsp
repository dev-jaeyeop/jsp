<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-10
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ajaxTest.AjaxTest" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    String id = request.getParameter("id");
    AjaxTest dao = new AjaxTest();
    boolean result = dao.isExistId(id);
    String str = "사용할수 없는 아이디 입니다.";
    if (result) {
        str = "사용할 수 있는 아이디 입니다.";
    }

    JSONObject json = new JSONObject();
    json.put("result", str);
    out.println(json);
%>
