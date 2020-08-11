package bulletinBoard.dao;

import bulletinBoard.dto.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    DBConnectionMgr pool = new DBConnectionMgr();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public int create(String id, String password, String name, String email, String phoneNumber) {
        int result = 0;
        String query = "insert into users values(null, default, ?,?,?,?,?)";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, name);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phoneNumber);
            result = preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement);
        }

        return result;
    }

    public ArrayList<User> findAll() {
        ArrayList<User> users = new ArrayList<>();
        String query = "select * from users";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User(resultSet.getInt("idx"),
                        resultSet.getInt("level"),
                        resultSet.getString("id"),
                        resultSet.getString("password"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phoneNumber")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return users;
    }

    public User find(int idx) {
        User user = null;
        String query = "select * from users where idx = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idx);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User(resultSet.getInt("idx"),
                        resultSet.getInt("level"),
                        resultSet.getString("id"),
                        resultSet.getString("password"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phoneNumber")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return user;
    }

    public User find(String id) {
        User user = null;
        String query = "select * from users where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User(resultSet.getInt("idx"),
                        resultSet.getInt("level"),
                        resultSet.getString("id"),
                        resultSet.getString("password"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phoneNumber")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return user;
    }

    public int delete(String id) {
        int result = 0;
        String query = "delete from users where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement);
        }

        return result;
    }
}
