<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
<%
    String memberId = request.getParameter("id");
    String memberPassword = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    Class.forName("com.mysql.jdbc.Driver");

    Connection connection = null;
    Statement statement = null;
    int result = 0;

    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
        String dbId = "root";
        String dbPassword = "autoset";

        String query = "insert into member values('" + memberId + "', '" + memberPassword + "', '" + name + "', '" + email + "')";

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
