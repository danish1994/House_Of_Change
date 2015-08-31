<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.thehouse.entity.PictureDetails"%>
<%@ page import="com.osahub.thehouse.entity.Comments"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String type=null;
	String uID=null;
	type = (String) session.getAttribute("Type");
	uID = (String) session.getAttribute("uID");
	if (type.equals("user")) {
%>
<meta charset="utf-8">
<meta name="description"
	content="We are here to bring a change in the Society">
<meta name="robots" content="index, follow">
<meta name="author" content="Sociolizers">
<title><%=session.getAttribute("Name")%></title>
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
<!--flexslider-->
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<!--//flexslider-->
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>
</head>
<body>
	<!--header-->
	<div class="header-user">
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
			<!-- 
			<div class="logo">
				<a href="index.html"><img src="images/faraz.jpg" height="200px"
					width="200px"> </a>
			</div>
			 -->
		</div>
	</div>
	<!--//header-->
	<!--content-->
	<div class="blog">
		<div class="container">
			<h1>
				Welcome
				<%=session.getAttribute("Name")%>
				to The House of Change
				<%
					} else
								response.sendRedirect("index.html");
				%>
				<h2></h2>
				<div class="sap_tabs">
					<div id="horizontalTab"
						style="display: block; width: 100%; margin: 0px;">
						<ul class="resp-tabs-list">
							<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>
									Uploaded Images</span></li>
							<b>/</b>
							<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Claimed
									Images</span></li>
							<b>/</b>
							<a href="Upload.jsp"><li class="resp-tab-item"><span>
										Upload Images</span></li></a>
							<b>/</b>
							<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>
									View Certificates</span></li>
							<b>/</b>
							<a href="VerifyPassword.jsp"><li class="resp-tab-item"><span>
										Settings</span></li></a>
							</li>
							<b>/</b>
							<a href="/logout">
								<li class="resp-tab-item"><span>Logout</span></li>
								</li>
							</a>
							<div class="clearfix"></div>
						</ul>
						<div class="resp-tabs-container">
							<div class="tab-0 resp-tab-content" aria-labelledby="tab_item-0">
								<div class="tab_img">
									<%
										List<PictureDetails> det = ofy().load().type(PictureDetails.class).filter("uID",uID).order("-date").list();
															Iterator<PictureDetails> pic = det.iterator();
																while (pic.hasNext())
																{
																	PictureDetails pd=pic.next();
																	String tp=pd.getType();
																	int commentCount = ofy().load().type(Comments.class).filter("picID",pd.getPicID()).count();
									%>
									<div class="col-md-4">
										<img src="<%=pd.getPicID()%>" class="img-responsive"
											alt="<%=pd.getTag()%>" style="height: 266px; width: 400px" />
										<div class="date">
											<table style="width: 100%;">
												<tr>
													<td><span class="date-in"><i
															class="glyphicon glyphicon-calendar"> </i><%=pd.getDate().toString()%></span></td>
													<td><span class="date-in"
														class="glyphicon glyphicon-cross"><%=pd.getLikes()%>
															shames</span></td>
													<td><a href="#" class="comments"><i
															class="glyphicon glyphicon-comment"></i><%=commentCount%></a></td>
												</tr>
											</table>
											<div class="clearfix"></div>
											<span class="date-in"><%=pd.getTag()%></span>
											<div class="clearfix"></div>
											<span class="date-in"><%=pd.getPlace()%></span>
										</div>
									</div>
									<%
										}
									%>
								</div>
							</div>
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
								<div class="tab_img">
									<%
										List<PictureDetails> detClaimed = ofy().load().type(PictureDetails.class).filter("claimID",uID).filter("claimStatus", true).order("-date").list();
										Iterator<PictureDetails> picClaimed = detClaimed.iterator();
										while (picClaimed.hasNext())
										{
											PictureDetails pd=picClaimed.next();
											int commentCount = ofy().load().type(Comments.class).filter("picID",pd.getPicID()).count();
									%>
									<div class="col-md-4">
										<img src="<%=pd.getPicID()%>" class="img-responsive"
											alt="<%=pd.getTag()%>" style="height: 266px; width: 400px" />
										<div class="date">
											<table style="width: 100%;">
												<tr>
													<td><span class="date-in"><i
															class="glyphicon glyphicon-calendar"> </i><%=pd.getDate()%></span></td>
													<td><span class="date-in"
														class="glyphicon glyphicon-cross"><%=pd.getLikes()%>
															shames</span></td>
													<td><a href="#" class="comments"><i
															class="glyphicon glyphicon-comment"></i><%=commentCount%></a></td>
												</tr>
											</table>
											<div class="clearfix"></div>
											<span class="date-in"><%=pd.getTag()%></span>
											<div class="clearfix"></div>
											<span class="date-in"><%=pd.getPlace()%></span>
										</div>
									</div>
									<%
										}
									%>
								</div>
							</div>
							<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-2">
								<div class="tab_img">
									<%
										List<PictureDetails> detCerti = ofy().load().type(PictureDetails.class).filter("uID",uID).order("-date").list();
										Iterator<PictureDetails> picCerti = detCerti.iterator();
										while (picCerti.hasNext())
										{
											PictureDetails pd=picCerti.next();
											String claimID =  pd.getClaimID();
											System.out.println(claimID);
											int commentCount = ofy().load().type(Comments.class).filter("picID",pd.getPicID()).count();
											if(claimID!=null)
											{
									%>
									<div class="col-md-4">
										<img src="<%=pd.getPicID()%>" class="img-responsive"
											alt="<%=pd.getTag()%>" style="height: 266px; width: 400px" />
										<div class="date">
											<table style="width: 100%;">
												<tr>
													<td><span class="date-in"><i
															class="glyphicon glyphicon-calendar"> </i><%=pd.getDate().toString()%></span></td>
													<td><span class="date-in"
														class="glyphicon glyphicon-cross"><%=pd.getLikes()%>
															likes</span></td>
													<td><a href="#" class="comments"><i
															class="glyphicon glyphicon-comment"></i><%=commentCount%></a></td>
												</tr>
											</table>
											<div class="clearfix"></div>
											<span class="date-in"><%=pd.getTag()%></span>
											<div class="clearfix"></div>
											<span class="date-in"><%=pd.getPlace()%></span>
										</div>
									</div>
									<%
											}
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</h1>
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