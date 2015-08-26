<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.thehouse.entity.PictureDetails"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="static com.osahub.thehouse.dao.OfyService.ofy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% DateFormat timeFormat = new SimpleDateFormat("dd/MM/YYYY"); %>
<meta charset="utf-8">
<meta name="description"
	content="We are here to bring a change in the Society">
<meta name="robots" content="index, follow">
<meta name="author" content="Sociolizers">
<title>Hall of Shame</title>
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
<!--script-->
<script src="js/jquery.chocolat.js"></script>
<link rel="stylesheet" href="css/chocolat.css" type="text/css"
	media="screen" charset="utf-8">
<!--light-box-files -->
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('.img-top a').Chocolat();
	});
</script>

</head>
<body>
	<!--header-->
	<div class="header-shame">
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
	<div class="portfolio">
		<div class="container">
			<div class="portfolio-top ">
				<h1>Hall of Shame</h1>
			</div>
			<div class="sap_tabs">

				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>newest</span></li>
						<b>/</b>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>trending</span></li>
						<b>/</b>
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>most
								viewed</span></li>
					</ul>
					<script>
					var length = 9;
					var l;
					var newest,trending,viewes;
					loadPicturesNewest();
					loadPicturesTrending();
					loadPicturesMostViewed();
					function increaseLength()
					{
						length+=9;
						showNewest(newest);
						showTrending(trending);
						showMostViewed(viewes);
					}
					function loadPicturesNewest(){
						var xmlhttp = new XMLHttpRequest();
						var url = '/loadPictures?type=shame&order=-date';
						xmlhttp.onreadystatechange = function() {
							if (xmlhttp.readyState % 5 == 4 && xmlhttp.status == 200) {
								newest = JSON.parse(xmlhttp.responseText);
								showNewest(newest);
							}
						}
						xmlhttp.open("GET", url, true);
						xmlhttp.send();
					}
					function showNewest(arr) {
						var out = "";
						var i,l=length;
						if(length>arr.length)
							l=arr.length;
						for (i = 0; i < l; i++) {
							out += '<div class="tab_img">';
							out += '<div class="col-md-4">';
							out += '<a href="Single.jsp?picID='+arr[i].picID+'">';
							out += '<img src="'+arr[i].picID+'"+ class="img-responsive" alt="'+arr[i].tag+'" style="height: 266px; width: 400px" /></a>';
							out += '<div class="date">';
							out += '<table style="width: 100%;"><tr>'
							out += '<td><span class="date-in"><i class="glyphicon glyphicon-calendar"> </i>'+arr[i].date+'</span></td>';
							out += '<td><span class="date-in" class="glyphicon glyphicon-cross">'+arr[i].likes+'likes</span></td>';
							out += '<td><a href="#" class="comments"><i class="glyphicon glyphicon-comment"></i>'+arr[i].commentCount+'</a></td></tr>';
							out += '</table><div class="clearfix"></div><span class="date-in">'+arr[i].tag+'</span><div class="clearfix"></div>';
							out += '<span class="date-in">'+arr[i].place+'</span><div>';
							out += '<a href="Single.jsp?picID='+arr[i].picID+'" class="hvr-overline-from-center more">READ MORE</a><br /></div></div></div></div>';
						}
						if(l>0&&l<arr.length)
							out+='<button class="btn btn-default" onClick="increaseLength()">Show More Pictures</button>';
						else if(l==arr.length)
							out+='<h4>No More Pictures</h4>';
						else
							out+='<h4>No More Pictures</h4>';		
						out+='<br />'
						document.getElementById("newest").innerHTML = out;
					}
					function loadPicturesTrending(){
						var xmlhttp = new XMLHttpRequest();
						var url = '/loadPictures?type=shame&order=-likes';
						xmlhttp.onreadystatechange = function() {
							if (xmlhttp.readyState % 5 == 4 && xmlhttp.status == 200) {
								trending = JSON.parse(xmlhttp.responseText);
								showTrending(trending);
							}
						}
						xmlhttp.open("GET", url, true);
						xmlhttp.send();
					}
					function showTrending(arr) {
						var out = "";
						var i,l=length;
						if(length>arr.length)
							l=arr.length;
						for (i = 0; i < l; i++) {
							out += '<div class="tab_img">';
							out += '<div class="col-md-4">';
							out += '<a href="Single.jsp?picID='+arr[i].picID+'">';
							out += '<img src="'+arr[i].picID+'"+ class="img-responsive" alt="'+arr[i].tag+'" style="height: 266px; width: 400px" /></a>';
							out += '<div class="date">';
							out += '<table style="width: 100%;"><tr>'
							out += '<td><span class="date-in"><i class="glyphicon glyphicon-calendar"> </i>'+arr[i].date+'</span></td>';
							out += '<td><span class="date-in" class="glyphicon glyphicon-cross">'+arr[i].likes+'likes</span></td>';
							out += '<td><a href="#" class="comments"><i class="glyphicon glyphicon-comment"></i>'+arr[i].commentCount+'</a></td></tr>';
							out += '</table><div class="clearfix"></div><span class="date-in">'+arr[i].tag+'</span><div class="clearfix"></div>';
							out += '<span class="date-in">'+arr[i].place+'</span><div>';
							out += '<a href="Single.jsp?picID='+arr[i].picID+'" class="hvr-overline-from-center more">READ MORE</a><br /></div></div></div></div>';
						}
						if(l>0&&l<arr.length)
							out+='<button class="btn btn-default" onClick="increaseLength()">Show More Pictures</button>';
						else if(l==arr.length)
							out+='<h4>No More Pictures</h4>';
						else
							out+='<h4>No More Pictures</h4>';		
						out+='<br />'
						document.getElementById("trending").innerHTML = out;
					}
					function loadPicturesMostViewed(){
						var xmlhttp = new XMLHttpRequest();
						var url = '/loadPictures?type=shame&order=-view';
						xmlhttp.onreadystatechange = function() {
							if (xmlhttp.readyState % 5 == 4 && xmlhttp.status == 200) {
								viewes = JSON.parse(xmlhttp.responseText);
								showMostViewed(viewes);
							}
						}
						xmlhttp.open("GET", url, true);
						xmlhttp.send();
					}
					function showMostViewed(arr) {
						var out = "";
						var i,l=length;
						if(length>arr.length)
							l=arr.length;
						for (i = 0; i < l; i++) {
							out += '<div class="tab_img">';
							out += '<div class="col-md-4">';
							out += '<a href="Single.jsp?picID='+arr[i].picID+'">';
							out += '<img src="'+arr[i].picID+'"+ class="img-responsive" alt="'+arr[i].tag+'" style="height: 266px; width: 400px" /></a>';
							out += '<div class="date">';
							out += '<table style="width: 100%;"><tr>'
							out += '<td><span class="date-in"><i class="glyphicon glyphicon-calendar"> </i>'+arr[i].date+'</span></td>';
							out += '<td><span class="date-in" class="glyphicon glyphicon-cross">'+arr[i].likes+'likes</span></td>';
							out += '<td><a href="#" class="comments"><i class="glyphicon glyphicon-comment"></i>'+arr[i].commentCount+'</a></td></tr>';
							out += '</table><div class="clearfix"></div><span class="date-in">'+arr[i].tag+'</span><div class="clearfix"></div>';
							out += '<span class="date-in">'+arr[i].place+'</span><div>';
							out += '<a href="Single.jsp?picID='+arr[i].picID+'" class="hvr-overline-from-center more">READ MORE</a><br /></div></div></div></div>';
						}
						if(l>0&&l<arr.length)
							out+='<button class="btn btn-default" onClick="increaseLength()">Show More Pictures</button>';
						else if(l==arr.length)
							out+='<h4>No More Pictures</h4>';
						else
							out+='<h4>No More Pictures</h4>';		
						out+='<br />'
						document.getElementById("mostViewed").innerHTML = out;
					}					
					</script>
					<div class="resp-tabs-container">
						<div class="tab-0 resp-tab-content" aria-labelledby="tab_item-0" id="newest"></div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1" id="trending"></div>
						<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-2" id="mostViewed"></div>
					</div>
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