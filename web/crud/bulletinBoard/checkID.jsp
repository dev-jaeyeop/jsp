<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-08-10
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="bulletinBoard.dao.UserDAO" %>

<%
    String id = request.getParameter("id");
    JSONObject json = new JSONObject();
    UserDAO userDAO = new UserDAO();
    String message;

    if (userDAO.find(id) != null) {
        message = "사용 불가";
    } else {
        message = "사용 가능";
    }

    json.put("result", message);
    out.println(json);
%>
