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

import com.osahub.thehouse.entity.Like;
import com.osahub.thehouse.entity.PictureDetails;

import static com.osahub.thehouse.dao.OfyService.ofy;

@SuppressWarnings("serial")
public class ModifyLike extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String picID = req.getParameter("picID");
		String uID = req.getParameter("uID");
		int valid = 0;
		JSONArray jArray = new JSONArray();
		PictureDetails pc = ofy().load().type(PictureDetails.class).id(picID).now();
		JSONObject count = new JSONObject();
		try {
			count.put("type", pc.getType());
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		List<Like> l = ofy().load().type(Like.class).filter("picID", picID).filter("uID", uID).list();
		Iterator<Like> lIt = l.iterator();
		if(lIt.hasNext())
			valid=1;
		res.getWriter().write(valid);
	}
}
