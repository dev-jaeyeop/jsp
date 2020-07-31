<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오후 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<%
    String memberId = request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");

    Connection connection = null;
    Statement statement = null;
    int result = 0;

    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
        String dbId = "root";
        String dbPassword = "autoset";

        String query = "delete from member where memberid = '" + memberId + "'";

        connection = DriverManager.getConnection(jdbcDriver, dbId, dbPassword);
        statement = connection.createStatement();
        result = statement.executeUpdate(query);

        if (result > 0) {
%>
<script>
    alert("success")
    location.href = 'view.jsp';
</script>
<%
        } else {
            out.print("error");
        }
    } catch (SQLException e) {
        e.getMessage();
        e.printStackTrace();
    } finally {
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
%>
</body>
</html>

