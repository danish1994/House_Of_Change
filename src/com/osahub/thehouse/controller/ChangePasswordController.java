package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import static com.osahub.thehouse.dao.UserDetailsDao.modifyPassword;

@SuppressWarnings("serial")
public class ChangePasswordController extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		String uID = req.getParameter("uID");
		String pass = req.getParameter("pass");
		//Change Name
		modifyPassword(uID, pass);
		res.sendRedirect("/login-check");
	}
}
