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
	height: 565px;
}

#photo{
	/* border: 1px solid aqua;  */
	box-sizing: border-box;
	margin: auto;
	width: 100%;
	height: 92%;
	text-align: center;
}
#folderName{
	
	font-size: larger;
	font-weight: 900;
}
#updateBtn{
	position:relative;
	left:250px;
}
#reportBtn{
	position:relative;
	left:250px;
}
#photoTitle{
	font-size: larger;
	font-weight: 900;
}
#photoComment{
	resize: none;
	border: none;
	outline: none;
	width: 80%;
	height: 70px;
	text-align: center;
}
#viewPhoto{
	margin: 10px 15% 5px 15%;
	width: 70%;
	height: 70%;
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
	border-radius: 3px;
	width: 80px;
	height: 30px;
	margin: 5px 10%;
	/* border: none;
    background: transparent;
    cursor: pointer; */
	
}
#div_reply{
	text-align: center;
	/* border: 1px solid blue; */
	margin: auto;
	width: 700px;
	height: 50px;
	
}
.reply{
	border-bottom : 2px solid lightgray; 
	font-size: small;
	margin: 0px;
	text-align: left;
}
#div_insertReply{
	/* border: 1px solid green; */
	position: relative;
	
}
#replyNo{
	position: relative;

}
#replyWriter{
	position: relative;
	display:inline-block;
	width: 150px;
	margin-top: 10px;
}

.updateBtn1{
	position: relative;
	right: -320px;
	width: 40px;
	top: 3px;
}
.updateBtn2{
	position: relative;
	right: -320px;
	width: 40px;
	top: 3px;
	display: none;
}

#replyDelete{
	position: relative;
	right: -320px;
	width: 40px;
	top: 3px;
}
#replyDate{
	position: relative;
	right: -350px;
}
.replyComment{
	/* border: 1px solid salmon; */
	resize: none;
	outline: none;
	width: 600px;
	height: 30px;
}
#input_insertReply{
	position: relative;
	resize: none;
	outline:none;
	width: 600px;
	height: 30px;
	top: 5px;
	border: 1px solid gray;
	
}
#btn_insertReply{
	position: relative;
	margin-left: 20px;
	top: -7px;
	width: 68px;
	height: 36px;
}
textarea {
	resize: none;
	border: none;
	outline: none;
	width: 600px;
	height: 30px;
}

</style>
<body>
	<!-- right_side -->
	<div id = "wrap" >
		<div id="photo">
			<span id="folderName">1번 폴더</span> <br>
			<c:if test="${loginMember.no eq minihome.userNo }">
				<input id="updateBtn" type="button" value="수정" onclick="location.href='${ path }/minihome/photo/${minihomeNo}/update?no=${photo.no}'">
			</c:if>
				<input id="reportBtn" type="button" value="신고" onclick="window.open('${ path }/minihome/visitor/report/${ minihomeNo }?visitorNo=${ photo.no }&reportCode=${ photo.reportCode }', '신고하기','width=350, height=340, top=200, left=300')">
			<br>
			<div id="viewPhoto">
					<img src="${path}${photo.url}">
				</div>
			<span id="photoTitle">${photo.title}</span> <br><br>
			<textarea name="" id="photoComment" readonly  >${photo.comment}</textarea>
		</div>

		
		<div id="div_page">
		<c:if test="${pre ne 11}">
			<input type="button" class="pageCount" value="<이전" onclick="location.href='${ path }/minihome/photo/${minihomeNo}/view?no=${pre}'">
		</c:if>
		<c:if test="${pre eq 11}">
			<input type="button" class="pageCount" value="<이전" disabled>
		</c:if>
		
			<input type="button" class="pageCount" value="뒤로가기" onclick="history.back()">
			<input type="button" class="pageCount" value="다음>"onclick="location.href='${ path }/minihome/photo/${minihomeNo}/view?no=${next}'">
		</div>
		
		<div id="div_reply">
			<c:forEach var="reply" items="${list}">
				<form action="${path}/minihome/photo/${minihomeNo}/updateReply" method="get">
					<div class="reply">
						<input type="hidden" name="no" value="${reply.no}" >
						<input type="hidden" name="photoNo" value="${photo.no}" >
						<span id="replyWriter">작성자 : ${reply.writerId}</span>
						<c:if test="${loginMember.id eq reply.writerId }">
							<input type="button" onclick="update1('${reply.no}')" id="replyUpdate1_replyNo${reply.no}" class="updateBtn1" value="수정"  />
							<input type="button" onclick="update2('${reply.no}')" id="replyUpdate2_replyNo${reply.no}" class="updateBtn2" value="확인"  />
							<input type="button" id="replyDelete" value="삭제" onclick="location.href='${path}/minihome/photo/${minihomeNo}/deleteReply?no=${reply.no}&photoNo=${reply.photoNo}'" />
						</c:if>
						<c:if test="${loginMember.id ne reply.writerId }">
							<input type="button" onclick="update1('${reply.no}')" id="replyUpdate1_replyNo${reply.no}" class="updateBtn1" value="수정" disabled />
							<input type="button" onclick="update2('${reply.no}')" id="replyUpdate2_replyNo${reply.no}" class="updateBtn2" value="확인" disabled />
							<input type="button" id="replyDelete" value="삭제" onclick="location.href='${path}/minihome/photo/${minihomeNo}/deleteReply?no=${reply.no}&photoNo=${reply.photoNo}'" disabled />
						</c:if>
						<span id="replyDate"><fmt:formatDate value="${ reply.mdate }" pattern="yyyy-MM-dd HH:mm"/></span>
						<br><br>
						<textarea name="comment" class="replyComment" id="replyComment_replyNo${reply.no}" readonly>${reply.comment}</textarea>
						<%-- <input type="text" id="replyComment" name="comment" value="${reply.comment}" readonly /> --%>
						<%-- <label id="replyComment">${reply.comment}</label> --%>
						<br><br>
					</div>
				</form>
			</c:forEach>
			
			<form action="${ path }/minihome/photo/${minihomeNo}/insertReply?photoNo=${photo.no}" method="get">
				<div id="div_insertReply">
				<input type="hidden" name="photoNo" value="${photo.no}">
					<textarea name="comment" id="input_insertReply" ></textarea>
					<input type="submit" id="btn_insertReply" value="입력">
				</div>
			</form>
		</div>

	</div>
	
	
	
<script>
// <input type="button" onclick="update1('${reply.no}')" id="replyUpdate1_replyNo${reply.no}" class="updateBtn1" value="수정"  />
// <input type="button" onclick="update2('${reply.no}')" id="replyUpdate2_replyNo${reply.no}" class="updateBtn2" value="확인"  />
// <textarea name="comment" id="replyComment_replyNo${reply.no}" readonly>${reply.comment}</textarea>

	function update1(replyNo) {
		// 현재 버튼의 수정하기 id 	
		var replyId1 = 'replyUpdate1_replyNo' + replyNo;
		var replyId2 = 'replyUpdate2_replyNo' + replyNo;
		
		$('#' + replyId2).css({
			"display":"inline"
		});
		$('#' + replyId1).css({
			"display":"none"
		});
		
		
		$('#replyComment_replyNo' + replyNo).attr("readonly",false);
		$('#replyComment_replyNo' + replyNo).css({
				"border":"1px solid gray"		
		})
	}
	function update2(replyNo) {
		// 현재 버튼의 수정하기 id 	
		var replyId1 = 'replyUpdate1_replyNo' + replyNo;
		var replyId2 = 'replyUpdate2_replyNo' + replyNo;
		
		/* 
		$('#replyComment_replyNo' + replyNo).attr("readonly",true);
		$('#replyComment_replyNo' + replyNo).css({
				"border":"0"		
		}) */
		let content = $('#replyComment_replyNo' + replyNo).val();
		console.log(content);
		
		$.ajax({
			url: '${path}/minihome/photo/${minihomeNo}/updateReply',
			type: 'get',
			dataType: 'json',
			data : {
				content,
				replyNo
			},
				
			success : function(data) {
				console.log(data);
				document.location.reload();			
				
			},
			error : (error) => {
				console.log(error);
			}
	
});
		
		
		
	}
	 
	
/* 
$("#replyUpdate").click(function(){
	})
	
	$.ajax({
			url: '${path}/minihome/photo/${minihomeNo}/updateReply?photoNo=${photo.no}',
			type: 'get',
			dataType: 'json',
			data : {
				no,
				photoNo,
				comment
			},
				
			success : function(data) {
	
				document.location.reload();			
				
			},
			error : (error) => {
			}
	
});
 */

</script>	

</body>
</html>