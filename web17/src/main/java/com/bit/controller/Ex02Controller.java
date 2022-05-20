package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewName=getServletConfig().getInitParameter("viewName");
		//String viewName=getInitParameter("viewName");
		String param1=this.getInitParameter("param1");
		String param2=this.getInitParameter("param2");
		System.out.println("web xml mapping servlet... Ex02 param1=:"+param1);
		System.out.println("web xml mapping servlet... Ex02 param2=:"+param2);
		
		System.out.println("------context------");
		String cparam1=req.getServletContext().getInitParameter("cname1");
		System.out.println("Ex02 context param: cname1="+cparam1);
		
		req.getRequestDispatcher(viewName+".jsp").forward(req, resp);
	}
}
