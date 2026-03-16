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
	width : 800px;
	height: 485px;
}

#photo{
	/* border: 1px solid aqua; */
	box-sizing: border-box;
	margin: auto;
	width: 100%;
	height: 92%;
	text-align: center;
}
#folderName{
	font-size: larger;
	font-weight: 900;
	margin: 0px 0px 10px 0px;
}
#photoTitle{
	text-align: center;
	font-size: larger;
	font-weight: 900;
	
}
#photoComment{
	resize: none;
	width: 80%;
	height: 50px;
	text-align: center;
	margin-top: 5px;
}
#insertPhoto{
	/*  border: 1px solid green; */
	margin: 5px 25% 5px 25%;
	width: 50%; 
	height: 285px;
	
}
img{
	width: 100%;
	height: 100%;
}
#div_page{
	/* border: 1px solid red; */
	box-sizing: border-box;
	width: 100%;
	height: 8%;
	text-align: center;
	
}
.pageCount{
	border: 1px solid;
	width: 80px;
	height: 30px;
	margin: 5px 10%;
	border-radius: 3px;
}


</style>
<body>
	<!-- right_side -->
	<div id = "wrap" >
		<form action="${path}/minihome/photo/${minihomeNo}/update?no=${photo.no}" method="post" enctype="multipart/form-data">
		
			<div id="photo">
				<p id="folderName">${photo.folderNo}</p>
				<input type="file" name="upfile" id="gdsImg">
				<div id="insertPhoto">
					<img src="${path}${photo.url}">
				</div>
				<input id="photoTitle" placeholder="사진 제목" name="title" value="${photo.title}"></input> <br>
				<textarea name="comment" id="photoComment" placeholder="내용">${photo.comment}</textarea>
			</div>
			
			
			<div id="div_page">
				<input type="reset" class="pageCount" value="취소">
				<input type="submit" class="pageCount" value="수정">
			</div>
		
		</form>

		

	</div>
 <script>
	$("#gdsImg").change(function(){
		if(this.files && this.files[0]) {
			var reader = new FileReader;
				reader.onload = function(data) {
					$("#insertPhoto img").attr("src", data.target.result);        
				}
			reader.readAsDataURL(this.files[0]);
		}
	});
 </script>
</body>
</html>