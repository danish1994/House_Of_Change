package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.osahub.thehouse.dao.UserDetailsDao;
import com.osahub.thehouse.dao.CommentsDao;

@SuppressWarnings("serial")
public class ChangeNameController extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		String uID = req.getParameter("uID");
		String name = req.getParameter("name");
		HttpSession session = req.getSession(false);
		session.setAttribute("Name",name);
		//Change Password
		UserDetailsDao.modifyName(uID, name);
		CommentsDao.modifyName(uID,name);
		res.sendRedirect("/login-check");
	}
}
