<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/guestboard.css"
	rel="stylesheet">

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 작성  -->
	<div class="guestboard">
		<form action="gbRegister" method="POST">
			<div style="float: right;">
				<input type="checkbox" id="g_secret" value="Y"><a>비밀글</a>
			</div>
			<div style="padding-top: 30px; padding-left: 10px;">
				<div class="img_wrap">
					<img id="img" src="displayFile?fileName=/${loginId}.jpg">

				</div>
				<div>
					<input type="text" id="g_content" name="g_content"
						placeholder="글쓰기">
				</div>
			</div>

			<input type="submit" id="btn_add" value="작성 ">
		</form>
	</div>




	<!------------------------------------------------------------------->
<div id = "guest">
	<c:forEach var="vo" items="${guestlist }">
		<br>
		<div class="guestboard">
			NO.<a id="g_bno">${ vo.g_bno}</a> <a>${vo.userid}</a> <a>${vo.g_date }</a>


			<c:if test="${loginId == vo.userid}">
				<button id="delect">삭제</button>
			</c:if>

			<!-- console.log("저장 경로"+this.user_photo); -->

			<div class="contentandphoto">
				<c:choose>
					<c:when test="${vo.user_photo != null  }">

						<div class="img_wrap">
							<img id="img" src="displayFile?fileName=/${vo.user_photo }" />
						</div>

					</c:when>
					<c:otherwise>
						<div class="img_wrap">
							<img id="img" src="displayFile?fileName=/notphoto.png">
						</div>

					</c:otherwise>
				</c:choose>


				<br>
				<c:choose>
					<c:when test="${vo.g_secret == 'Y' }">
						<c:catch>

							<c:when test="${vo.userid == member.uesrid }">
								<><input class="content1" style="width: 400px; height: 100px;"
									placeholder="${vo.g_content }" readonly />
							</c:when>
							<c:otherwise>
								<input class="content1" style="width: 400px; height: 100px;"
									placeholder="비밀글 입니다 " readonly />
							</c:otherwise>
						</c:catch>
					</c:when>
					<c:otherwise>
						<input class="content1" style="width: 400px; height: 100px;"
							placeholder="${vo.g_content }" readonly />

					</c:otherwise>
				</c:choose>


			
				<c:if test="${loginId == vo.userid }">
					<button class="btnupdate" style="float: right;" type="button">수정하기</button>'
				</c:if>
						
				<br> <br>
				<hr>

				<input type="text" style="width: 400px; height: 22px;"
					class="guestreply">
				<button class="reply">확인</button>
				<br>

			</div>
			<c:if test="vo.g_reply != null">
						vo.g_reply 
						</c:if>

		</div>

	</c:forEach>
</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
			  
		   	$("#guest").on("click", ".guestboard .btnupdate ", function() {

				$(this).html('저장하기');
				$(this).attr("class", "saveupdate");
				$(this).prevAll(".content1").removeAttr('readonly');
				console.log("${vo.userid }");

			});
		   	
		   	$("#guest").on("click", ".guestboard .saveupdate", function() {
				console.log("세이브 체크");
				var g_bno = $('#g_bno').text();
				var g_content = $('.content1').val();
				 
				console.log(this);
				console.log(g_bno);
				console.log(g_content);
				//ajax
				$.ajax({
					url : '/helloworld/world/'+g_bno,
					type : 'put',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					data : JSON.stringify({
							'g_content' : g_content
					}),
					success : function(result){
			  	        if(result == 'success'){
			  	          alert('댓글 수정성공')
			  	        } // end if()
			  	      }// end success()
				});
				var target = encodeURI('/helloworld/world/guestboard');
				/* console.log(target);
				location = target; */
			}); 
			
		   	$("#guest").on("click", ".guestboard #delect", function() {
				console.log(this);
				var g_bno = $('#g_bno').text();

				console.log(g_bno);
				$.ajax({
					 type : 'delete',
					 url : '/helloworld/world/'+g_bno,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					data : JSON.stringify({
			  	  	    'g_bno' : g_bno
			  	  	  }), 
			  	      success : function(result){
			  	        if(result == 'success'){
			  	          alert('댓글 삭제성공')
			  	          getAllReplies();
			  	        } // end if()
			  	      }// end success()
			  	      
			  	    }); // end ajax()
			  	  }); // end btn_delte.click()

		   	
		   	
		   	
		   	
			
			
		});
	</script>













</body>
</html>