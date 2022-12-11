package jdbc_trade;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BuyStock
 */
@WebServlet("/BuyStock")
public class BuyStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
//		boolean b = isRepeatSubmit(request);//�ж��û��Ƿ����ظ��ύ
//	    if(b==true){
////	         System.out.println("�벻Ҫ�ظ��ύ");
//	         Map<String, Object> map = TradeService.queryktrade(code);
//			 String msg="�벻Ҫ�ظ��ύ!!!";
//			 map.put("msg", msg);
//		     request.setAttribute("map", map);
//		     request.getRequestDispatcher("trade.jsp").forward(request, response);
//	    }
		String name = request.getParameter("name"); 
        String raterf = request.getParameter("raterf");
        String updn = request.getParameter("updn");
        String nprice1 = request.getParameter("nprice");
        String cost1 = request.getParameter("cost");
        String snum1 = request.getParameter("snum");
        String zt = "�ɽ�";
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat(" hh:mm:ss");//yyyy-MM-dd
//        System.out.println(snum);
        String wttime = dateFormat.format(date);
        if(cost1 !=""&& snum1!=""){
	        double nprice=Double.parseDouble(nprice1);
	        int snum=Integer.parseInt(snum1);
	        double cost=Double.parseDouble(cost1);
	        TradeService ts = new TradeService();
	        Trade btrade = new Trade();
	        btrade.setName(name);
	        btrade.setCode(code);
	        btrade.setRaterf(raterf);
	        btrade.setUpdn(updn);
	        btrade.setNprice(nprice);
	        btrade.setCost(cost);
	        btrade.setSnum(snum);
	        btrade.setWttime(wttime);
	        btrade.setZt(zt);
	//        System.out.print(btrade);
	        boolean flag = ts.buystock(btrade);
	        
	        Map<String, Object> map = TradeService.querytrade(code);
	        if(flag) {
	        	byte[] taken = TokenProccessor.getInstance().makeToken();//��������
	        	String token = new String((byte[])taken,StandardCharsets.UTF_8);
//	        	System.out.println("��FormServlet�����ɵ�token��"+token);
	        	request.getSession().setAttribute("token", token);  //�ڷ�����ʹ��session����token(����)
	        	request.setAttribute("map", map);
//	        	System.out.print(map);
	        	request.getRequestDispatcher("trade.jsp").forward(request, response);
	        	
	        }else{
	        	String msg="�����빺��۸������!!!";
	        	map.put("msg", msg);
	        	request.setAttribute("map", map);
		    	request.getRequestDispatcher("trade.jsp").forward(request, response);
		    }
		}else {
			Map<String, Object> map = TradeService.queryktrade(code);
			String msg="�����빺��۸������!!!";
			if(cost1 =="" || snum1=="") {
				map.put("msg", msg);
			}
//			System.out.print(map);
	    	request.setAttribute("map", map);
	    	request.getRequestDispatcher("trade.jsp").forward(request, response);
		}   
	}
//	private boolean isRepeatSubmit(HttpServletRequest request) {
//        String client_token = request.getParameter("token");
//        //1������û��ύ�ı�������û��token�����û����ظ��ύ�˱�
//        if(client_token==null){
//            return true;
//        }
//        //ȡ���洢��Session�е�token
//        String server_token = (String) request.getSession().getAttribute("token");
//        //2�������ǰ�û���Session�в�����Token(����)�����û����ظ��ύ�˱�
//        if(server_token==null){
//            return true;
//        }
//        //3���洢��Session�е�Token(����)����ύ��Token(����)��ͬ�����û����ظ��ύ�˱�
//        if(!client_token.equals(server_token)){
//            return true;
//        }
//
//        return false;
//    }
}
