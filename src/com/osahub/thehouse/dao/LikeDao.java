package com.osahub.thehouse.dao;

import java.util.Iterator;
import java.util.List;

import com.osahub.thehouse.entity.Like;

import static com.osahub.thehouse.dao.OfyService.ofy;

public class LikeDao {
	//Add Like
	public static void addLike(String picID, String uID, String id) {
		Like l = new Like(picID,uID,id);
		ofy().save().entity(l).now();
	}
	
	//Delete Like
	public static void removeLike(String picID, String uID) {
		List<Like> com = ofy().load().type(Like.class).filter("picID", picID).filter("uID", uID).list();
		Iterator<Like> c = com.iterator();
		while(c.hasNext())
		{
			Like cd = c.next();
			ofy().delete().entity(cd).now();
		}
	}
}
