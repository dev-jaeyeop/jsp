package bulletinBoard.dao;

import bulletinBoard.dto.Reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReplyDAO {
    DBConnectionMgr pool = new DBConnectionMgr();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public int create(String idx, String id, String reply) {
        int result = 0;
        String query = "insert into replies values(?, ?, ?, default)";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(idx));
            preparedStatement.setString(2, id);
            preparedStatement.setString(3, reply);
            result = preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement);
        }

        return result;
    }

    public ArrayList<Reply> findByIdx(String idx) {
        ArrayList<Reply> replies = new ArrayList<>();
        String query = "select * from replies where idx = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(idx));
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Reply reply = new Reply(resultSet.getInt("idx"),
                        resultSet.getString("id"),
                        resultSet.getString("reply"),
                        resultSet.getString("date")
                );
                replies.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return replies;
    }

    public ArrayList<Reply> findById(String id) {
        ArrayList<Reply> replies = new ArrayList<>();
        String query = "select * from replies where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Reply reply = new Reply(resultSet.getInt("idx"),
                        resultSet.getString("id"),
                        resultSet.getString("reply"),
                        resultSet.getString("date")
                );
                replies.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return replies;
    }

    public int delete(String idx) {
        int result = 0;
        String query = "delete from replies where idx = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(idx));
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
