package jdbc_info;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import jdbc.LinkDB;
import jdbc.User;

/**
 * Servlet implementation class Qinfos
 */
public class Qinfos extends LinkDB {
    public static List<User> query(String username) {
    	List<User> user = null;
    	
		try {
			Connection conn = LinkDB.getConnection();
			// 
			QueryRunner qr = new QueryRunner();

			String sql =("select * from register where username='"+username+"'");
			
//			System.out.print(sql);

			user = qr.query(conn, sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
    }
}
