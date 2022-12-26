package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.common.MD5;
import com.entity.User;
import java.sql.Connection;
import java.sql.DriverManager;
@WebServlet("/register")
public class RegisterServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			User us=new User(0, name, email, password, phno);
			
			us.setPassword((new MD5()).md5(password));
			
			HttpSession session = req.getSession();
			
			
			if (check!=null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				
				boolean f2=dao.checkUer(email);
				if(f2) {
					boolean f=dao.userRegister(us);
					if(f=true) {
						//System.out.println("Insert success...");
						
						session.setAttribute("succMsg","Registration successfuly...");
						resp.sendRedirect("register.jsp");
					}else {
						//System.out.println("Error");
						session.setAttribute("failedMsg","Something wrong on server...");
						resp.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failedMsg","User already exist Try Another email id");
					resp.sendRedirect("register.jsp");
				}
				
			}else {
				//System.out.println("Please check agree to our term and conditions");
				session.setAttribute("succMsg","Please check agree to our term and conditions");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 
	
}
