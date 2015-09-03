<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.up {
	width: 100em;
	height: 10em;
}

.box {
	width: 80em;
	height: 40em;
}
</style>
<meta charset="utf-8">
<meta name="description"
	content="We are here to bring a change in the Society">
<meta name="robots" content="index, follow">
<meta name="author" content="Sociolizers">
<title>Upload</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Whizz Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
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
<%
	if (session.isNew()) {
		session.invalidate();
		response.sendRedirect("/login-check");
	}
%>
</head>
<body>
	<!--header-->
	<div class="header-upload">
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



			</div>
			<divclass"up"> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h1>
				<b><center>UPLOAD YOUR IMAGE</center></b>
			</h1>
			<br>
			<br>
			<br>

			<div class="box"
				style="background: rgba(0, 0, 0, 0.8); border: dashed; border-radius: 25px; color: white;">
				<center>
					<table class="about-top" align="center">
						<tr>
							<td colspan=2></br> </br> <%
 	BlobstoreService blobstoreService = BlobstoreServiceFactory
 			.getBlobstoreService();
 %>
								<form action="<%=blobstoreService.createUploadUrl("/upload")%>"
									method="post" enctype="multipart/form-data">
									<h3>Choose file:</h3>
									</br>
									<p>
										<input type="file" name="pic" />
									</p>
									</br> </br></td>
						</tr>
						<tr>
							<td><h3>Tag</h3></td>
							<td><h3>Place</h3></td>
						</tr>
						<tr>

							<td><input type="text" name="Tag" size="50"
								style="color: #000; background: #fff"></td>
							<td><input type="text" name="Place" size="50"
								style="color: #000; background: #fff"></td>
						</tr>
						<tr>
							<td colspan=2>
								<h3>Description</h3>
							</td>
						</tr>
						<tr>
							<td colspan=2><textarea name="Description" rows="10" cols="100"
									style="color: #000; background: #fff"></textarea><br></td>
						</tr>
						<tr>
							<td colspan=2><input type="submit" name="submit"
								class="btn btn-warning btn-lg" value="Upload"
								style="width: 100%;" align="center" action="/uploadform" />
								</form></td>
						</tr>
					</table>
					</p>
					 
				</center>
			</div>
		</div>
		<!--//header-->
		<!--content-->
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