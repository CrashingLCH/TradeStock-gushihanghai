package jdbc_trade;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SellStock
 */
@WebServlet("/SellStock")
public class SellStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
//		boolean b = isRepeatSubmit(request);//�ж��û��Ƿ����ظ��ύ
//	    if(b==true){
////	         System.out.println("�벻Ҫ�ظ��ύ");
//	         Map<String, Object> map = TradeService.queryktrade(code);
//			 String msg="�벻Ҫ�ظ��ύ!!!";
//			 map.put("msg1", msg);
//		     request.setAttribute("map", map);
//		     request.getRequestDispatcher("trade.jsp").forward(request, response);
//	    }
		String name = request.getParameter("name"); 
        String nprice1 = request.getParameter("nprice");
        String sell1 = request.getParameter("sell");
//        System.out.println(sell1);
        String snum1 = request.getParameter("snum");
        String mnum1 = request.getParameter("mnum");
        String zt = "�ɽ�";
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat(" hh:mm:ss");//yyyy-MM-dd
//        System.out.println(snum);
        String wttime = dateFormat.format(date);
        int snum=Integer.parseInt(snum1);
        int mnum=Integer.parseInt(mnum1);
        // ����trade�ĳֲ�����
        int dat = snum-mnum;
        TradeService tradeService = new TradeService();
		tradeService.upTrade(dat, code);
        if(sell1 !=""&& snum1!=""){
	        double nprice=Double.parseDouble(nprice1);
	        
	        double sell=Double.parseDouble(sell1);
	        TradeService ts = new TradeService();
	        STrade strade = new STrade();
	        strade.setName(name);
	        strade.setCode(code);
	        strade.setNprice(nprice);
	        strade.setSell(sell);
	        strade.setSnum(snum);
	        strade.setMnum(mnum);
	        strade.setWttime(wttime);
	        strade.setZt(zt);
	        boolean flag = ts.sellstock(strade);
	        Map<String, Object> map = TradeService.querytrade(code);
        if(flag) {
//        	byte[] taken1 = TokenProccessor.getInstance().makeToken();//��������
//        	String token1 = new String((byte[])taken1,StandardCharsets.UTF_8);
////        	System.out.println("��FormServlet�����ɵ�token��"+token);
//        	map.put("token1", token1);
//        	return map;
        	
        	request.setAttribute("map", map);
//        	System.out.print(snum-mnum);
//        	System.out.print(code);
        	request.getRequestDispatcher("trade.jsp").forward(request, response);
        	
        }else{
        	String msg="�����������۸������!!!";
        	map.put("msg1", msg);
//        	System.out.print(map);
        	request.setAttribute("map", map);
	    	request.getRequestDispatcher("trade.jsp").forward(request, response);
	    }
	}else {
		Map<String, Object> map = TradeService.querystrade(code);
		String msg="�����������۸������!!!";
		if(sell1 =="" || snum1=="") {
			map.put("msg1", msg);
		}
//		System.out.print(map);
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
