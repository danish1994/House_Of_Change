package com.osahub.thehouse.dao;

import java.util.Iterator;
import java.util.List;

import com.osahub.thehouse.entity.UserDetails;

import static com.osahub.thehouse.dao.OfyService.ofy;

public class UserDetailsDao {
	static UserDetails ud=null;
	//Register
	//Add a User
	public static boolean save(String uID, String name, String pass, String type,
			Boolean status, String source) {
		if (check(uID)) {
			UserDetails user = new UserDetails(uID, name, pass, type, status,source);
			ofy().save().entity(user);
			ofy().clear();
			System.out.println("Data Saved");
			return true;
		}
		else
			return false;
	}
	
	//Check Existing User
	public static boolean check(String uID) {
		List<UserDetails> det = ofy().load().type(UserDetails.class)
				.filter("uID", uID).list();
		Iterator<UserDetails> details = det.iterator();
		if (details.hasNext())
			return false;
		else
			return true;
	}
	
	//Login
	//Validate Details
	public static boolean validate(String uID, String pass) {
		boolean res = true;
		List<UserDetails> det = ofy().load().type(UserDetails.class).list();
		Iterator<UserDetails> details = det.iterator();
		res=details.hasNext();
		while (details.hasNext()) {
			ud = details.next();
			if (ud.getuID().equals(uID) && ud.getPass().equals(pass)) {
				res = true;
				break;
			} else
				res = false;
		}
		return res;
	}
	
	//Modify Name
	public static void modifyName(String uID,String name)
	{
		UserDetails ud = ofy().load().type(UserDetails.class).id(uID).now();
		ud.setName(name);
		ofy().save().entity(ud).now();
		ofy().clear();
		System.out.println("Name Changed");
	}
	
	//Modify Password
	public static void modifyPassword(String uID,String pass)
	{
		UserDetails ud = ofy().load().type(UserDetails.class).id(uID).now();
		ud.setPass(pass);
		ofy().save().entity(ud).now();
		ofy().clear();
		System.out.println("Password Changed");
	}

	//Return Name
	public static String getName() {
		return ud.getName();
	}
	
	//Return User Type
	public static String getType() {
		return ud.getType();
	}
	
	//Return Claim Name
	public static String getSavedName(String uID) {
		UserDetails ud = ofy().load().type(UserDetails.class).id(uID).now();
		return ud.getName();
	}
}