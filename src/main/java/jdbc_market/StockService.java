package jdbc_market;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mysql.jdbc.PreparedStatement;

import jdbc.LinkDB;
import paging.Page;

public class StockService extends LinkDB {
	public static int getTotalPage(int pageSize) { // 总共多少页数
		int total = 0, totalPage = 0;
		java.sql.PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Connection conn = LinkDB.getConnection();
			String sql = "select count(id) from stock";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery(); // 总数
			while (rs.next()) {
				total = rs.getInt(1); // count = rs.getInt("result");
			}
			totalPage = total % pageSize > 0 ? total / pageSize + 1 : total / pageSize; // 总页数
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 总数量

		return totalPage;
	}

	public static Map<String, Object> QueryStock(Page page) {
		Map<String, Object> map = new HashMap<>();
		ResultSet rs = null;
		java.sql.PreparedStatement pst = null;
		List<Stock> stock = null;
		List<Stock> sastock = null;
		List<Stock> szstock = null;
		List<Stock> cystock = null;
		List<Stock> kcstock = null;
		int Index = page.getIndex();
		int PageSize = page.getPageSize();
		try {
			Connection conn = LinkDB.getConnection();
			//
			QueryRunner qr = new QueryRunner();
			// 全部股票
			String sql = ("select * from stock limit "+Index+","+PageSize+" ");// "+username+"select语句传参
			//上证A股
			String sql1 =("select * from sastock limit "+Index+","+PageSize+" ");
			//深圳A股
			String sql2 =("select * from szstock limit "+Index+","+PageSize+" ");
			//创业板
			String sql3 =("select * from cystock limit "+Index+","+PageSize+" ");
			//科创板
			String sql4 =("select * from kcstock limit "+Index+","+PageSize+" ");
			while (PageSize>=0) {
				// 全部股票
				stock = qr.query(conn, sql, new BeanListHandler<Stock>(Stock.class));
				map.put("stock", stock);
				//上证A股
				sastock = qr.query(conn, sql1, new BeanListHandler<Stock>(Stock.class));
				map.put("sastock", sastock);
				//深圳A股
				szstock = qr.query(conn, sql2, new BeanListHandler<Stock>(Stock.class));
				map.put("szstock", szstock);
				//创业板
				cystock = qr.query(conn, sql3, new BeanListHandler<Stock>(Stock.class));
				map.put("cystock", cystock);
				//科创板
				kcstock = qr.query(conn, sql4, new BeanListHandler<Stock>(Stock.class));
				map.put("kcstock", kcstock);
				PageSize-=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

}
