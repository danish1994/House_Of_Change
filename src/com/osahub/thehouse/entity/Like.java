package com.osahub.thehouse.entity;

import com.googlecode.objectify.annotation.*;

@Entity
public class Like {
	@Index
	String picID;
	@Index
	String uID;
	@Id
	String id;
	public Like() {
		super();
	}
	public Like(String picID, String uID, String id) {
		super();
		this.picID = picID;
		this.uID = uID;
		this.id = id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
