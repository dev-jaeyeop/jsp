<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-24
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost/book_db";
    String id = "root";
    String pw = "autoset";
    Connection con = null; // db connection
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        out.println("driver connect!");
        con = DriverManager.getConnection(url, id, pw);
        out.println("db connect!");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    stmt = con.createStatement(); // query send
    String query = "select * from books"; // query
    ResultSet rs = stmt.executeQuery(query);
    while (rs.next()) {
        out.println(rs.getInt(1) + "/");
        out.println(rs.getString(2) + "/");
        out.println(rs.getString(3) + "/");
        out.println(rs.getString(4) + "/");
        out.println(rs.getInt(5) + "/");
    }
%>
</body>
</html>
