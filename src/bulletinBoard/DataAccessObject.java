package bulletinBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DataAccessObject {
    DBConnectionMgr pool = new DBConnectionMgr();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public int create(String id, String password, String name, String email, String phoneNumber) {
        int result = 0;
        String query = "insert into members values(null, default, ?,?,?,?,?)";

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

    public ArrayList<Member> select() {
        ArrayList<Member> members = new ArrayList<>();
        String query = "select * from members";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Member member = new Member();
                member.setIdx(resultSet.getInt("idx"));
                member.setLevel(resultSet.getInt("level"));
                member.setId(resultSet.getString("id"));
                member.setPassword(resultSet.getString("password"));
                member.setName(resultSet.getString("name"));
                member.setEmail(resultSet.getString("email"));
                member.setPhoneNumber(resultSet.getString("phoneNumber"));
                members.add(member);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return members;
    }

    public Member checkID(String id) {
        Member member = null;
        String query = "select * from members where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                member = new Member();
                member.setIdx(resultSet.getInt("idx"));
                member.setLevel(resultSet.getInt("level"));
                member.setId(resultSet.getString("id"));
                member.setPassword(resultSet.getString("password"));
                member.setName(resultSet.getString("name"));
                member.setEmail(resultSet.getString("email"));
                member.setPhoneNumber(resultSet.getString("phoneNumber"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return member;
    }

    public int getLevel(String id) {
        int level = 0;
        String query = "select level from members where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                level = resultSet.getInt("level");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return level;
    }

    public int update(String id, String password, String name, String email, String oid) {
        int result = 0;
        String query = "update member set id = ?, password = ?, name = ?, email = ?, phoneNumber = where id = ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, name);
            preparedStatement.setString(5, oid);
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

    public int delete(String id) {
        int result = 0;
        String query = "delete from member where id = ?";

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
