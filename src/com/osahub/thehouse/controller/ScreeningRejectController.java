package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.*;

import static com.osahub.thehouse.dao.PictureDetailsDao.delete;

@SuppressWarnings("serial")
public class ScreeningRejectController extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String picID=req.getParameter("picID");
		delete(picID);
		res.sendRedirect("Screening.jsp");
	}
}
