package joinTest;

import java.sql.*;
import java.util.ArrayList;

public class DataAccessObject {
    DBConnectionMgr pool = DBConnectionMgr.getInstance();

    private Connection getConnection() {
        Connection connection = null;

        try {
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

    public void insert(String id, String password, String name) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "insert into members values(null, ?, ?, ?, default)";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, name);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement);
        }
    }

    public ArrayList<DataTransferObject> select() {
        ArrayList<DataTransferObject> members = new ArrayList<>();
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "select * from members";

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                DataTransferObject member = new DataTransferObject();
                member.setIdx(resultSet.getInt("idx"));
                member.setId(resultSet.getString("id"));
                member.setPassword(resultSet.getString("password"));
                member.setName(resultSet.getString("name"));
                member.setLevel(resultSet.getInt("level"));
                members.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, statement, resultSet);
        }

        return members;
    }

    public boolean find(String id, String password) {
        boolean exist = false;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String query = "select * from members where id = ? and password = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                exist = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return exist;
    }

    public int getLevel(String id) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int level = 0;

        String query = "select level from members where id = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                level = resultSet.getInt("level");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return level;
    }

    public int setLevel(String id, int level) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        String query = "update members set level = ? where id = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, level);
            preparedStatement.setString(2, id);
            resultSet = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement);
        }

        return resultSet;
    }


//    public DataTransferObject find(String idx) {
//        Connection connection = getConnection();
//        PreparedStatement preparedStatement = null;
//        ResultSet resultSet = null;
//        DataTransferObject findGuestBook = new DataTransferObject();
//
//        String query = "select * from guest_book where idx = ?";
//
//        try {
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, idx);
//            resultSet = preparedStatement.executeQuery();
//
//            if (resultSet.next()) {
//                findGuestBook.setIdx(resultSet.getInt("idx"));
//                findGuestBook.setName(resultSet.getString("name"));
//                findGuestBook.setPassword(resultSet.getString("password"));
//                findGuestBook.setDate(resultSet.getString("date"));
//                findGuestBook.setText(resultSet.getString("text"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            pool.freeConnection(connection, preparedStatement, resultSet);
//        }
//
//        return findGuestBook;
//    }

//    public void update(String text, String idx) {
//        Connection connection = getConnection();
//        PreparedStatement preparedStatement = null;
//        int resultSet = 0;
//
//        String query = "update guest_book set text = ?, date = now() where idx = ?";
//
//        try {
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, text);
//            preparedStatement.setString(2, idx);
//            resultSet = preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            pool.freeConnection(connection, preparedStatement);
//        }
//    }

//    public int delete(String idx) {
//        Connection connection = getConnection();
//        PreparedStatement preparedStatement = null;
//        int resultSet = 0;
//
//        String query = "delete from guest_book where idx = ?";
//
//        try {
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, idx);
//            resultSet = preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            pool.freeConnection(connection, preparedStatement);
//        }
//
//        return resultSet;
//    }

//    private void freeCon(ResultSet resultSet, Statement statement, Connection connection) {
//        try {
//            if (resultSet != null) {
//                resultSet.close();
//            }
//            if (statement != null) {
//                statement.close();
//            }
//            if (connection != null) {
//                connection.close();
//            }
//        } catch (SQLException e) {
//
//        }
//    }
//
//    private void freeCon(PreparedStatement preparedStatement, Connection connection) {
//        try {
//            if (preparedStatement != null) {
//                preparedStatement.close();
//            }
//            if (connection != null) {
//                connection.close();
//            }
//        } catch (SQLException e) {
//
//        }
//    }
}
