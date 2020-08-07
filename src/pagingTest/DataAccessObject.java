package pagingTest;

import java.sql.*;
import java.util.ArrayList;

public class DataAccessObject {
    final int PAGE_ROW_COUNT = 10;
    int totalPage;

    DBConnectionMgr pool = DBConnectionMgr.getInstance();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public ArrayList<DataTransferObject> select() {
        ArrayList<DataTransferObject> users = new ArrayList<>();
        String query = "select * from pagetmp";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                DataTransferObject user = new DataTransferObject();
                user.setIdx(resultSet.getInt("idx"));
                user.setId(resultSet.getString("id"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return users;
    }

    public ArrayList<DataTransferObject> select(String pageIdx) {
        int currentPage = (Integer.parseInt(pageIdx) - 1) * PAGE_ROW_COUNT;
        ArrayList<DataTransferObject> users = new ArrayList<>();

        String query = "select * from pagetmp limit ?, ?";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, currentPage);
            preparedStatement.setInt(2, PAGE_ROW_COUNT);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                DataTransferObject user = new DataTransferObject();
                user.setIdx(resultSet.getInt("idx"));
                user.setId(resultSet.getString("id"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return users;
    }

    public int getTotalPage() {
        String query = "select count(idx) from pagetmp";

        try {
            connection = pool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalPage = resultSet.getInt(1);
            }
            totalPage = (int) Math.ceil(totalPage / (double) PAGE_ROW_COUNT);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection, preparedStatement, resultSet);
        }

        return totalPage;
    }
}
