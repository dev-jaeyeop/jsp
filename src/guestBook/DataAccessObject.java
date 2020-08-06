package guestBook;

import java.sql.*;
import java.util.ArrayList;


public class DataAccessObject {
    DBConnectionMgr pool = DBConnectionMgr.getInstance();

    private Connection getConnection() {
        Connection connection = null;
//        String jdbcDriver = "jdbc:mysql://localhost:3306/testdb";
//        String dbId = "root";
//        String dbPassword = "autoset";

        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            connection = DriverManager.getConnection(jdbcDriver, dbId, dbPassword);
            connection = pool.getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
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
        } finally {
//            freeCon(preparedStatement, connection);
            pool.freeConnection(connection, preparedStatement);
        }
    }

    public void insertReply(String idx, String reply) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "insert into reply_db(idx, reply) values(?, ?)";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idx);
            preparedStatement.setString(2, reply);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
//            freeCon(preparedStatement, connection);
            pool.freeConnection(connection, preparedStatement);
        }
    }

    public ArrayList<DataTransferObject> select() {
        ArrayList<DataTransferObject> guestBooks = new ArrayList<>();
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "select * from guest_book";

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                DataTransferObject guestBook = new DataTransferObject();
                guestBook.setIdx(resultSet.getInt("idx"));
                guestBook.setName(resultSet.getString("name"));
                guestBook.setPassword(resultSet.getString("password"));
                guestBook.setDate(resultSet.getString("date"));
                guestBook.setText(resultSet.getString("text"));
                guestBooks.add(guestBook);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        freeCon(resultSet, statement, connection);
        pool.freeConnection(connection, statement, resultSet);

        return guestBooks;
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
        } finally {
//            freeCon(preparedStatement, connection, resultSet);
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return replys;
    }

    public DataTransferObject find(String idx) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        DataTransferObject findGuestBook = new DataTransferObject();

        String query = "select * from guest_book where idx = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idx);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                findGuestBook.setIdx(resultSet.getInt("idx"));
                findGuestBook.setName(resultSet.getString("name"));
                findGuestBook.setPassword(resultSet.getString("password"));
                findGuestBook.setDate(resultSet.getString("date"));
                findGuestBook.setText(resultSet.getString("text"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
//            freeCon(resultSet, preparedStatement, connection);
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return findGuestBook;
    }

    public void update(String text, String idx) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "update guest_book set text = ?, date = now() where idx = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, text);
            preparedStatement.setString(2, idx);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
//            freeCon(preparedStatement, connection);
            pool.freeConnection(connection, preparedStatement);
        }
    }

    public int delete(String idx) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "delete from guest_book where idx = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idx);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
//            freeCon(preparedStatement, connection);
            pool.freeConnection(connection, preparedStatement);
        }

        return resultSet;
    }

    public void deleteReply(String idx) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "delete from reply_db where idx = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idx);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
//            freeCon(preparedStatement, connection);
            pool.freeConnection(connection, preparedStatement);
        }
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
