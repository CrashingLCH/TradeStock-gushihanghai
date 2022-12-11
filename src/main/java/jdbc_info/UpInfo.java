package jdbc_info;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import jdbc.User;

/**
 * Servlet implementation class UpAcount
 */
@WebServlet("/UpInfo")
@MultipartConfig
public class UpInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name"); 
        String email = request.getParameter("email");
        String sex = request.getParameter("sex");
        
        Part part = request.getPart("uploadImage");
        
        Date now = new Date();
		//日期格式化的类
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");
        String filename = sdf.format(now)+".jpg";
        part.write("e:/photo/"+filename);
        
        String username =request.getParameter("username");
//        System.out.println(username);
        InfoService up = new InfoService();
		
		User user = new User();
		
		user.setName(name);
		user.setEmail(email);
		user.setSex(sex);
		user.setImg(filename);
		user.setUsername(username);
		
		up.upInfo(user);
		//在请求中加上信息 
		List<User> nuser = Qinfos.query(username);
		request.setAttribute("nuser", nuser);
		//转发
		request.getRequestDispatcher("per-Info.jsp").forward(request, response);
	}

}
