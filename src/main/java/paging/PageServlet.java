package paging;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PageServlet
 */
@SuppressWarnings("serial")
@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet { 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
//		  System.out.println("welcome");
		  int start=request.getParameter("start")==null?0:Integer.parseInt(request.getParameter("start"));
		  //通过page实现类获得总页数，这里的3为每页数目
		  int pageSize=20;		  
		  int totalPage=PageService.getTotalPage(pageSize); 
//		  System.out.println(totalPage);
		  //前一页页数、后一页变量值
		  int prePage=start-1>0?start-1:start+1;
		  int nextPage=start+1<totalPage?start+1:totalPage-1;
		  //使用request.setAttribute方法便于页面中使用el语法
		  request.setAttribute("totalPage", totalPage);
		  request.setAttribute("prePage", prePage); 
		  request.setAttribute("nextPage", nextPage);
//		  System.out.println(nextPage);
		  //获得当前页的数据
		  Page pg1=new Page(start,pageSize);
//		  System.out.println(start);
		  Map<String,Object> map = PageService.queryStockByPage(pg1);
		  if(map!=null) {
				 request.setAttribute("map", map);
//				 System.out.println(map);
				 request.getRequestDispatcher("page.jsp").forward(request, response);
		  }else {
				 System.out.println("操作失败");
		  		
		  	}
	}
 
}
