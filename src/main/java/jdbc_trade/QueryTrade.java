package jdbc_trade;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class QueryStock
 */
@WebServlet("/QueryTrade")
public class QueryTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1 获取输入数据
				String code = request.getParameter("code"); 
				// 2.数据处理
				
				Map<String, Object> map = TradeService.querytrade(code);
//				System.out.print(map);
				String cd = (String) map.get(code);
				if(cd=="") {
					map.put("msg", "您输入的代码不存在!!!");
					request.setAttribute("map", map);
					request.getRequestDispatcher("trade.jsp").forward(request, response);
				}else {
				// 3.输出 转发
				request.setAttribute("map", map);
//				System.out.print(map);
				request.getRequestDispatcher("trade.jsp").forward(request, response);
				}
	}

}
