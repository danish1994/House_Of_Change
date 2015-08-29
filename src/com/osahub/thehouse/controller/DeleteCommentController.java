package com.osahub.thehouse.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.osahub.thehouse.dao.CommentsDao.delete;

@SuppressWarnings("serial")
public class DeleteCommentController extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String id = req.getParameter("id");
		delete(id);
		System.out.println("Comment Deleted");
	}

}
