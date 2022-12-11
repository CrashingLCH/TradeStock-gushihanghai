package jdbc_market;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import jdbc.LinkDB;
public class Q{
    public static void main(String[] args)
	{	
    	List<Stock> sastock = null;
    	try {
			Connection conn = LinkDB.getConnection();
			// 
			QueryRunner qr = new QueryRunner();
    	String sql1 =("select id from sastock");
		sastock = qr.query(conn, sql1, new BeanListHandler<Stock>(Stock.class));
		System.out.println(sastock);
    	}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
}

