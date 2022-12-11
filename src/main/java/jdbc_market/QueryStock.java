package jdbc_market;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import paging.Page;
import paging.PageService;

/**
 * Servlet implementation class QueryStock
 */
@WebServlet("/QueryStock")
public class QueryStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// ����ҳ����������
		response.setContentType("text/html; charset=UTF-8");
		// 2.���ݴ���
		int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
		// ͨ��pageʵ��������ҳ���������3Ϊÿҳ��Ŀ
		int pageSize = 20;
		int totalPage = PageService.getTotalPage(pageSize);
//		System.out.println(totalPage);
		// ǰһҳҳ������һҳ����ֵ
		int prePage = start - pageSize >= 0 ? start - pageSize : 0;
		int nextPage = start + pageSize <= totalPage*pageSize ? start + pageSize : 380;
		// ʹ��request.setAttribute��������ҳ����ʹ��el�﷨
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("prePage", prePage);
		request.setAttribute("nextPage", nextPage);
//		  System.out.println(nextPage);
		// ��õ�ǰҳ������
		Page pg1 = new Page(start, pageSize);

		Map<String, Object> map = StockService.QueryStock(pg1);
		if(map!=null) {
			request.setAttribute("map", map);
			request.getRequestDispatcher("market-center.jsp").forward(request, response);
		}else {
			System.out.println("����ʧ��");
		}
	}

}
