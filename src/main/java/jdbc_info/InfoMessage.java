package jdbc_info;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.User;

@WebServlet("/InfoMessage")
public class InfoMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 String user=request.getParameter("username");
//		 System.out.println(user);
		 List<User> nuser = Qinfos.query(user);
		 request.getSession().setAttribute("nuser", nuser);
//		 System.out.println(nuser);
		response.sendRedirect("message.jsp");
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
