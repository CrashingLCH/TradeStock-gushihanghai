package jdbc;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class InsertDB implements Dao{
	public boolean save(User user){
        boolean flag = false;
        Connection conn = null;
        java.sql.PreparedStatement pst = null;
 
        /*
        创建连接Connection对象和Statement对象
        调用插入数据到数据库的方法
        */
        conn = LinkDB.getConnection();
        String sql = "insert into register(username, password,name,email) values(?,?,?,?)";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getName());
            pst.setString(4, user.getEmail());
            int row = pst.executeUpdate();
            if(row>0){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            LinkDB.close(pst, conn);
        }
        return flag;
    }
	
	
    public boolean checkLogin(String username, String password){
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql ="select * from register where username = '"+ username +"'";
        conn = LinkDB.getConnection();
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()){
                if(rs.getString("password").equals(password)){
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            LinkDB.close(rs, st, conn);
        }
        return flag;
    }
    public void remove(String id) throws Exception{
     	 String sql="delete from ledgers where id in ("+id+")";
     	 java.sql.PreparedStatement pst = LinkDB.getConnection().prepareStatement(sql);
     	 pst.executeUpdate();
         pst.close();
     }
}
