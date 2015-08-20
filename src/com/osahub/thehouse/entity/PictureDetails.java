package com.osahub.thehouse.entity;

import java.util.Date;

import com.googlecode.objectify.annotation.*;

@Entity
public class PictureDetails {
	@Id
	String picID;
	@Index
	String uID;
	String tag;
	String place;
	String description;
	@Index
	Date date;
	String time;
	@Index
	boolean valid;
	@Index
	String type;
	@Index
	int likes;
	int commentsCount;
	@Index
	String claimID;
	@Index
	boolean claimStatus;
	String claimComment;
	@Index
	long view;

	public PictureDetails() {
		super();
	}

	public PictureDetails(String picID, String uID, String tag, String place,
			String description, Date date, String time, boolean valid,
			String type) {
		super();
		this.picID = picID;
		this.uID = uID;
		this.tag = tag;
		this.place = place;
		this.description = description;
		this.date = date;
		this.time = time;
		this.valid = valid;
		this.type = type;
		likes = 0;
		commentsCount = 0;
		claimID = null;
		claimStatus = false;
		claimComment = null;
		view=0;
	}

	public String getClaimComment() {
		return claimComment;
	}

	public void setClaimComment(String claimComment) {
		this.claimComment = claimComment;
	}

	public String getPicID() {
		return picID;
	}

	public void setPicID(String picID) {
		this.picID = picID;
	}

	public String getuID() {
		return uID;
	}

	public void setuID(String uID) {
		this.uID = uID;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getCommentsCount() {
		return commentsCount;
	}

	public void setCommentsCount(int commentsCount) {
		this.commentsCount = commentsCount;
	}

	public String getClaimID() {
		return claimID;
	}

	public void setClaimID(String claimID) {
		this.claimID = claimID;
	}

	public boolean isClaimStatus() {
		return claimStatus;
	}

	public void setClaimStatus(boolean claimStatus) {
		this.claimStatus = claimStatus;
	}

	public long getView() {
		return view;
	}

	public void setView(long view) {
		this.view = view;
	}

}