package com.osahub.thehouse.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import static com.osahub.thehouse.dao.UserDetailsDao.validate;
import static com.osahub.thehouse.dao.UserDetailsDao.getName;
import static com.osahub.thehouse.dao.UserDetailsDao.getType;

@SuppressWarnings("serial")
public class LoginController extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		String uID=req.getParameter("Email");
		String pass=req.getParameter("Password");
		if(validate(uID,pass))
		{
			System.out.println("Valid");
			HttpSession sess=req.getSession();
			sess.setAttribute("Name",getName());
			sess.setAttribute("Type",getType());
			sess.setAttribute("uID",uID);
			String type=getType();
			if(type.equals("admin"))
				res.sendRedirect("Screening.jsp");
			else
				res.sendRedirect("User.jsp");
		}
		else
			res.sendRedirect("/login-invalid.html");
	}
}
