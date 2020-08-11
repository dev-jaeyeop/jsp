package crudTest;

import java.sql.*;
import java.util.ArrayList;

public class DataAccessObject {

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
        String dbId = "root";
        String dbPassword = "autoset";

        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcDriver, dbId, dbPassword);

        return connection;
    }

    public void insert(String id, String password, String name, String email) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();

        Statement statement = null;
        int resultSet = 0;

        String query = "insert into member values('" + id + "', '" + password + "', '" + name + "', '" + email + "')";
        statement = connection.createStatement();
        resultSet = statement.executeUpdate(query);

        freeCon(statement, connection);
    }

    public ArrayList<DataTransferObject> select() throws SQLException, ClassNotFoundException {
        ArrayList<DataTransferObject> memberInfo = new ArrayList<>();
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "select * from member";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            DataTransferObject dataTransferObject = new DataTransferObject();
            dataTransferObject.setId(resultSet.getString("memberid"));
            dataTransferObject.setPassword(resultSet.getString("password"));
            dataTransferObject.setName(resultSet.getString("name"));
            dataTransferObject.setEmail(resultSet.getString("email"));
            memberInfo.add(dataTransferObject);
        }

        freeCon(resultSet, statement, connection);

        return memberInfo;
    }

    public void update(String id, String password, String name, String email, String oid) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        Statement statement = null;
        int resultSet = 0;

        String query = "update member set memberid = '" + id + "', password = '" + password + "', name = '" + name + "', email = '" + email + "' where memberid = '" + oid + "'";
        statement = connection.createStatement();
        resultSet = statement.executeUpdate(query);

        freeCon(statement, connection);
    }


    private void freeCon(ResultSet resultSet, Statement statement, Connection connection) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {

        }
    }

    private void freeCon( Statement statement, Connection connection) {
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {

        }
    }

}
