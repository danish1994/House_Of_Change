package com.osahub.thehouse.dao;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;


public class OfyService {
    //Loading Entity Classes
	static {
        factory().register(com.osahub.thehouse.entity.UserDetails.class);
        factory().register(com.osahub.thehouse.entity.PictureDetails.class);
        factory().register(com.osahub.thehouse.entity.Comments.class);
        factory().register(com.osahub.thehouse.entity.Like.class);
        factory().register(com.osahub.thehouse.entity.ForgotUser.class);
    }
	
	//Return Objectify
    public static Objectify ofy() {
        return ObjectifyService.ofy();
    }

    //Register Factory
    public static ObjectifyFactory factory() {
        return ObjectifyService.factory();
    }
}