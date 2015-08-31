package com.osahub.thehouse.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.osahub.thehouse.entity.Like;
import com.osahub.thehouse.entity.PictureDetails;

import static com.osahub.thehouse.dao.OfyService.ofy;
import static com.osahub.thehouse.dao.PictureDetailsDao.likeCount;
import static com.osahub.thehouse.dao.PictureDetailsDao.likeMinus;
import static com.osahub.thehouse.dao.LikeDao.addLike;
import static com.osahub.thehouse.dao.LikeDao.removeLike;

@SuppressWarnings("serial")
public class LikeController extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String likeStatus = "no";
		String picID = req.getParameter("picID");
		String uID = null;
		HttpSession sess = req.getSession();
		try {
			uID = (String) sess.getAttribute("uID");
			List<Like> l = ofy().load().type(Like.class).filter("picID", picID)
					.filter("uID", uID).list();
			Iterator<Like> lIt = l.iterator();
			int count = ofy().load().type(Like.class).filter("picID", picID).count();
			if (lIt.hasNext())
				likeStatus = "yes";
			else
				likeStatus = "no";
			JSONArray jArray = new JSONArray();
			JSONObject json = new JSONObject();
			PictureDetails pc = ofy().load().type(PictureDetails.class)
					.id(picID).now();
			String type = pc.getType();
			if (type.equals("change"))
				type = "like";
			if (uID.equals(null)) {
				System.out.println("uID is NULL");
				try {
					json.put("likeType", "none");
				} catch (JSONException e) {
					e.printStackTrace();
				}
			} else {
				if (likeStatus.equals("no")) {
					likeCount(picID);
					DateFormat dateFormat = new SimpleDateFormat(
							"yyyy/MM/dd HH:mm:ss");
					Date date = new Date();
					String id = dateFormat.format(date);
					addLike(picID, uID, id + uID);
					try {
						json.put("likeType", "un" + type);
						json.put("likeCount", count + 1);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				} else if (likeStatus.equals("yes")) {
					likeMinus(picID);
					removeLike(picID, uID);
					try {
						json.put("likeType", type + "s");
						json.put("likeCount", count - 1);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
			}
			pc.setLikes(count);
			ofy().save().entity(pc).now();
			jArray.put(json);
			res.getWriter().write(jArray.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
