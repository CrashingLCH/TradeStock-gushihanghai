package jdbc;

public class JDBCtest {
	 public static void main(String[] args) {
	        //测试添加数据到数据库
	        InsertDB ud = new InsertDB();
	        User u = new User();
	        u.setUsername("李四");
	        u.setPassword("1234");
	        boolean flag = ud.save(u);
	        if(flag){
	            System.out.println("测试：数据添加到数据库成功！");
	        }else{
	            System.out.println("测试：数据添加到数据库失败！");
	        }
	    }
}
