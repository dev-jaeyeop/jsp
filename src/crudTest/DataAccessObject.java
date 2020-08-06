package crudTest;

import java.sql.*;
import java.util.ArrayList;

public class DataAccessObject {

    private Connection getConnection() {
        Connection connection = null;
        String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
        String dbId = "root";
        String dbPassword = "autoset";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcDriver, dbId, dbPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

    public int insert(String id, String password, String name, String email) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "insert into member values(?, ?, ?, ?)";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, name);
            preparedStatement.setString(4, email);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(preparedStatement, connection);

        return resultSet;
    }

    public ArrayList<DataTransferObject> select() {
        ArrayList<DataTransferObject> users = new ArrayList<>();
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "select * from member";

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                DataTransferObject user = new DataTransferObject();
                user.setId(resultSet.getString("memberid"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        freeCon(resultSet, statement, connection);

        return users;
    }

    public DataTransferObject find(String id) {
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        DataTransferObject findUser = new DataTransferObject();

        String query = "select * from member where memberid = '" + id + "'";

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                findUser.setId(resultSet.getString("memberid"));
                findUser.setPassword(resultSet.getString("password"));
                findUser.setName(resultSet.getString("name"));
                findUser.setEmail(resultSet.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(resultSet, statement, connection);

        return findUser;
    }

    public int update(String id, String password, String name, String email, String oid) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "update member set memberid = ?, password = ?, name = ?, email = ? where memberid = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, name);
            preparedStatement.setString(5, oid);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(preparedStatement, connection);

        return resultSet;
    }

    public int delete(String id) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "delete from member where memberid = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(preparedStatement, connection);

        return resultSet;
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

    private void freeCon(PreparedStatement preparedStatement, Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {

        }
    }

}