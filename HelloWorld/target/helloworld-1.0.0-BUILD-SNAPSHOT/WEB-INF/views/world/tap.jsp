<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">

<style type="text/css">
		
		body {
			font-family:"Malgun Gothic";
			font-size: 0.8em;

		}
		/*TAB CSS*/

		ol.tabs {
			margin: 0;
			padding: 0;
			float: right;
			list-style: none;
			height: 32px; 
			border-bottom: 1px solid #999;
			border-left: 1px solid #999;
			}
		ol.tabs li {
			
			margin: 0;
			padding: 0;
			height: 31px; /*--Subtract 1px from the height of the unordered list--*/
			line-height: 31px; /*--Vertically aligns the text within the tab--*/
			border: 1px solid #999;
			border-left: none;
			margin-bottom: -1px; /*--Pull the list item down 1px--*/	
			overflow: hidden;
			position: relative;
			background: #e0e0e0;
		}
		ol.tabs li a {
			text-decoration: none;
			color: #000;
			display: block;
			font-size: 1.2em;
			padding: 0 20px;
			border: 1px solid #fff; 
			outline: none;
		}
		ol.tabs li a:hover {
			background: #ccc;
		}
		html ul.tabs li.active, html ul.tabs li.active a:hover  {
			background: #fff;
			border-bottom: 1px solid #fff; 
		}

		/*Tab Conent CSS*/
		.tab_container {
			border: 1px solid #999;
			border-top: none;
			overflow: hidden;
	
			float: left; 
			
			background: #fff;
		}
		.tab_content {
			padding: 20px;
			font-size: 1.2em;
		}
	

</style>
<title>Insert title here</title>
<body>
<div style="width:360px;height: 500px;	border: 1px solid #999; ">
<div id="wrapper">	
	<!--탭 메뉴 영역 -->
	<div id ="flot">
	<ol class="tabs">
	    <li><a href="#tab1">tab1</a></li>
	    <li><a href="#tab2">tab2</a></li>
	</ol>
</div>
	<!--탭 콘텐츠 영역 -->
	<div class="tab_container">

	    <div id="tab1" class="tab_content">
	        <!--Content-->
	        <h1>tab1영역</h1>
	        내용 내용 내용 내용 내용 내용 <br/>
	        자바킹 블로그 :2222222
	        <a href="http://javaking75.blog.me">javaking75.blog.me</a>

	    </div>

	    <div id="tab2" class="tab_content">
	       <!--Content-->
	     <iframe src="/guestboard" style="width:100%; height:300px">

</iframe>
		</div>

	</div>
</div>




</div>






<script type="text/javascript">
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ol.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
$("ol.tabs li").click(function() {

	$("ol.tabs li").removeClass("active"); //Remove any "active" class
	$(this).addClass("active"); //Add "active" class to selected tab
	$(".tab_content").hide(); //Hide all tab content

	var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
	$(activeTab).fadeIn(); //Fade in the active ID content
	return false;
});

});

</script>





</body>
</html>

