package jdbc;

public class JDBCtest {
	 public static void main(String[] args) {
	        //����������ݵ����ݿ�
	        InsertDB ud = new InsertDB();
	        User u = new User();
	        u.setUsername("����");
	        u.setPassword("1234");
	        boolean flag = ud.save(u);
	        if(flag){
	            System.out.println("���ԣ�������ӵ����ݿ�ɹ���");
	        }else{
	            System.out.println("���ԣ�������ӵ����ݿ�ʧ�ܣ�");
	        }
	    }
}
