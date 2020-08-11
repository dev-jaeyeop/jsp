package ajaxTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AjaxTest {
    DBConnectionMgr pool = DBConnectionMgr.getInstance();
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public boolean isExistId(String id) {
        boolean result = false;
        String sql = "select idx from pagetmp where id = ?";
        try {
            con = pool.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return result;
    }

}
