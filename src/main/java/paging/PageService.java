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
	public static int getTotalPage(int pageSize) {  //�ܹ�����ҳ��
		int total=0,totalPage=0; 
		java.sql.PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {  
			 Connection conn = LinkDB.getConnection();
			 String sql="select count(id) from stock";
			 pstmt = conn.prepareStatement(sql);
			 
			 rs = pstmt.executeQuery();  //����
			 while(rs.next())  
	            {  
	                total = rs.getInt(1); // count = rs.getInt("result");  
	            }
			 totalPage=total%pageSize>0?total/pageSize+1:total/pageSize;  //��ҳ��			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //������  	 
		
		 return totalPage; 		 
	}
	public static Map<String, Object> queryStockByPage(Page page){
		 
//	     java.sql.PreparedStatement pst=null;
		 int Index = page.getIndex();
		 int PageSize = page.getPageSize();
		 Map<String,Object> map = new HashMap<>();
		 QueryRunner qr = new QueryRunner();
		 Connection con=LinkDB.getConnection();	//�������ݿ�		 
		 String sql1="select * from stock limit "+Index+","+PageSize+" ";  //��ҳ��ѯ
		 try {
//			 pst=con.prepareStatement(sql1);
//			 pst.setInt(1, page.getIndex()*page.getPageSize());	//��ǰҳ*ÿҳ��Ŀ	
//			 pst.setInt(2, page.getPageSize());//ÿҳ��Ŀ
//			 System.out.println(sql1);
			 List<Stock> stock = null;
			 stock = qr.query(con, sql1, new BeanListHandler<Stock>(Stock.class));//��ѯ���ݴ浽Stock����
			 map.put("stock", stock);//���List����
			 con.close();//�ر����ݿ�
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	
		return map;
	}

}
