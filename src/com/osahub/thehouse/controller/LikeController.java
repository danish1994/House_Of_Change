package com.osahub.thehouse.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.osahub.thehouse.dao.PictureDetailsDao.likeCount;
import static com.osahub.thehouse.dao.PictureDetailsDao.likeMinus;
import static com.osahub.thehouse.dao.LikeDao.addLike;
import static com.osahub.thehouse.dao.LikeDao.removeLike;

@SuppressWarnings("serial")
public class LikeController extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String likeStatus = req.getParameter("likeStatus");
		String picID = req.getParameter("picID");
		String uID = req.getParameter("uID");
		if (uID.equals("null")) {
			System.out.println("uID is NULL");
			res.sendRedirect("Single.jsp?picID=" + picID);
		} else {
			if (likeStatus.equals("no")) {
				likeCount(picID);
				DateFormat dateFormat = new SimpleDateFormat(
						"yyyy/MM/dd HH:mm:ss");
				Date date = new Date();
				String id = dateFormat.format(date);
				addLike(picID, uID, id + uID + picID);
			} else if (likeStatus.equals("yes")) {
				likeMinus(picID);
				removeLike(picID, uID);
			}
		}
		res.sendRedirect("Single.jsp?picID=" + picID);
	}

}
