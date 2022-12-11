package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.InsertDB;
import jdbc.User;
import jdbc_info.Qinfos;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
        String user=request.getParameter("username");
        String password=request.getParameter("password");
        String inputCode=request.getParameter("inputNum");
        String login_code=(String) request.getSession().getAttribute("checkcode");
        request.getSession().removeAttribute("checkcode");
        if(login_code.equalsIgnoreCase(inputCode)==true){
            //调用UserDao、UserDaoImpl类及方法
            InsertDB ud = new InsertDB();
            //处理结果跳转相应页面
            boolean flag = ud.checkLogin(user, password);
            if(flag){
            	//从数据库中读取name
//            	System.out.print(user);
            	List<User> nuser = Qinfos.query(user);
//            	System.out.print(nuser);         	
                //用户名存入session，前台登录成功页面调取
            	request.getSession().setAttribute("nuser", nuser);
    			response.sendRedirect("index.jsp");
    			return;
            }else{
                response.sendRedirect("regist.jsp");
                response.getWriter().println("<font style='color:red;font-size:40'>用户名或密码错误</font>");
            }
        }
        else {
        	response.getWriter().println("<font style='color:red;font-size:40'>验证码错误！</font>");
            request.setAttribute("cc_error","验证码错误");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}