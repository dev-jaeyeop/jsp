<%--
 Created by IntelliJ IDEA.
 User: user
 Date: 2020-07-31
 Time: 오전 10:25
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>view</title>
    <style>
        table, td {
            border: 1px solid black;
            text-align: center;
        }

        .crud {
            display: flex;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td colspan="3">
            LIST
        </td>
    </tr>
    <tr>
        <td>
            NAME
        </td>
        <td>
            ID
        </td>
        <td>
            E-MAIL
        </td>
    </tr>
    <%
        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
            String dbId = "root";
            String dbPassword = "autoset";

            String query = "select * from member order by name";

            connection = DriverManager.getConnection(jdbcDriver, dbId, dbPassword);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
    %>
    <tr>
        <td>
            <%=resultSet.getString("name")%>
        </td>
        <td>
            <%=resultSet.getString("memberid")%>
        </td>
        <td>
            <%=resultSet.getString("email")%>
        </td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            out.print(e.getMessage());
            e.printStackTrace();
        } finally {
            if (resultSet != null) try {
                resultSet.close();
            } catch (SQLException e) {

            }

            if (statement != null) try {
                statement.close();
            } catch (SQLException e) {

            }

            if (connection != null) try {
                connection.close();
            } catch (SQLException e) {

            }
        }
    %>
</table>
<br>
<br>
<br>
<div class="crud">
    <form action="insert.jsp">
        <table>
            <tr>
                <td colspan="2">
                    INSERT
                </td>
            </tr>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    <input type="text" name="id"> <br>
                </td>
            </tr>
            <tr>
                <td>
                    PASSWORD
                </td>
                <td>
                    <input type="password" name="password"> <br>
                </td>
            </tr>
            <tr>
                <td>
                    NAME
                </td>
                <td>
                    <input type="text" name="name"> <br>
                </td>
            </tr>
            <tr>
                <td>
                    E-MAIL
                </td>
                <td>
                    <input type="email" name="email"> <br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="INSERT">
                </td>
            </tr>
        </table>
    </form>
    <form action="delete.jsp">
        <table>
            <tr>
                <td colspan="2">
                    DELETE
                </td>
            </tr>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    <input type="text" name="id">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="DELETE">
                </td>
            </tr>
        </table>
    </form>
    <form action="update.jsp">
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
                    <input type="text" name="id">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="UPDATE">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
