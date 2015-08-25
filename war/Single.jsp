<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.thehouse.entity.PictureDetails"%>
<%@ page import="com.osahub.thehouse.entity.UserDetails"%>
<%@ page import="com.osahub.thehouse.entity.Like"%>
<%@ page import="com.osahub.thehouse.entity.Comments"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="static com.osahub.thehouse.dao.OfyService.ofy"%>
<%@ page
	import="static com.osahub.thehouse.dao.PictureDetailsDao.viewCount"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String picID = request.getParameter("picID");
	PictureDetails pd = ofy().load().type(PictureDetails.class).id(picID).now();
	String desc = pd.getDescription();
	String type = pd.getType();
	String tag = pd.getTag();
	Date date = pd.getDate();
	int like = pd.getLikes();
	int comments = pd.getCommentsCount();
	String likeStatus = "no";
	String likeType = null;
	String uID = null;
	DateFormat timeFormat = new SimpleDateFormat("dd/MM/YYYY");
	String showDate = timeFormat.format(date);
	try{
		uID = (String) session.getAttribute("uID");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	if(type.equals("shame"))
		likeType="shames";
	else if(type.equals("change"))
		likeType="likes";
	else if(type.equals("fame"))
		likeType="fames";
	
	List<Like> l = ofy().load().type(Like.class).filter("picID", picID).filter("uID", uID).list();
	Iterator<Like> lIt = l.iterator();
	if(lIt.hasNext())
	{
		likeStatus="yes";
		if(type.equals("shame"))
			likeType="unshame";
		else if(type.equals("change"))
			likeType="unlike";
		else if(type.equals("fame"))
			likeType="unfame";	
	}
	String likeLink = "/likeController?picID="+picID+"&uID="+uID+"&likeStatus="+likeStatus;
	//View Count
	viewCount(picID);
	//Website Link
	String link = "summertrainingosa.appspot.com";
%>
<meta charset="utf-8">
<meta name="description" content="<%=desc %>">
<meta name="robots" content="index, follow">
<meta name="author" content="Sociolizers">
<title><%= tag %></title>
<!-- Facebook Share -->
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=1453946961575719";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<!-- Facebook Share End-->

<!-- Twitter Share -->
<script>
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
				.test(d.location) ? 'http' : 'https';
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = p + '://platform.twitter.com/widgets.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'twitter-wjs');
</script>
<!-- Twitter Share End -->

<!-- Google Share -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Google Share End -->
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
	content="<%= tag %> <%= desc %> <%= showDate %> <% %>" />
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

	ga('create', 'UA-65737991-1', 'auto');
	ga('send', 'pageview');
</script>
<!--flexslider-->
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<!--//flexslider-->
</head>
<body>
	<!--header-->
	<div class="header"
		style="min-height: 0px; background: no-repeat center">
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
		</div>
	</div>
	<!--//header-->
	<!--content-->
	<div class="single">
		<div class="container">
			<div class="col-md-8 ">
				<div class=" single-grid" style="width: 150%">
					<a href="#"><img class="img-responsive" src="<%= picID  %>"
						alt="<%=tag%>" style="width: 100%" /></a>
					<div class="lone-line">
						<h4><%= tag %></h4>
						<div class="cal">
							<table style="width: 100%;">
								<tr>
									<td><span class="date-in"><i
											class="glyphicon glyphicon-calendar"><%= showDate %></i></span></td>
									<td><a href="<%=likeLink %>"> <span class="date-in"
											class="glyphicon glyphicon-cross"> <%= like %> <%=likeType %></span></a></td>
									<td><a href="#" class="comments"><i
											class="glyphicon glyphicon-comment"></i><%= comments%></a></td>
								</tr>
								<br />
								<br />
								<% 
								if(type.equals("shame")&&session.getAttribute("uID")!=null)
								{
								%>
								<tr>
									<td><a href="Petition.jsp?picID=<%=picID%>"><span
											class="date-in">Claim Image</span></a></td>
								</tr>
								<%
								}
								else if(type.equals("change"))
								{
									UserDetails ud = ofy().load().type(UserDetails.class).id(pd.getClaimID()).now();
								%>
								<tr>
									<td><a href="#"><span class="date-in">Claimed
												By: <%= ud.getName() %> (ID: <%=pd.getClaimID() %>)
										</span></a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td width="33%">
										<div class="fb-share-button"
											data-href="http://<%=link %>/Single.jsp?picID=<%=picID %>"
											data-layout="button_count"></div>
									</td>
									<td width="33%">
										<div class="g-plus" data-action="share"
											data-href="http://<%=link %>/Single.jsp?picID=<%=picID %>"></div>
									</td width="33%">
									<td><a href="http://twitter.com/share"
										class="twitter-share-button" align="left">Tweet</a></td>
								</tr>
							</table>
						</div>
						<p><%= desc %></p>
					</div>
				</div>
				<div class="single-bottom" style="width: 150%">
					<script>
						var length = 2;
						var l;
						var myArr;
						loadComment();
						function increaseLength()
						{
							length+=2;
							load(myArr)
						}
						function loadComment(){
							var xmlhttp = new XMLHttpRequest();
							var url = '/loadComment?picID='+'<%=picID%>';
							xmlhttp.onreadystatechange = function() {
								if (xmlhttp.readyState % 5 == 4 && xmlhttp.status == 200) {
									myArr = JSON.parse(xmlhttp.responseText);
									load(myArr);
								}
							}
							xmlhttp.open("GET", url, true);
							xmlhttp.send();
						}
						function load(arr) {
							var out = "";
							var i,l=length;
							if(length>arr.length)
								l=arr.length;
							for (i = 0; i < l; i++) {
								out += '<h4><b>'+arr[i].name+'</b></h4><p>'+arr[i].comment+'</p>';
								if(arr[i].uID=='<%=uID%>')
									out += '<form action="/deletecomment" method="post"> <input type="submit" value="Delete"> <input type="hidden" name="picID" value="'+'<%=picID%>'+'"> <input type="hidden" name="uID" value="'+'<%=uID%>'+'"> <input type="hidden" name="comment" value="'+arr[i].comment+'"></form><br />';
							}
							if(l>0)
								out+='<button class="btn btn-default" onClick="increaseLength()">Show More Comments</button>';
							else
								out+='<h4>No More Comments</h4>';		
							out+='<br />'
							document.getElementById("commentBox").innerHTML = out;
						}
						function addComment()
						{
							var comment = document.getElementById("commentBody").value;
							console.log(comment);
							document.getElementById("commentBody").value = "";
							var xmlhttp = new XMLHttpRequest();
							var url = '/comment?picID='+'<%=picID%>'+'&comment=' + comment;
							xmlhttp.open("GET", url, true);
							xmlhttp.send();
							loadComment();
							load(myArr);
						}
						function deleteComment() {

						}
					</script>
					<h3>Comments</h3>
					<br />
					<div id="commentBox"></div>
					<div class="clearfix"></div>
					<%
					if(session.getAttribute("uID")!=null)
					{
					%>
					<h3>Leave A Comment</h3>
					<div class="clearfix"></div>
					<textarea id="commentBody" placeholder="Enter Comment" rows="2"
						cols="100" name="comment" style="color: #000; background: #fff"></textarea>
					<button class="btn btn-default" onClick="addComment()">Submit</button>
					<%
					}
					else
					{
					%>
					<h3>
						Please <a href="/login-check">Login</a> to Comment
					</h3>
					<%
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