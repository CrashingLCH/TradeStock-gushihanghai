package jdbc;

import java.sql.Connection;

public class Test {
	public static void main(String[] args) {
        //�����������ݿ��Ƿ�ɹ�
        Connection conn = LinkDB.getConnection();
        if(conn != null){
            System.out.println("���ԣ����ݿ����ӳɹ���");
        }else{
            System.out.println("���ԣ����ݿ�����ʧ�ܣ�");
        }
    }
}
