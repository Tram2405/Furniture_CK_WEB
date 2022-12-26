package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.ProductDtls;
@MultipartConfig
@WebServlet("/add_products")
public class ProductsAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String productName= req.getParameter("bname");
			String makein= req.getParameter("makein");
			String price=req.getParameter("price");
			String categories=req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			ProductDtls p = new ProductDtls(productName, makein, price, categories, status, fileName, "admin");
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			
		
			boolean fa =dao.addProducts(p);
			System.out.println(fa);
			HttpSession session=req.getSession();
			
			if(fa) {
				String path = getServletContext().getRealPath("") + "product";
				File f = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Product Add Successfully");
				resp.sendRedirect("admin/add_products.jsp");
			}else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_products.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
