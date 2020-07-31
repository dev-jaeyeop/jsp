<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-31
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>update</title>
    <style>
        table, td {
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String memberId = request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
        String dbId = "root";
        String dbPassword = "autoset";

        String query = "select * from member where memberid = '" + memberId + "'";

        connection = DriverManager.getConnection(jdbcDriver, dbId, dbPassword);
        statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

        if (resultSet.next()) {
%>
<form action="updateProcess.jsp">
    <table>
        <tr>
            <td colspan="2">
                UPDATE
            </td>
        </tr>
        <tr>
            <td>
                ID
            </td>
            <td>
                <input type="text" name="id" value="<%=resultSet.getString("memberid")%>">
            </td>
        </tr>
        <tr>
            <td>
                PASSWORD
            </td>
            <td>
                <input type="text" name="password" value="<%=resultSet.getString("password")%>">
            </td>
        </tr>
        <tr>
            <td>
                NAME
            </td>
            <td>
                <input type="text" name="name" value="<%=resultSet.getString("name")%>">
            </td>
        </tr>
        <tr>
            <td>
                E-MAIL
            </td>
            <td>
                <input type="email" name="email" value="<%=resultSet.getString("email")%>">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="update">
            </td>
        </tr>
        <input type="hidden" name="oid" value="<%=memberId%>">
    </table>
</form>
<%
        }
    } catch (SQLException e) {
        e.getMessage();
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            statement.close();
        }
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


