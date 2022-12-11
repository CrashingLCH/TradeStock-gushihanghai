package jdbc_stock;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import jdbc.LinkDB;
import jdbc_market.Stock;

public class StockService extends LinkDB {
	

	public static List<Stock> queryacount(String code) {

		List<Stock> stock = null;

		try {

			Connection conn = LinkDB.getConnection();
			QueryRunner qr = new QueryRunner();

			String sql = "select * from stock where code='"+code+"'";

			stock = qr.query(conn, sql, new BeanListHandler<Stock>(Stock.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stock;
	}
}
