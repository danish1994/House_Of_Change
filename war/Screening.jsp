<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.thehouse.entity.PictureDetails"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="static com.osahub.thehouse.dao.OfyService.ofy"%>
<%
try
{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="description"
	content="We are here to bring a change in the Society">
<meta name="robots" content="index, follow">
<meta name="author" content="Sociolizers">
<title>Screening</title>
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
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<div class="header-top">
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt="Menu">
					</span>
					<ul>
						<li><a href="index.html" class="color"><i
								class="glyphicon glyphicon-home"></i> </a></li>
						<li><a href="/shame" class="hvr-bounce-to-top">Hall of
								Shame</a></li>
						<li><a href="/change" class="hvr-bounce-to-top">Hall of
								Change</a></li>
						<li><a href="/fame" class="hvr-bounce-to-top">Hall of
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
			<h1>Screening</h1>
			<table>
				<tr>
					<td>
						<form action="/logout" method="post">
							<input class="btn btn-primary btn-lg" type="submit"
								value="Logout" />
						</form>
					</td>
					<td>
						<form action="Upload.jsp" method="post">
							<input class="btn btn-primary btn-lg" type="submit"
								value="Upload" />
						</form>
					</td>
					<td>
						<form action="VerifyPassword.jsp" method="post">
							<input class="btn btn-primary btn-lg" type="submit"
								value="Settings" />
						</form>
					</td>
				</tr>
			</table>

			<table class="table table-condensed">
				<tr>
					<td><b><strong>Icon</strong></b></td>
					<td><b><strong>Uploader Id</strong></b></td>
					<td><b><strong>Description</strong></b></td>
					<td><b><strong>Date of Upload</strong></b></td>
					<td><b><strong>Time of upload</strong></b></td>
					<td><b><strong>Accept/Reject</strong></b></td>
				</tr>
				<%
				String type=(String)session.getAttribute("Type");
				if(type.equals("admin"))
				{
				List<PictureDetails> det = ofy().load().type(PictureDetails.class).filter("valid", false).list();
				Iterator<PictureDetails> pic = det.iterator();
					while (pic.hasNext())
					{
						PictureDetails pd=pic.next();
						String tp=pd.getType();
				%>
				<tr>
					<td class="success"><a href="<%=pd.getPicID() %>" rel="title"><img
							src="<%=pd.getPicID() %>"
							style="width: 30px; height: 30px; border: 0"
							alt="<%=pd.getTag()%>"> </a></td>

					<td class="success"><%=pd.getuID()%></td>
					<td class="success"><%=pd.getDescription()%></td>
					<td class="success"><%=pd.getDate().toString() %></td>
					<td class="success"><%=pd.getTime()%></td>
					<td class="success">
						<form action="/screen-accept" method="post">
							<input class="btn btn-success" type="submit" value="Accept"
								style="width: 100%"> <input name="picID" type="hidden"
								value="<%=pd.getPicID()%>">
						</form>
						<form action="/screen-reject" method="post">
							<input class="btn btn-danger" type="submit" value="Reject"
								style="width: 100%"> <input name="picID" type="hidden"
								value="<%=pd.getPicID()%>">
						</form>
					</td>
				</tr>
				<%
						
					}
				}
					else
						response.sendRedirect("index.html");
				%>
			</table>
			<!--<h1></br> Or Sign Up</h1>
				<div class="contact-grids">
					<div class="contact-form">
							<form>
							<div class="contact-bottom" align="center">
									<div class="col-md-4 in-contact">
										<input type="text" placeholder="Name">
									</div>
									<div class="col-md-4 in-contact">
										<input type="text" placeholder="Email">
									</div>
									<div class="col-md-4 in-contact">
										<input type="text"  placeholder="Password">
									</div>
									<input type="submit" value="Sign Up" width="400" height="100">
								</div>
							</form>
						</div>
				</div>-->

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
						<li><a href="/shame" class="hvr-bounce-to-top">Hall of
								Shame</a></li>
						<li><a href="/change" class="hvr-bounce-to-top">Hall of
								Change</a></li>
						<li><a href="/fame" class="hvr-bounce-to-top">Hall of
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
<%
}catch(Exception e)
{
	response.sendRedirect("/login-check");
}
%>
