package com.osahub.thehouse.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;

import static com.osahub.thehouse.dao.PictureDetailsDao.save;

@SuppressWarnings("serial")
public class UploadController extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		String tag = req.getParameter("Tag");
		String place = req.getParameter("Place");
		String description = req.getParameter("Description");
		String uID = (String) session.getAttribute("uID");
		String type = (String) session.getAttribute("Type");
		String picType = null;
		boolean valid = false;
		DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		Date today = Calendar.getInstance().getTime();
		Date date = new Date();
		String time = timeFormat.format(today);
		//Blob Store Start
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
        List<BlobKey> blobKeys = blobs.get("pic");
        BlobKey blobKey = new BlobKey(blobKeys.get(0).getKeyString());
        System.out.println(blobKey);
        ImagesService imagesService = ImagesServiceFactory.getImagesService();
        @SuppressWarnings("deprecation")
		String picID =  imagesService.getServingUrl(blobKey);
        //Blob Store End
		if (type.equals("admin")) {
			picType = "fame";
			valid = true;
		} else
			picType = "shame";
		//Save Picture
		save(picID, uID, tag, place, description, date, time, valid, picType);
		res.sendRedirect("/login-check");
	}
}
