package jdbc_trade;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Random;

public class TokenProccessor {

    /*
     *�������ģʽ����֤��Ķ������ڴ���ֻ��һ����
     *1������Ĺ��캯��˽��
     *2���Լ�����һ����Ķ���
     *3�������ṩһ�������ķ�����������Ķ���
     */
    private TokenProccessor(){}

    private static final TokenProccessor instance = new TokenProccessor();

    /**
     * ������Ķ���
     * @return
     */
    public static TokenProccessor getInstance(){
        return instance;
    }

    /**
     * ����Token
     * Token��Nv6RRuGEVvmGjB+jimI/gw==
     * @return
     */
    public byte[] makeToken(){  //checkException
        //  7346734837483  834u938493493849384  43434384
        String token = (System.currentTimeMillis() + new Random().nextInt(999999999)) + "";
        //����ָ��   128λ��   16���ֽ�  md5
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte md5[] =  md.digest(token.getBytes());
            //base64����--��������Ʊ��������ַ�   adfsdfsdfsf
            final Base64.Encoder encoder = Base64.getEncoder();
            return encoder.encode(md5);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}