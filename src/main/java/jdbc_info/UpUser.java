package jdbc_info;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.InsertDB;

/**
 * Servlet implementation class UpUser
 */
@WebServlet("/UpUser")
public class UpUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//����ҳ����������
		response.setContentType("text/html; charset=UTF-8");
		String username = request.getParameter("username"); 
		String opassword = request.getParameter("opassword"); 
		String npassword = request.getParameter("npassword");
		String cpassword = request.getParameter("cpassword");
		InsertDB us = new InsertDB();
		boolean flag = us.checkLogin(username, opassword);
		if(npassword.equalsIgnoreCase(cpassword)==true) {
			if(flag) {
//				 InfoService up = new InfoService();	
//				 User user = new User();
//				 user.setPassword(npassword);
//				 user.setUsername(username);
//				 up.upUser(user);
//				//�������м�����Ϣ 
//				List<User> nuser = Qinfos.query(username);
//				request.setAttribute("nuser", nuser);
				//ת��
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else {
				
				response.getWriter().println("<font style='color:red;font-size:40'>���������</font>");
			}
		}else {
			response.getWriter().println("<font style='color:red;font-size:40'>������������벻һ�£�</font>");
		}
	}

}
