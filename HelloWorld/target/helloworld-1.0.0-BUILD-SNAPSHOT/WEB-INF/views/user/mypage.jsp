<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.img_wrap img {
	width: 100px;
	height: 120px;
	border: 1px solid grey;
}
</style>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<%@ include file="/resources/import/subheader.jspf" %>

<body>
	<h1>프로필 수정</h1>


	<input type="text" value="${member.user_name }" readonly />
	<div>
	
		<button id="profilebtn">프로필 사진 변경</button>
		${member.user_name } ${member.userid } <a>${member.user_photo}</a>
		<div class="img_wrap">
		<img id="img"
				src="displayFile?fileName=/${member.user_photo}"><br>
		</div>       
	</div>

		














<script type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#profilebtn').click(function() {// 로그아웃 버튼 클릭 
				location = '/helloworld/user/profilephoto';
			});
		});
	</script>

</body>


</html>