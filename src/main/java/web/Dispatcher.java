package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.User;
import jdbc_info.Qinfos;

/**
 * Servlet implementation class Dispatcher
 */
@WebServlet("/Dispatcher")
public class Dispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username =request.getParameter("username");
		List<User> nuser = Qinfos.query(username);
		String result=null;
		if(nuser!=null) {
		request.setAttribute("nuser", nuser);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			result="û�з����û���Ϣ";

			System.out.println(result);

			response.setContentType("text/html");//�������Ǵ��ص��ı���ʽΪhtml��ʽ

			response.getWriter().print(result);//����ʾ��Ϣ����ǰ��jspҳ��
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
