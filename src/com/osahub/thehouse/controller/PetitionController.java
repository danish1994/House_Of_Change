package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.osahub.thehouse.dao.PictureDetailsDao.claim;

@SuppressWarnings("serial")
public class PetitionController extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String uID = req.getParameter("uID");
		String picID = req.getParameter("picID");
		String claimComment = req.getParameter("claimComment");
		claim(picID,uID,claimComment);
		res.sendRedirect("Shame.jsp");
	}

}
