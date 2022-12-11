package jdbc_stock;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc_market.Stock;

/**
 * Servlet implementation class QueryAcount
 */
@WebServlet("/QueryStocks")
public class QueryStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1 ��ȡ��������
		String code = request.getParameter("code"); 
		// 2.���ݴ���
		List<Stock> stock = StockService.queryacount(code);

		// 3.��� ת��
		request.setAttribute("stock", stock);

		request.getRequestDispatcher("stock-Info.jsp").forward(request, response);
	}

}
