package jdbc_trade;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import jdbc.LinkDB;
import jdbc_market.Stock;

public class TradeService extends LinkDB {
	public static Map<String, Object> queryktrade(String code) {
		Map<String, Object> map = new HashMap<>();
		List<Stock> stock = null;
		try {

			Connection conn = LinkDB.getConnection();
			QueryRunner qr = new QueryRunner();

			String sql = "select name,code,raterf,updn,price from stock where code='" + code + "'";
			stock = qr.query(conn, sql, new BeanListHandler<Stock>(Stock.class));
			map.put("trade", stock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	public static Map<String, Object> querystrade(String code) {
		Map<String, Object> map = new HashMap<>();
		List<STrade> strade = null;
		List<Stock> stock = null;
		try {

			Connection conn = LinkDB.getConnection();
			QueryRunner qr = new QueryRunner();
			String sql = "select * from stock where code='" + code + "'";
			String sql1 = "select * from strade where code='" + code + "'";
			strade = qr.query(conn, sql1, new BeanListHandler<STrade>(STrade.class));
			stock = qr.query(conn, sql, new BeanListHandler<Stock>(Stock.class));
			map.put("sstrade", strade);
			map.put("trade", stock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	public static Map<String, Object> querytrade(String code) {
		Map<String, Object> map = new HashMap<>();
		List<Stock> stock = null;
		List<Trade> trade = null;
		List<STrade> strade = null;
		List<Trade> atrade = null;
		try {

			Connection conn = LinkDB.getConnection();
			QueryRunner qr = new QueryRunner();

			String sql = "select name,code,raterf,updn,price from stock where code='" + code + "'";
			stock = qr.query(conn, sql, new BeanListHandler<Stock>(Stock.class));
			map.put("trade", stock);

			String sql1 = "select * from trade where code='" + code + "'";
			trade = qr.query(conn, sql1, new BeanListHandler<Trade>(Trade.class));
			map.put("btrade", trade);

			String sql2 = "select * from strade where code='" + code + "'";
			strade = qr.query(conn, sql2, new BeanListHandler<STrade>(STrade.class));
			map.put("sstrade", strade);

			String sql3 = "select * from trade ";
			atrade = qr.query(conn, sql3, new BeanListHandler<Trade>(Trade.class));
			map.put("atrade", atrade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	public boolean buystock(Trade trade) {
		boolean flag = false;
		double a = trade.getCost();
		int b = trade.getSnum();
		Connection conn = null;
		java.sql.PreparedStatement pst = null;
		conn = LinkDB.getConnection();
		String sql = "insert into trade(name,code,raterf,updn,nprice,cost,snum,wttime,zt,shiz,yingk) values(?,?,?,?,?,?,?,?,?,?,?)";
		double shiz = 0.0;
		double yingk = 0.0;
		if (b != 0 && a != 0.0) {
			try {
				pst = conn.prepareStatement(sql);
				shiz = trade.getNprice() * trade.getSnum();
				yingk = ((trade.getNprice() - trade.getCost()) * trade.getSnum());
				yingk = (double) Math.round(yingk * 100) / 100;
				shiz = (double) Math.round(shiz * 100) / 100;
				pst.setString(1, trade.getName());
				pst.setString(2, trade.getCode());
				pst.setString(3, trade.getRaterf());
				pst.setString(4, trade.getUpdn());
				pst.setDouble(5, trade.getNprice());
				pst.setDouble(6, trade.getCost());
				pst.setInt(7, trade.getSnum());
				pst.setString(8, trade.getWttime());
				pst.setString(9, trade.getZt());
				pst.setDouble(10, shiz);
				pst.setDouble(11, yingk);
				int row = pst.executeUpdate();
				if (row > 0) {
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				LinkDB.close(pst, conn);
			}
			return flag;
		} else {
			return flag;
		}
	}

	public boolean sellstock(STrade strade) {
		boolean flag = false;
		double a = strade.getSell();
		int b = strade.getSnum();
		Connection conn = null;
		java.sql.PreparedStatement pst = null;
		conn = LinkDB.getConnection();
		String sql = "insert into strade(name,code,nprice,sell,snum,mnum,wttime,zt,shiz,yingk) values(?,?,?,?,?,?,?,?,?,?)";
		double shiz = 0.0;
		double yingk = 0.0;
		if (b != 0 && a != 0.0) {
			try {
				pst = conn.prepareStatement(sql);
				int snum = strade.getSnum();
				int mnum = strade.getMnum();
				snum = snum - mnum;
				shiz = strade.getNprice() * snum;
				yingk = ((strade.getNprice() - strade.getSell()) * strade.getMnum());
				yingk = (double) Math.round(yingk * 100) / 100;
				shiz = (double) Math.round(shiz * 100) / 100;

				pst.setString(1, strade.getName());
				pst.setString(2, strade.getCode());
				pst.setDouble(3, strade.getNprice());
				pst.setDouble(4, strade.getSell());
				pst.setInt(5, snum);
				pst.setInt(6, strade.getMnum());
				pst.setString(7, strade.getWttime());
				pst.setString(8, strade.getZt());
				pst.setDouble(9, shiz);
				pst.setDouble(10, yingk);
				int row = pst.executeUpdate();
				if (row > 0) {
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				LinkDB.close(pst, conn);
			}
			return flag;
		} else {
			return flag;
		}
	}

	// 更新trade的持仓数量
	public void upTrade(int snum, String code) {
		Connection conn = LinkDB.getConnection();
		java.sql.PreparedStatement ps = null;
		String sql1 = "update trade set snum=" + snum + " where id=" + code + "";
		try {
			ps = conn.prepareStatement(sql1);
			// 执行SQL语句
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭资源
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
