package com.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestErrorControl
 */
@WebServlet("/testError")
public class TestErrorControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestErrorControl() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Xu ly bi loi -> return 500
		throw new ServletException("Loi 500 huhu !!!");
	}
}
