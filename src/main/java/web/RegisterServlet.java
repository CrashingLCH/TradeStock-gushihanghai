package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.InsertDB;
import jdbc.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
 
        //ת���ַ���
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String inputCode=request.getParameter("inputNum");
        String login_code=(String) request.getSession().getAttribute("checkcode");
        request.getSession().removeAttribute("checkcode");
        if(login_code.equalsIgnoreCase(inputCode)==true){
        InsertDB ud = new InsertDB();
        User u = new User();
 
        //����û��ύ�����ݵ����ݿ�
        u.setUsername(username);
        u.setPassword(password);
        u.setName(name);
        u.setEmail(email);
        //��������ת��Ӧҳ��
        boolean flag = ud.save(u);
        if(flag){
            //ע��ɹ�����ת
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("regist.jsp");
        }
	} else {
        request.setAttribute("cc_error","��֤�����");
    }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
