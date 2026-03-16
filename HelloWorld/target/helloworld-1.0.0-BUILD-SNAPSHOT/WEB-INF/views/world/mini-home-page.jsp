<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.tap_button{
	width : 70px;
	height: 40px;
	background-color: #4582b4;
	color: white;
	float:left;
	position: relative;
	border-top-right-radius: 5px;
	border-bottom-right-radius:5px;
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	border-right: 1px solid grey;
	margin-bottom: 1px;
}
.left_side_down.on{
	display: block;
}
.left_side_down{
	display: none;
}


.lblVisitCnt{
	font-size: 50%;
	font-family: Verdana;
	color: #504E48;
}

.lblBoard{
	font-weight:bold;
	color:#50BCDF;
}

a{
	font-family: 'Open Sans';
	font-size: 90%;
}

#left_side{
	background-color: #f1f3f5;
	width : 220px;
	height: 565px;
	margin: 69px 60px;
	position: absolute;
	border-radius: 10px;
	
}

#left_side_upper{
	background-color: #f1f3f5;
	width : 215px;
	height: 45px;
	float: left;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	text-align:center;
	
}
#left_side_down{
	background-color: white;
	width : 210px;
	height: 505px;
	float: left;
	margin:5px;
	border:1px solid grey;
	border-radius: 7px;
}
#right_side{	
	
	width : 977px;
	height: 565px;
	margin: 69px 280px;
	position: absolute;
}
#right_side_upper{
	background-color: #f1f3f5;
	width: 837px;
	height: 45px;
	float: left;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
#right_side_down{
	width: 837px;
	background-color: #f1f3f5;
	float:left;
	height: 520px;
}
#ntBoardFolderList{
	float : left;
 	width : 189px; 
 	margin: 20px 8px;
 	margin-right: 25px;
 	background-color: white;
 	
}

#minihome_content{
	width : 825px;
	height: 505px;
	float:left;
	border-radius: 7px;
	position: relative;
	background-color: white;
	margin: 5px;
	border:1px solid grey;

}
#btnWrapper{
	width : 100px;
	height: 515px;
	text-align: center;
	background-color:transparent;
	float: left;
}
#visitWrapper{
	width: 220px;
	height: 10px;
	text-align: center;
	margin-top: 30px;
}
#titleWrapper{
	width: 500px;
	margin : 25px 20px;
}

#profilePhotoWrapper{
	width :141px;
	height: 200px;
	margin:30px auto 5px;
	
}

#profileWrapper{
	width : 170px;
	height: 150px;
	margin: 10px 20px 10px 20px;
	font-size:120%;
	float:left;
	color : grey;
	overflow: auto;
}

#wavingWrapper{
	width : 170px;
	height: 50px;
	border-top: 1px solid grey;
	float: left;
	margin: 0px 20px;
	padding-top: 10px;
}

#todayCnt{
	color :red;
}

#lblHomeName{
	font-size: 110%;
	color: #4582b4;
	font-weight: bold;
	
}
#selectFrd{
	width: 167px;
	height: 20px;
	marker-top:10px;
}
body{
	background-repeat: no-repeat;
	background-size: 1200px 720px;
}
ol {
  list-style : none;
  padding-inline-start: 10px;
  
}
ol li{
	background: url("${pageContext.request.contextPath}/resources/images/folder2.png") left center no-repeat;
	list-style-position : inside;
	padding-left: 20px;
	
}



 button:hover{cursor: pointer;}
 a:link {text-decoration: none; color: #333333;}
 a:visited {text-decoration: none; color: #333333;}
 a:active {text-decoration: none; color: #333333;}
 a:hover {text-decoration: underline; color: black;}

iframe {
	border:none;
}
</style>
<meta charset="UTF-8">
<title>test Mini</title>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/전체틀사진.jpeg');">
	<div id = "left_side">
		<div id = "left_side_upper">
			<div id = "visitWrapper">
			<label class = "lblVisitCnt">TODAY </label><a id = "todayCnt">238</a> 
			<label class = "lblVisitCnt">| TOTAL </label><a>2632123</a>
			</div>
		</div>
		<div id = "left_side_down">
		  <div class = "left_side_down on" id = "main_left_side">
			<div id = "profilePhotoWrapper">
				<img src='${pageContext.request.contextPath}/resources/images/defaultProfile.jpeg'>
			</div>
			<div id = "profileWrapper">
				<pre>내가 미친걸까,,<br>세상이 미친걸까,,,<br>미친게 정상인,,<br>미친 세상,,</pre>
			</div>
			<div id = "wavingWrapper">
				<label id = "lblHomeName">${homeName }</label><br><br>
				<select id = "selectFrd">
					<option>파도타기</option>
				</select>
				
			</div>
		
		  </div>
		
		
		 <div class = "left_side_down" id = "ntBoardFolderList" ><!-- board-folderList -->
		 	<label class = "lblBoard">FREE BOARD</label>
			<hr>
 			<a href = "">전체보기</a><br>
 			<c:forEach var = "folder" items="${ntFolderList }">
 		 	 <ol>
 				<li><a href = "${folder }">${folder }</a>
 		 	 </ol>
 			</c:forEach>
 			<form id = "selectByFolder" style="display: none;">
 				<input type = "text" name = "userid" value = "test">
 				<input type = "text" name = "folder">
 			</form>	
 	
 			<c:if test="${loginId == homeId }">
 			<button onclick = "NTFmanager('${homeId}')">폴더 관리하기</button>
 			</c:if>
 		 </div>
		</div>
	</div>


	<!-- right_side -->
	<div id = "right_side"> 
	  <div id = "right_side_upper">
	  	<div id = "titleWrapper">
	  		<h3>그지같은 도유성 너무 싫다</h3>
	  	</div>
	  </div>
	  <div id = "right_side_down">
		<iframe id = "minihome_content" src = "/helloworld/frcboard/frcList">
		</iframe>
	  </div>	
		<div id = "btnWrapper">
			<button class = "tap_button" id = "home">홈</button>
			<button class = "tap_button" id = "nt">게시판</button>
			<button class = "tap_button" id = "gb">방명록</button>
		</div>
	</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		$('#home').click(function(){
			$('.left_side_down.on').removeClass('on');
			$('#main_left_side').addClass('on');
			$('#minihome_content').attr('src', "/helloworld/frcboard/frcList");
		});
		
		$('#nt').click(function(){
			$('.left_side_down.on').removeClass('on');
			$('#ntBoardFolderList').addClass('on');
			$('#minihome_content').attr('src', "/helloworld/ntBoard/ntList");
						
		});
		
		$('#gb').click(function(){
			$('.left_side_down.on').removeClass('on');
			$('#main_left_side').addClass('on');
			$('#minihome_content').attr('src', "/helloworld/world/gBoard");
						
		});
		
		$('#ntBoardFolderList a').click(function(){
  			event.preventDefault();
  			var folder = $(this).attr("href");
  			$('#minihome_content').attr('src', "/helloworld/ntBoard/ntList?folder="+folder);
  			
  		});
	
		
		
	});





</script>


</body>
</html>