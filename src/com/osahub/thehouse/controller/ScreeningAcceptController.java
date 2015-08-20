package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.*;

import static com.osahub.thehouse.dao.PictureDetailsDao.modify;

@SuppressWarnings("serial")
public class ScreeningAcceptController extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String picID=req.getParameter("picID");
		modify(picID,true);
		res.sendRedirect("Screening.jsp");
	}
}
