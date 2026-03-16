<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.pb{
	font-size: 120%;
	font-weight: bold;
}
.btnTap{
	width : 200px;
	height: 50px;
	font-size: 130%;
	padding: 0px;
	border-style: none;
	background-color: white;
	box-shadow: 3px 3px 3px grey;	
}
.btnTap.on{
	width : 200px;
	height: 50px;
	font-size: 130%;
	box-shadow: 3px 3px 3px grey;	
	padding: 0px;
	border-style: none;
	background-color: white;
	color: red;
}
.tabBox.on{
	display: block;
	 
}
.tabBox{
	display: none; 
}


#aa{
	float : left;
}
#pp{
	margin-top: 55px;
}
#mainpageMain{
	width: 600px;
	height: 100%;
	margin: 30px auto;
	text-align: center;
}
#btnSendfrd{
	margin-left: 0px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	float: left;
}
#btnGetfrd{
	margin-left: 2px;	
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	float: left;
}
#btnApplyCancle{
	width: 80px;
	height: 25px;
	float: right;
	font-size:95%;
	margin-right: 20px;
	border-style: none;
	background-color: #FF6F6B;
	border-radius:5px;
	color:white;
	
}
#btnConfirm{
	width: 80px;
	height: 25px;
	float: right;
	font-size:95%;
	margin-top:15px;
	margin-right: 20px;
	border-style: none;
	background-color: #FF6F6B;
	border-radius:5px;
	color:white;
}

#btnApply{
	width: 80px;
	height: 25px;
	float: right;
	font-size:95%;
	margin-right: 20px;
	border-style: none;
	background-color: #FF6F6B;
	border-radius:5px;
	color:white;
}

#btnRefuse{
	width: 80px;
	height: 25px;
	float: right;
	font-size:95%;
	margin-right: 7px;
	border-style: none;
	background-color: #FF6F6B;
	border-radius:5px;
	color:white;
}



#appliedMainWrapper{
	width : 520px;
	height: 100%;
}

#requestStatusAlert{
	width: 50px;
	height: 20px;
	float: left;
	border-top: 2px solid grey;
	border-left: 2px solid grey;
	border-right: 2px solid grey;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
#requestToAlert{
	width: 540px;
	height: 25px;
	border-bottom: 1px dashed grey;
}
#requestNicknameAlert{	
	width: 140px;
	height:60px;
	margin : 10px 5px;
	float: left;
	text-align: center;
	
}
#requestMsgAlert{
	width: 390px;
	height: 60px;
	margin : 10px 5px;
	float:left;
}

#tapBtnWrapper{
	width : 500px;
	float: left;
}
#tapBoxWrapper{
	width : 600px;
	height : 800px;
	padding : 20px;
	background-color: white; 
	box-shadow: 3px 3px 3px grey;	
	border-top-right-radius: 10px;
	float: left;
	overflow-y: auto;
}
#sendListBoxWrapper{
 	width: 560px;
 	height: 180px;
}

#pInfoWrapper{
	width: 100px;
	height: 60px;
	margin : 20px 5px;
	float: left;
}


#imgmemberProfile{
	float : left;
	margin: 4px 15px;
}


p{
	margin: 2px 20px 5px;
	color: grey;
	font-family: Batang;
}



body{
	height: 100%;
	background-color: #fafafa;
	
}
header{
  background-color: #ff6f6b;
  height: 90px;
  
}
textarea{
 	resize: none;
 	width : 380px;
 	height: 35px;
 	float: left;
}

button:hover {
	cursor: pointer;
}
.btnTap:hover{
	color : red;
}
.dropdownMenuWrapper:hover #menuBarWrapper{
	display: block;
}
.btnMenu:hover {
	color: red;
	border-bottom: 2px solid red;
}
#menuBarWrapper:hover{
	display: block;
}

#imgheaderlogo:hover{
	cursor: pointer;
}


</style>
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<%@ include file="/resources/import/subheader.jspf" %>




<body>
<!-- 친구 찾기 페이지 -->

<div id = "mainpageMain">
  <div id = "logoWrapper">
  	<img id = "imgheaderlogo" src="${pageContext.request.contextPath}/resources/images/logo2.png">
  </div>
  <h1>일촌신청 관리</h1>
  <div id = "appliedMainWrapper">
  	
  	<div id = "tapBtnWrapper">
  	  <button class = "btnTap on" id = btnSendfrd>보낸 일촌신청</button>
  	  <button class = "btnTap" id = btnGetfrd>받은 일촌신청</button>
  	</div>
  	<div id = "tapBoxWrapper">
  		<div class = "tabBox on" id = "tapBoxSendContainer">
  		<c:if test="${empty sendList }">보낸 일촌 신청이 없습니다.</c:if>
  		
  		<c:forEach var = "vo" items="${sendList }">
  			<fmt:formatDate value="${vo.send_date }" pattern="yyyy-MM-dd HH:mm" var="send_date"/>
  		  <c:if test="${vo.request_status == 'waiting' }">		
  		  <div class = sendListBoxWrapper>
  			<div id = "requestStatusAlert"> 대기 </div>
  			<div class = "sendListBoxContent">
  				<div id = "requestToAlert">
  					
  					<a id = "aa">${vo.get_user_name } 님께 보낸 일촌신청  </a><a id = "aa">(${send_date })</a>
  				</div>
  				<div id = "requestNicknameAlert">
  					<a>${vo.get_user_name } (${vo.get_user_nickname })</a><br>
  					<a>${vo.send_user_name } (${vo.send_user_nickname })</a><br><br>
  				</div>
  				<div id = "requestMsgAlert">
  					<textarea readonly="readonly" >${vo.message }</textarea>
  				</div>	
  				상대방이 수락하면 일촌이 됩니다.<br>  	
  				<button id = "btnApplyCancle" onclick = "applyCancle('${vo.get_userid}', '${vo.request_status }')">신청 취소</button>
  			</div>
  		  </div>	
  		  </c:if>
  		  
  		  <c:if test="${vo.request_status == 'Cwaiting' }">		
  		  <div class = sendListBoxWrapper>
  			<div id = "requestStatusAlert"> 대기 </div>
  			<div class = "sendListBoxContent">
  				<div id = "requestToAlert">
  					
  					<a id = "aa">${vo.get_user_name } 님께 보낸 일촌명변경  </a><a id = "aa">(${send_date })</a>
  				</div>
  				<div id = "requestNicknameAlert">
  					<a>${vo.get_user_name } (${vo.get_user_nickname })</a><br>
  					<a>${vo.send_user_name } (${vo.send_user_nickname })</a><br><br>
  				</div>
  				<div id = "requestMsgAlert">
  					<textarea readonly="readonly" >${vo.message }</textarea>
  				</div>	
  				상대방이 수락하면 일촌명이 변경됩니다.<br>  	
  				<button id = "btnApplyCancle" onclick = "applyCancle('${vo.get_userid}', '${vo.request_status }')">신청 취소</button>
  			</div>
  		  </div>	
  		  </c:if>
  		  
  		  <c:if test="${vo.request_status == 'refused' }">
  		  <div class = sendListBoxWrapper>
  			<div id = "requestStatusAlert"> 거절 </div>
  			<div class = "sendListBoxContent">
  				<div id = "requestToAlert">
  					<a id = "aa">${vo.get_user_name } 님께 보낸 일촌신청  </a><a id = "aa">(${send_date })</a>
  				</div>
  				<p id="pp">상대방이 일촌 수락을 거절했습니다.</p>
  				<button id = "btnApplyCancle" onclick = "confirmMsg('${vo.get_userid}', '${vo.request_status }')">확인</button>
  			</div> 
  		  </div>
  		  </c:if>
  		
  		  <c:if test = "${vo.request_status == 'accepted' }">
  		  <div class = sendListBoxWrapper>
  			<div id = "requestStatusAlert"> 수락 </div>
  			<div class = "sendListBoxContent">
  				<div id = "requestToAlert">
  					<a id = "aa">${vo.get_user_name } 님께 보낸 일촌신청  </a><a id = "aa">(${send_date })</a>
  				</div>
  				<p id="pp">상대방과 일촌이 되었습니다.</p>
  				<button id = "btnApplyCancle" onclick = "confirmMsg('${vo.get_userid}', '${vo.request_status }')">확인</button>
  			</div> 
  		  </div>
  		  </c:if>
  		  
  		  </c:forEach>
  		  
  		</div> <!-- end SendContainer -->
  		
  		<div class = "tabBox"id = "tapBoxGetContainer">
  			<c:if test="${empty getList }">
  			<a>받은 일촌신청이 없습니다.</a>
  			</c:if>
  			
  			<c:if test = "${getList != null }">
   			<c:forEach var = "vo" items="${getList }">
   			<c:if test="${vo.request_status == 'waiting'}">
  			<div class = sendListBoxWrapper>
  				<div id = "requestStatusAlert"> 대기 </div>
  				<div class = "sendListBoxContent">
  				<div id = "requestToAlert">
  				<fmt:formatDate value="${vo.send_date }" pattern="yyyy-MM-dd HH:mm" var="send_date"/>
  					<a id = "aa">${vo.send_user_name } 님이 보낸 일촌신청  </a><a id = "aa">(${send_date })</a>
  				</div>
  				<div id = "requestNicknameAlert">
  					<a>${vo.get_user_name } (${vo.get_user_nickname })</a><br>
  					<a>${vo.send_user_name } (${vo.send_user_nickname })</a><br><br>
  				</div>
  				<div id = "requestMsgAlert">
  					<textarea readonly="readonly" >${vo.message }</textarea>
  				</div>	
  				수락하시겠습니까?<br>  	
  				<button id = "btnRefuse" onclick = " refuseRequest('${vo.send_userid}') ">거절</button>
  				<button id = "btnApply" onclick = "acceptRequest('${vo.send_userid}')">수락</button>
  			</div>
  		  </div>
  		  </c:if>
  		  
  		  <c:if test="${vo.request_status == 'Cwaiting'}">
  			<div class = sendListBoxWrapper>
  				<div id = "requestStatusAlert"> 대기 </div>
  				<div class = "sendListBoxContent">
  				<div id = "requestToAlert">
  				<fmt:formatDate value="${vo.send_date }" pattern="yyyy-MM-dd HH:mm" var="send_date"/>
  					<a id = "aa">${vo.send_user_name } 님이 보낸 일촌명 변경신청  </a><a id = "aa">(${send_date })</a>
  				</div>
  				<div id = "requestNicknameAlert">
  					<a>${vo.get_user_name } (${vo.get_user_nickname })</a><br>
  					<a>${vo.send_user_name } (${vo.send_user_nickname })</a><br><br>
  				</div>
  				<div id = "requestMsgAlert">
  					<textarea readonly="readonly" >${vo.message }</textarea>
  				</div>	
  				수락하시겠습니까?<br>  	
  				<button id = "btnRefuse" onclick = " refuseRequest('${vo.send_userid}') ">거절</button>
  				<button id = "btnApply" onclick = "acceptChangeRequest('${vo.send_userid}',
  				 '${vo.send_user_name }', '${vo.send_user_nickname }','${vo.get_user_name }','${vo.get_user_nickname }')">수락</button>
  			</div>
  		  </div>
  		  </c:if>
  		  </c:forEach>	
  		  </c:if>
  		  
  		</div>
  	</div>
  	
  </div>
  
  
  	
  </div>
  <form id = "frmGoHompie" action = "/helloworld/ntBoard/ntList" method="get">
	<input type = "text" name = "homeId" value="${loginId }" hidden="hidden">
</form>


<script type="text/javascript">
	
	//취소버튼 클릭시
	function applyCancle(getUserId, status){
		var cResult = confirm('정말 취소하시겠습니까?');
		var obj = {
				'get_userid' : getUserId,
				'request_status' : status			
		}
		
		if(cResult){
		
			$.ajax({
		  	  	  type : 'delete',
		  	  	  url : '/helloworld/friend/delete',
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'DELETE'
		  	  	  },
		  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  	      window.location.reload();	  	  	     		  	  	    	  
		  	  	  }  	  
		  	});//end ajax
 		}
		
		 window.location.reload();	  
	}// end applyCancle
	
	
	//확인 버튼 클릭시
	function confirmMsg(getUserId, status){
	
		
		var obj = {
				'get_userid' : getUserId,
				'request_status' : status			
		}
		
	
		
			$.ajax({
		  	  	  type : 'delete',
		  	  	  url : '/helloworld/friend/deleteRequest',
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'DELETE'
		  	  	  },
		  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  		 window.location.reload();	  	  	     		  	  	    	  
		  	  	  }  	  
		  	});//end ajax
		 window.location.reload();
	}// end confirm
	
	//거절버튼 클릭시
	function refuseRequest(sendUserId){
		var cResult = confirm('거절 하시겠습니까?');
		
		var obj = {
				'send_userid' : sendUserId
		}
		
		if(cResult){
		
			$.ajax({
		  	  	  type : 'put',
		  	  	  url : '/helloworld/friend/refuse',
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'PUT'
		  	  	  },
		  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  	      if(result == 1){
		  	  	    	  alert('신청을 거절했습니다.');
		  	  	    	  window.location.reload();
		  	  	      }else if(result == 0){
		  	  	    	  alert('일시적인 서버 오류입니다. 나중에 다시 시도해주세요');
		  	  	      }		  	  	     		  	  	    	  
		  	  	  }  	  
		  	});//end ajax
 		}
		
	}
	
	// 수락 버튼 클릭 시
	function acceptRequest(sendUserId){
		var cResult = confirm('수락하시면 일촌이 됩니다');
		
		var obj = {
				'send_userid' : sendUserId
		}
		
		if(cResult){
		
			$.ajax({
		  	  	  type : 'put',
		  	  	  url : '/helloworld/friend/accept',
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'PUT'
		  	  	  },
		  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  	      if(result == 1){
		  	  	    	  alert('축하합니다! 일촌을 맺었습니다!');
		  	  	    	  window.location.reload();
		  	  	      }else if(result == 0){
		  	  	    	  alert('일시적인 서버 오류입니다. 나중에 다시 시도해주세요');
		  	  	      }	
		  	  	       
		  	  	  }  	  
		  	});//end ajax
 		}
		window.location.reload();
	}// end acceptRequest 

	function acceptChangeRequest(sendUserId, send_user_name, send_user_nickname, get_user_name, get_user_nickname){
		var cResult = confirm('수락하시면 일촌명이 변경됩니다');
		
		var obj = {
				'send_userid' : sendUserId,
				'send_user_name' : send_user_name,
				'get_user_name' : get_user_name,
				'get_user_nickname' : get_user_nickname,
				'send_user_nickname' : send_user_nickname
				
		}
		
		if(cResult){
		
			$.ajax({
		  	  	  type : 'put',
		  	  	  url : '/helloworld/friend/acceptChange',
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'PUT'
		  	  	  },
		  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  	      if(result == 1){
		  	  	    	  alert('축하합니다! 일촌을 맺었습니다!');
		  	  	    	  window.location.reload();
		  	  	      }else if(result == 0){
		  	  	    	  alert('일시적인 서버 오류입니다. 나중에 다시 시도해주세요');
		  	  	      }	
		  	  	       
		  	  	  }  	  
		  	});//end ajax
 		}
		window.location.reload();
	}


	$(document).ready(function(){
		
		$('.btnTap').on('click',function(){
			  $('.btnTap').removeClass('on');
			  $(this).addClass('on');
	    });
		
		$('#btnSendfrd').click(function(){
			$('#tapBoxSendContainer').show();
			$('#tapBoxGetContainer').hide();
		});
		
		$('#imgheaderlogo').click(function(){
			location.href = "/helloworld";
		});
		
		$('#btnGetfrd').click(function(){
			$('#tapBoxGetContainer').show();
			$('#tapBoxSendContainer').hide();
		});
		
		$('.btnLogout').click(function() {// 로그아웃 버튼 클릭 

			location = '/user/logout';

		});
	});
	
</script>




</body>
</html>