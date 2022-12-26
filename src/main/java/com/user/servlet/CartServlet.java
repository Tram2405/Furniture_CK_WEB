package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.ProductDtls;
import com.entity.cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pid = Integer.parseInt(req.getParameter("pid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
            ProductDtls p=dao.getProductById(pid); 
            
			
			cart c = new cart();
			c.setPid(pid);
			c.setUid(uid);
			c.setProductName(p.getProductName());
			c.setMakein(p.getMakein());
			c.setPrice(Double.parseDouble(p.getPrice().replaceAll("[.]", "")));
			c.setTotalPrice(Double.parseDouble(p.getPrice().replaceAll("[.]", "")));
			
			
			CartDAOImpl dao1=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao1.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Product added to cart");
				
				resp.sendRedirect("all_living_room.jsp");
//				resp.sendRedirect("404page.jsp");
			}else {
				session.setAttribute("failed", "Something wrong server");
				resp.sendRedirect("404page.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
}
