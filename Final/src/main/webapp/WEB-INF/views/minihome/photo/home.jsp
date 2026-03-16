<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
</head>
<style>
#wrap{
	/* border: 1px solid black; */
	width : 780px;
	height: 505px;
	margin: auto;
}
.div_rank{
	text-align: center;
	/* border: 1px solid blue; */
	box-sizing: border-box;
	width: 100%;
	height: 50%;
}
.div_title{
	width: 100%;
	height: 35px;
	margin: 5px;
	font-size: larger;
	font-weight: bold;
}
.div_rank123{
	float: left;
	width: 30%;
	height: 65%;
	margin: 0px 12px;
	text-align: center;
}
img{
	width: 100%;
	height: 100%;
}
a{
	text-decoration: none;
	color: darkblue;
}
</style>
<body>
	<div id = "wrap" > 
		<div id="div_new" class="div_rank">
			<div class="div_title">
				최근에 업로드한 사진
			</div>
			<c:forEach var="photo" items="${lastPT}">
				<div class="div_rank123">
					<a href="${ path }/minihome/photo/${minihomeNo}/view?no=${ photo.no }">
						<img src="${path}${photo.url }">
						<label>< ${photo.title} ></label>
					</a>
				</div>
			</c:forEach>
		</div>
		<div id="div_reply" class="div_rank">
			<div class="div_title">
				댓글이 가장 많은 사진
			</div>
			<c:forEach var="photo" items="${replyPT}">
				<div class="div_rank123">
					<a href="${ path }/minihome/photo/${minihomeNo}/view?no=${ photo.no }">
						<img src="${path}${photo.url}">
						<label>< ${photo.title} ></label>
					</a>
				</div>
			</c:forEach>
		</div>
		<div id="div_view" class="div_rank">
		
			<div class="div_title">
				조회수가 가장많은 사진
			</div>
			<c:forEach var="photo" items="${viewPT}">
				<div class="div_rank123">
					<a href="${ path }/minihome/photo/${minihomeNo}/view?no=${ photo.no }">
						<img src="${path}${photo.url }">
						<label>< ${photo.title} ></label>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
</body>
</html>