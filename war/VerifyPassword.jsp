<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.thehouse.entity.ForgotUser"%>
<%@ page import="com.osahub.thehouse.entity.UserDetails"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="static com.osahub.thehouse.dao.OfyService.ofy"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="description"
	content="We are here to bring a change in the Society">
<meta name="robots" content="index, follow">
<meta name="author" content="Sociolizers">
<title>Verify Password</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- tom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-65737991-2', 'auto');
	ga('send', 'pageview');
</script>
</head>
<%
	String uID = (String)session.getAttribute("uID");
	UserDetails ud = (UserDetails)ofy().load().type(UserDetails.class).id(uID).now();
%>
<body>
	<!--header-->
	<div class="header-login">
		<div class="container">
			<div class="header-top">
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt="Menu">
					</span>
					<ul>
						<li><a href="index.html" class="color"><i
								class="glyphicon glyphicon-home"></i> </a></li>
						<li><a href="/shame.html" class="hvr-bounce-to-top">Hall of
								Shame</a></li>
						<li><a href="/change.html" class="hvr-bounce-to-top">Hall of
								Change</a></li>
						<li><a href="/fame.html" class="hvr-bounce-to-top">Hall of
								Fame</a></li>
						<li><a href="about.html" class="hvr-bounce-to-top">About
						</a></li>
						<li><a href="/login-check" class="hvr-bounce-to-top">Login</a></li>
					</ul>
					<!--script-->
					<script>
						$("span.menu").click(function() {
							$(".top-nav ul").slideToggle(500, function() {
							});
						});
					</script>
				</div>
				<div class="search-in">
					<div class="search">
						<form>
							<input type="text" class="text"> <input type="submit"
								value="SEARCH">
						</form>
						<div class="close-in">
							<img src="images/close.png" alt="Close" />
						</div>
					</div>
					<div class="right">
						<button></button>
					</div>
				</div>
				<script type="text/javascript">
					$('.search').hide();
					$('button').click(function() {
						$('.search').show();
						$('.text').focus();
					});
					$('.close-in').click(function() {
						$('.search').hide();
					});
				</script>
				<div class="clearfix"></div>
			</div>
			<div class="logo">
				<!--<a href="index.html"><img src="images/logo.png" alt="">	</a>-->
			</div>
		</div>
	</div>
	<!--//header-->
	<!--content-->
	<div class="contact">
		<div class="container">
			<h1>Verify Password</h1>
			<div class="contact-grids">
				<div class="contact-form">
					<br />
					<%
						if(ud.getSource().equals("form"))
						{
					%>
					<form action="/checkPassword" method="post">
						<div class="contact-bottom" align="center">
							<div class="col-md-4 in-contact" style="width: 70%">
								<input type="password" name="password"
									placeholder="Enter Password"
									style="color: #000; background: #fff">
								<input type="hidden" name="uID" value="<%=uID %>">
							</div>
							<button type="submit" class="btn btn-primary btn-lg"
								style="width: 30%;">Submit</button>
						</div>
					</form>
					<%
						}
						else
						{
							response.sendRedirect("Settings.jsp");
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<!--//content-->
	<div class="footer">
		<div class="container">
			<div class="footer-class">
				<div class="col-md-10 class-footer">
					<ul>
						<li><a href="index.html" class="color"><i
								class="glyphicon glyphicon-home"></i> </a></li>
						<li><a href="/shame.html" class="hvr-bounce-to-top">Hall of
								Shame</a></li>
						<li><a href="/change.html" class="hvr-bounce-to-top">Hall of
								Change</a></li>
						<li><a href="/fame.html" class="hvr-bounce-to-top">Hall of
								Fame</a></li>
						<li><a href="about.html" class="hvr-bounce-to-top">About
						</a></li>
						<li><a href="/login-check" class="hvr-bounce-to-top">Login</a></li>
						<li><a href="faq.html" class="hvr-bounce-to-top">FAQ</a></li>
						<li><a href="testimonial.html" class="hvr-bounce-to-top">Testimonial</a></li>
					</ul>
					<p class="footer-grid">
						©<a href="index.html"> The House of Change</a>
					</p>
				</div>
				<div class="col-md-2">
					<ul class="social">
						<li><a href="https://twitter.com/houseof_change"><i>
							</i></a></li>
						<li><a
							href="https://www.facebook.com/pages/The-House-Of-Change/1464480190541323"><i
								class="facebook"> </i></a></li>
						<li><a href="https://plus.google.com/105308104911128583880/"><i
								class="google"> </i></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>