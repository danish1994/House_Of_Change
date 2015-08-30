package com.osahub.thehouse.controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

@SuppressWarnings("serial")
public class LoginCheckController extends HttpServlet {
	private HttpSession session;

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		session = req.getSession(true);
		if (!session.isNew()) {
			if (session.getAttribute("Type")==(null))
				res.sendRedirect("login.html");
			else {
				String type = (String) session.getAttribute("Type");
				if (type.equals("user"))
					res.sendRedirect("User.jsp");
				else if (type.equals("admin"))
					res.sendRedirect("Screening.jsp");

			}
		} else {
			res.sendRedirect("login.html");
		}
	}
}
