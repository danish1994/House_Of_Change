package com.osahub.thehouse.controller;

import org.json.JSONObject;
import org.json.JSONException;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class FacebookLoginController extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String code = req.getParameter("code");
		if (code == null || code.equals("")) {
			// an error occurred, handle this
		}
		PrintWriter out=res.getWriter();
		out.println("Starting");
		String token = null;
		try {
			String g = "https://graph.facebook.com/oauth/access_token?client_id=1453946961575719&redirect_uri="
					+ URLEncoder.encode(
							"http://summertrainingosa.appspot.com/fblogin",
							"UTF-8")
					+ "&client_secret=0905a50e3273ea7a6c0080a71f1ab154&code=" + code;
			URL u = new URL(g);
			URLConnection c = u.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					c.getInputStream()));
			String inputLine;
			StringBuffer b = new StringBuffer();
			while ((inputLine = in.readLine()) != null)
				b.append(inputLine + "\n");
			in.close();
			token = b.toString();
			if (token.startsWith("{"))
				throw new Exception("error on requesting token: " + token
						+ " with code: " + code);
			out.println("Try 1");
		} catch (Exception e) {
			out.println("Catch 1");
			e.printStackTrace();
		}

		String graph = null;
		try {
			String g = "https://graph.facebook.com/me?" + token;
			URL u = new URL(g);
			URLConnection c = u.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					c.getInputStream()));
			String inputLine;
			StringBuffer b = new StringBuffer();
			while ((inputLine = in.readLine()) != null)
				b.append(inputLine + "\n");
			in.close();
			graph = b.toString();
			out.println("Try 2");
		} catch (Exception e) {
			out.println("Catch 2");
			e.printStackTrace();
		}

		String facebookId;
		String firstName;
		String middleNames;
		String lastName;
		String email;
		try {
			JSONObject json = new JSONObject(graph);
			out.println(json.toString());
			facebookId = json.getString("id");
			firstName = json.getString("first_name");
			if (json.has("middle_name"))
				middleNames = json.getString("middle_name");
			else
				middleNames = null;
			if (middleNames != null && middleNames.equals(""))
				middleNames = null;
			lastName = json.getString("last_name");
			email = json.getString("email");
			out.println(facebookId);
			out.println(firstName);
			out.println(lastName);
			out.println(email);
			System.out.println(facebookId);
			System.out.println(firstName);
			System.out.println(lastName);
			System.out.println(email);
		} catch (JSONException e) {
			out.println("Catch 3");
			e.printStackTrace();
		}
	}
}