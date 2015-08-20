package com.osahub.thehouse.dao;

import static com.osahub.thehouse.dao.OfyService.ofy;

import java.util.Date;
import com.osahub.thehouse.entity.PictureDetails;

public class PictureDetailsDao {
	//Upload Picture
	public static void save(String picID, String uID, String tag, String place,
			String description, Date date, String time, boolean valid,
			String type) {
		PictureDetails pd = new PictureDetails(picID, uID, tag, place,
				description, date, time, valid, type);
		ofy().save().entity(pd);
		ofy().clear();
		System.out.println("Data Saved");
	}
	
	//Modify Status
	public static void modify(String picID, boolean valid) {
		PictureDetails pd = ofy().load().type(PictureDetails.class).id(picID)
				.now();
		pd.setValid(valid);
		ofy().save().entity(pd).now();
		ofy().clear();
		System.out.println("Data Updated");
	}
	
	//Delete Picture
	public static void delete(String picID) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		ofy().delete().entity(pd).now();
		ofy().clear();
		System.out.println("Data Deleted");
	}
	
	//Comment Count Up
	public static void commentCount(String picID) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		pd.setCommentsCount(pd.getCommentsCount()+1);
		ofy().save().entity(pd).now();
		System.out.println("Comment Count + 1");
	}
	
	//Comment Count Down
	public static void commentMinus(String picID) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		pd.setCommentsCount(pd.getCommentsCount()-1);
		ofy().save().entity(pd).now();
		System.out.println("Comment Count - 1");
	}
	
	//Like Count Up
	public static void likeCount(String picID) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		pd.setLikes(pd.getLikes()+1);
		ofy().save().entity(pd).now();
		System.out.println("Like Count + 1");
	}

	//Like Count Down
	public static void likeMinus(String picID) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		pd.setLikes(pd.getLikes()-1);
		ofy().save().entity(pd).now();
		System.out.println("Like Count - 1");
	}
	
	//View Count Up
	public static void viewCount(String picID) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		pd.setView(pd.getView()+1);
		ofy().save().entity(pd).now();
		System.out.println("View Count + 1");
	}
	
	//Claim a Picture
	public static void claim(String picID,String uID,String claimComment) {
		PictureDetails pd=ofy().load().type(PictureDetails.class).id(picID).now();
		pd.setClaimID(uID);
		pd.setClaimStatus(true);
		pd.setClaimComment(claimComment);
		pd.setType("change");
		ofy().save().entity(pd).now();
		System.out.println("Image Claimed");
	}	
}
