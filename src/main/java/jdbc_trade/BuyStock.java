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
//		boolean b = isRepeatSubmit(request);//判断用户是否是重复提交
//	    if(b==true){
////	         System.out.println("请不要重复提交");
//	         Map<String, Object> map = TradeService.queryktrade(code);
//			 String msg="请不要重复提交!!!";
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
        String zt = "成交";
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
	        	byte[] taken = TokenProccessor.getInstance().makeToken();//创建令牌
	        	String token = new String((byte[])taken,StandardCharsets.UTF_8);
//	        	System.out.println("在FormServlet中生成的token："+token);
	        	request.getSession().setAttribute("token", token);  //在服务器使用session保存token(令牌)
	        	request.setAttribute("map", map);
//	        	System.out.print(map);
	        	request.getRequestDispatcher("trade.jsp").forward(request, response);
	        	
	        }else{
	        	String msg="请输入购买价格和数量!!!";
	        	map.put("msg", msg);
	        	request.setAttribute("map", map);
		    	request.getRequestDispatcher("trade.jsp").forward(request, response);
		    }
		}else {
			Map<String, Object> map = TradeService.queryktrade(code);
			String msg="请输入购买价格和数量!!!";
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
//        //1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
//        if(client_token==null){
//            return true;
//        }
//        //取出存储在Session中的token
//        String server_token = (String) request.getSession().getAttribute("token");
//        //2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
//        if(server_token==null){
//            return true;
//        }
//        //3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
//        if(!client_token.equals(server_token)){
//            return true;
//        }
//
//        return false;
//    }
}
