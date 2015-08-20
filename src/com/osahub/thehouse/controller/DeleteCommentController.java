package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.osahub.thehouse.dao.CommentsDao.delete;
import static com.osahub.thehouse.dao.PictureDetailsDao.commentMinus;

@SuppressWarnings("serial")
public class DeleteCommentController extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String picID = req.getParameter("picID");
		String uID = req.getParameter("uID");
		String comment = req.getParameter("comment");
		//Comment Delete
		delete(picID,uID,comment);
		commentMinus(picID);
		System.out.println("Comment Deleted");
		res.sendRedirect("Single.jsp?picID=" + picID);
	}

}
