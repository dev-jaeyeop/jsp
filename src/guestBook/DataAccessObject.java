package guestBook;

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

    public void insert(String name, String password, String text) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "insert into guest_book(name, password, date, text) values(?, ?, now(), ?)";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, text);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(preparedStatement, connection);
    }

    public void insertReply(String idx, String reply) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "insert into reply_db(idx, reply) values(?, ?)";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(idx));
            preparedStatement.setString(2, reply);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(preparedStatement, connection);
    }

    public ArrayList<DataTransferObject> select() {
        ArrayList<DataTransferObject> users = new ArrayList<>();
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "select * from guest_book";

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                DataTransferObject user = new DataTransferObject();
                user.setIdx(resultSet.getInt("idx"));
                user.setName(resultSet.getString("name"));
                user.setPassword(resultSet.getString("password"));
                user.setDate(resultSet.getString("date"));
                user.setText(resultSet.getString("text"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        freeCon(resultSet, statement, connection);

        return users;
    }

    public ArrayList<DataTransferObject> selectReply(String idx) {
        ArrayList<DataTransferObject> replys = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String query = "select * from reply_db where idx = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idx);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                DataTransferObject reply = new DataTransferObject();
                reply.setIdx(resultSet.getInt("idx"));
                reply.setReply(resultSet.getString("reply"));
                replys.add(reply);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        freeCon(resultSet, preparedStatement, connection);

        return replys;
    }

    public DataTransferObject find(String idx) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        DataTransferObject findUser = new DataTransferObject();

        String query = "select * from guest_book where idx = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idx);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                findUser.setIdx(resultSet.getInt("idx"));
                findUser.setName(resultSet.getString("name"));
                findUser.setPassword(resultSet.getString("password"));
                findUser.setDate(resultSet.getString("date"));
                findUser.setText(resultSet.getString("text"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        freeCon(resultSet, preparedStatement, connection);

        return findUser;
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
