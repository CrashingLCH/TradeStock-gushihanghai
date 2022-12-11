package web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
 
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Code")
public class CheckCode extends HttpServlet {
 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int width = 80;
		
		int height = 25;

		String col = "ABCDEFGHIJKLMNPQRSTUVWSYZabcdefghijklmnpqrstuvwsyz123456789";
		
		StringBuffer s = new StringBuffer();
       BufferedImage bf = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);	
       Graphics2D gp = (Graphics2D) bf.getGraphics();
       //������ɫ��Ϊ��ɫ
       gp.fillRect(0, 0, width, height);
       for(int i = 0;i<4;i++){
    	   int rom = new Random().nextInt(col.length());
    	  String sum = String.valueOf(col.charAt(rom));
    	  s.append(sum);
    	  int r = new Random().nextInt(255);
    	  int g = new Random().nextInt(255);
    	  int b = new Random().nextInt(255);
    	  gp.setColor(new Color(r, g, b));
    	  
    	  gp.setFont(new Font("����",Font.ITALIC,20));
    	  
    	  int h = new Random().nextInt(3);
    	  gp.drawString(sum, 20+(10*i), 20+h);
       }
       //request����ֻ��һ�η��ʣ����Էŵ�session���棬ֻҪ���������ţ��Ϳ���һֱ��ȡ
       request.getSession().setAttribute("checkcode",s.toString());
       ImageIO.write(bf,"jpg", response.getOutputStream());
	}
      
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
          doGet(request, response);
	}
 
}

