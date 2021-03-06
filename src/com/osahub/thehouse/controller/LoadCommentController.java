package com.osahub.thehouse.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.osahub.thehouse.entity.Comments;
import com.osahub.thehouse.entity.Like;
import com.osahub.thehouse.entity.PictureDetails;

import static com.osahub.thehouse.dao.OfyService.ofy;

@SuppressWarnings("serial")
public class LoadCommentController extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		String picID = req.getParameter("picID");
		JSONArray jArray = new JSONArray();
		PictureDetails pc = ofy().load().type(PictureDetails.class).id(picID).now();
		JSONObject count = new JSONObject();
		int like = ofy().load().type(Like.class).filter("picID", picID).count();
		pc.setLikes(like);
		ofy().save().entity(pc).now();
		try {
			count.put("like",like);
			count.put("comment", ofy().load().type(Comments.class).filter("picID",picID).filter("valid", true).count());
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		jArray.put(count);
		List<Comments> ls = ofy().load().type(Comments.class).filter("picID",picID).filter("valid",true).order("-date").list();
		Iterator<Comments> it = ls.iterator();
		while (it.hasNext()) {
			Comments c = it.next();
			JSONObject comment = new JSONObject();
			try {
				comment.put("comment", c.getComments());
				comment.put("name", c.getName());
				comment.put("uID", c.getuID());
				comment.put("id",c.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
			jArray.put(comment);
		}
		res.setContentType("application/JSON");
		try {
			//jArray.write(res.getWriter());
			res.getWriter().write(jArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
