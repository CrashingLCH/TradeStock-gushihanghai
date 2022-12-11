package jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class LinkDB {
	private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/tradesystem?useUnicode=true&characterEncoding=UTF-8";
    private static String user = "root";
    private static String pwd = "1234";
 
    //加载驱动
    static{
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
 
    //连接对象
    public static Connection getConnection(){
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
 
    //关闭流
    public static void close(ResultSet rs, Statement st, Connection conn){
        try {
            if(rs != null){
                rs.close();
            }
            if(st != null){
                st.close();
            }
            if(conn != null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public static void close(java.sql.PreparedStatement pst, Connection conn){
        close(null, pst, conn);
    }
}
