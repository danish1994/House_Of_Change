package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.*;

import static com.osahub.thehouse.dao.UserDetailsDao.save;

@SuppressWarnings("serial")
public class AddAdmin extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		//Save Default Admin
		save("admin", "admin", "admin", "admin", true, "form");
	}
}
