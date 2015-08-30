package com.osahub.thehouse.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.osahub.thehouse.entity.Comments;
import com.osahub.thehouse.entity.Like;
import com.osahub.thehouse.entity.PictureDetails;

import static com.osahub.thehouse.dao.OfyService.ofy;

@SuppressWarnings("serial")
public class LoadPicturesController extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		String type =  req.getParameter("type");
		String order = req.getParameter("order");
		JSONArray jArray = new JSONArray();
		DateFormat timeFormat = new SimpleDateFormat("dd/MM/YYYY");
		List<PictureDetails> det = ofy().load().type(PictureDetails.class).filter("type",type).filter("valid", true).order(order).list();
		Iterator<PictureDetails> pic = det.iterator();
		while(pic.hasNext())
		{
			PictureDetails pc = pic.next();
			JSONObject picDetails = new JSONObject();
			try {
				picDetails.put("picID", pc.getPicID());
				picDetails.put("tag", pc.getTag());
				picDetails.put("date", timeFormat.format(pc.getDate()));
				picDetails.put("likes", ofy().load().type(Like.class).filter("picID",pc.getPicID()).count());
				picDetails.put("commentCount", ofy().load().type(Comments.class).filter("picID",pc.getPicID()).count());
				picDetails.put("place", pc.getPlace());
			} catch (Exception e) {
				e.printStackTrace();
			}
			jArray.put(picDetails);
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
