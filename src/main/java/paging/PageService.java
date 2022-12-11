package paging;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import jdbc.LinkDB;
import jdbc_market.Stock;

public class PageService {
	public static int getTotalPage(int pageSize) {  //总共多少页数
		int total=0,totalPage=0; 
		java.sql.PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {  
			 Connection conn = LinkDB.getConnection();
			 String sql="select count(id) from stock";
			 pstmt = conn.prepareStatement(sql);
			 
			 rs = pstmt.executeQuery();  //总数
			 while(rs.next())  
	            {  
	                total = rs.getInt(1); // count = rs.getInt("result");  
	            }
			 totalPage=total%pageSize>0?total/pageSize+1:total/pageSize;  //总页数			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //总数量  	 
		
		 return totalPage; 		 
	}
	public static Map<String, Object> queryStockByPage(Page page){
		 
//	     java.sql.PreparedStatement pst=null;
		 int Index = page.getIndex();
		 int PageSize = page.getPageSize();
		 Map<String,Object> map = new HashMap<>();
		 QueryRunner qr = new QueryRunner();
		 Connection con=LinkDB.getConnection();	//连接数据库		 
		 String sql1="select * from stock limit "+Index+","+PageSize+" ";  //分页查询
		 try {
//			 pst=con.prepareStatement(sql1);
//			 pst.setInt(1, page.getIndex()*page.getPageSize());	//当前页*每页数目	
//			 pst.setInt(2, page.getPageSize());//每页数目
//			 System.out.println(sql1);
			 List<Stock> stock = null;
			 stock = qr.query(con, sql1, new BeanListHandler<Stock>(Stock.class));//查询数据存到Stock对象
			 map.put("stock", stock);//存成List集合
			 con.close();//关闭数据库
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	
		return map;
	}

}
