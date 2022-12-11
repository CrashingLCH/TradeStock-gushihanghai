package jdbc_info;

import java.sql.Connection;
import java.sql.SQLException;
import jdbc.LinkDB;
import jdbc.User;

public class InfoService extends LinkDB {
	public void upInfo(User user){
			Connection conn = LinkDB.getConnection();
			String sql = "update register set name=?,email=?,sex=?,img=? where username=?";
			try {
				java.sql.PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, user.getName());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getSex());
				ps.setString(4, user.getImg());
				ps.setString(5, user.getUsername());
				//执行SQL语句
				if(ps.executeUpdate()>0){
//						System.out.println(user.getSex());
						System.out.println("修改成功!");
				}
				} catch (SQLException e) {
					  // TODO Auto-generated catch block
					  e.printStackTrace();
				}finally{
				//关闭资源
				  try {
					conn.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}	
	}
	public void upUser(User user) {
		Connection conn = LinkDB.getConnection();
		String sql = "update register set password=? where username=?";
		try {
			java.sql.PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getUsername());
			//执行SQL语句
			if(ps.executeUpdate()>0){
//					System.out.println(user.getSex());
					System.out.println("修改成功!");
			}
			} catch (SQLException e) {
				  // TODO Auto-generated catch block
				  e.printStackTrace();
			}finally{
			//关闭资源
			  try {
				conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}	
	}
}
