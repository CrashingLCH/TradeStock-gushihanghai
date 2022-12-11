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
//		boolean b = isRepeatSubmit(request);//判断用户是否是重复提交
//	    if(b==true){
////	         System.out.println("请不要重复提交");
//	         Map<String, Object> map = TradeService.queryktrade(code);
//			 String msg="请不要重复提交!!!";
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
        String zt = "成交";
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat(" hh:mm:ss");//yyyy-MM-dd
//        System.out.println(snum);
        String wttime = dateFormat.format(date);
        int snum=Integer.parseInt(snum1);
        int mnum=Integer.parseInt(mnum1);
        // 更新trade的持仓数量
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
//        	byte[] taken1 = TokenProccessor.getInstance().makeToken();//创建令牌
//        	String token1 = new String((byte[])taken1,StandardCharsets.UTF_8);
////        	System.out.println("在FormServlet中生成的token："+token);
//        	map.put("token1", token1);
//        	return map;
        	
        	request.setAttribute("map", map);
//        	System.out.print(snum-mnum);
//        	System.out.print(code);
        	request.getRequestDispatcher("trade.jsp").forward(request, response);
        	
        }else{
        	String msg="请输入卖出价格和数量!!!";
        	map.put("msg1", msg);
//        	System.out.print(map);
        	request.setAttribute("map", map);
	    	request.getRequestDispatcher("trade.jsp").forward(request, response);
	    }
	}else {
		Map<String, Object> map = TradeService.querystrade(code);
		String msg="请输入卖出价格和数量!!!";
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
