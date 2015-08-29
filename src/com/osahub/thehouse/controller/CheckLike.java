package com.osahub.thehouse.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.osahub.thehouse.entity.Like;

import static com.osahub.thehouse.dao.OfyService.ofy;

@SuppressWarnings("serial")
public class CheckLike extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String picID = req.getParameter("picID");
		String uID = req.getParameter("uID");
		int valid = 0;
		List<Like> l = ofy().load().type(Like.class).filter("picID", picID).filter("uID", uID).list();
		Iterator<Like> lIt = l.iterator();
		if(lIt.hasNext())
			valid=1;
		res.getWriter().write(valid);
	}
}
