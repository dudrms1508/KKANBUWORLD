<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">



<title>Insert title here</title>


</head>
<body>
	<h1>방명록 ${loginId }님, 환영합니다!</h1>
	<div id="scroll"></div>
	<div style="text-align: center;">
		<div id="replies"></div>
	</div>

	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ script! ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->
	<script type="text/javascript">
		$(document).ready(function() {
			getAllReplies();
			function getAllReplies() {
				var url = 'all'; // 절대경로사용할때 이렇게!
				var loginid = 'do0610';
			$.getJSON(
		url,
	function(jsonData) {
		console.log(jsonData);
		var list = ''; // JSON 데이터에서 테이터를 꺼내 태그 + 데이터 형식으로 저장할 변수
		$(jsonData).each(// jsonData를 사용하는 each 반복문
			function() {
				var date = new Date(
					this.g_date); //this : jsonData
					console.log("댓글 번호 : "+ this.g_bno);
					var userid = this.userid;
						console.log(userid);
						console.log('do0610');
							list += '<div class="reply_item">'
								+ '<pre>'
								+ '<input type="hidden" id="g_bno" value="'+ this.g_bno +'" /><br>'
								+this.g_bno
								+ '<input type="hidden" id="userid" value="' + this.userid + '" /><br>' // 변경한부분 id="reply_id"		
								+ this.userid
								+ '&nbsp;&nbsp;' // 공백
								+ '<input type="text" id="reply_content" value="' + this.g_content + '" />'
								+ '&nbsp;&nbsp;' // 공백
								+ date // 변경한 부분
								+ '&nbsp;&nbsp;' // 공백
								+ this.userid
								+'<button class="btn_update" type="button">수정</button>'
								+'&nbsp;'
								+ '<button class="btn_delete" type="button">삭제</button>'
								+ '</pre>'
								+ '</div>';
								}); // end each()
							$('#replies').html(list);
							} // end callback()
					); // end getJSON()
		} // end getAllReplies()
});
	</script>



</body>
</html>