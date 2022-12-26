package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BO.UserBO;
import com.BO.UserBOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.common.MD5;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			UserBO userBO = new UserBOImpl();
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			password = (new MD5()).md5(password);
			User us = userBO.login(email, password);
			
			if (us.getName().equals("Admin")) {
				
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect(req.getContextPath()+"/admin/home.jsp");
				return;
			} else {
				
				if (us != null) 
				{
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else 
				{
					session.setAttribute("failedMsg", "Email & password Invalid");
					resp.sendRedirect("login.jsp");

				}

//				resp.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

