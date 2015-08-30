package com.osahub.thehouse.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import static com.osahub.thehouse.dao.UserDetailsDao.save;

@SuppressWarnings("serial")
public class RegisterController extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		String name = req.getParameter("Name");
		String uID = req.getParameter("Email");
		String pass = req.getParameter("Password");
		if (save(uID, name, pass, "user", true, "form")) {
			//Send Welcome Mail
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);
			String msgBody = "Hello "
					+ name
					+ ".\nYou are successfully register on The House of Change.\n\nThe Details Given are:\n\nEmail: "
					+ uID + "\nPassword: " + pass + ".";
			Message msg = new MimeMessage(session);
			try {
				msg.setFrom(new InternetAddress("thehouseofchnage@gmail.com",
						"The House of Change"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						uID, name));
				msg.setSubject("Registration Successful");
				msg.setText(msgBody);
				Transport.send(msg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			res.sendRedirect("register-complete.html");
		} else
			res.sendRedirect("register-invalid.html");
	}
}
