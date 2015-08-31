package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.osahub.thehouse.dao.UserDetailsDao.validate;

@SuppressWarnings("serial")
public class CheckPasswordController extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String pass = req.getParameter("password");
		String uID = req.getParameter("uID");
		if(validate(uID,pass))
		{
			res.sendRedirect("Settings.jsp");
		}
		else
			res.sendRedirect("User.jsp");
	}
}
