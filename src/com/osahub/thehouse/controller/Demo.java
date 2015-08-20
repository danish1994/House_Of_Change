package com.osahub.thehouse.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.osahub.thehouse.entity.PictureDetails;
import static com.osahub.thehouse.dao.OfyService.ofy;;

@SuppressWarnings("serial")
public class Demo extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		List<PictureDetails> det = ofy().load().type(PictureDetails.class).filter("valid", true).filter("type","fame").order("-date").list();
		Iterator<PictureDetails> pic = det.iterator();
			while (pic.hasNext())
			{
				PictureDetails pd=pic.next();
				System.out.println(pd.getPicID());
				System.out.println(pd.getType());
				System.out.println(pd.getDate());
			}
	}

}
