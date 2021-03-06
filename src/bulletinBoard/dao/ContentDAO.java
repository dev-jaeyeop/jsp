package bulletinBoard.dao;

import bulletinBoard.dto.Content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentDAO {
    DBConnectionMgr pool = new DBConnectionMgr();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public int create(String id, String title, String content) {
        int result = 0;
        String query = "insert into contents values(null, ?, ?, ?, default)";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, title);
            preparedStatement.setString(3, content);
            result = preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement);
        }

        return result;
    }

    public ArrayList<Content> findAll() {
        ArrayList<Content> contents = new ArrayList<>();
        String query = "select * from contents order by date desc";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Content content = new Content(resultSet.getInt("idx"),
                        resultSet.getString("id"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("date")
                );
                contents.add(content);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return contents;
    }

    public Content findByIdx(String idx) {
        Content content = null;
        String query = "select * from contents where idx = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(idx));
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                content = new Content(resultSet.getInt("idx"),
                        resultSet.getString("id"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("date")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return content;
    }

    public Content findById(String id) {
        Content content = null;
        String query = "select * from contents where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                content = new Content(resultSet.getInt("idx"),
                        resultSet.getString("id"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("date")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return content;
    }

    public int update(String idx, String title, String content) {
        int result = 0;
        String query = "update contents set title = ?, content = ?, date = default where idx = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, title + "/수정됨");
            preparedStatement.setString(2, content);
            preparedStatement.setString(3, idx);
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

    public int delete(String idx) {
        int result = 0;
        String query = "delete from contents where idx = ?";

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
