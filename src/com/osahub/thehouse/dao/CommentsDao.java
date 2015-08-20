package com.osahub.thehouse.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.osahub.thehouse.entity.Comments;

import static com.osahub.thehouse.dao.OfyService.ofy;

public class CommentsDao {
	//Save Comment
	public static void save(String picID, String comments, String uID,
			String name,String id,Date date) {
		Comments com = new Comments(picID, comments, uID, name,id,date);
		ofy().save().entity(com);
		ofy().clear();
	}

	//Delete Comment
	public static void delete(String picID, String uID,String comment) {
		List<Comments> com = ofy().load().type(Comments.class).filter("comments", comment).filter("uID", uID).filter("picID",picID).list();
		Iterator<Comments> c = com.iterator();
		while(c.hasNext())
		{
			Comments cd = c.next();
			ofy().delete().entity(cd).now();
		}
	
	}

	//Modify Name in Comment
	public static void modifyName(String uID, String name) {
		Comments com=null;
		List<Comments> det = ofy().load().type(Comments.class).filter("uID", uID).list();
		Iterator<Comments> details = det.iterator();
		while (details.hasNext()) {
			com = details.next();
			com.setName(name);
			ofy().save().entity(com);
		}
	}
}
