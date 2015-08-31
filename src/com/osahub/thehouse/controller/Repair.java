package com.osahub.thehouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.osahub.thehouse.entity.Like;
import com.osahub.thehouse.entity.PictureDetails;

import static com.osahub.thehouse.dao.OfyService.ofy;

@SuppressWarnings("serial")
public class Repair extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		List<PictureDetails> ls = ofy().load().type(PictureDetails.class).list();
		Iterator <PictureDetails> it = ls.iterator();
		while(it.hasNext())
		{
			PictureDetails pd = it.next();
			String picID = pd.getPicID();
			int likeCount = ofy().load().type(Like.class).filter("picID",picID).count();
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println(picID+" - "+likeCount);
			pd.setLikes(likeCount);
			ofy().save().entity(pd);
		}
	}
}
