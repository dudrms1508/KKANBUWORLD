<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.requestPageMain{

	width: 480px;
	height: 380px;
	border: 1px solid grey;
	padding: 15px 20px 20px;
	background-color: #ff6F6B;
	border-style: none;
	border-radius: 20px;
}
.pp{
	margin: 10px 0px 10px;
	
}
.lblapplyInput{
	margin: 10px 0px 10px
}
.lblAlert{
	font-size: 80%;
	color: grey;
}
#ptheaderF{
	font-size: 130%;
	font-weight: bold;
	float: left;
	margin: 7px 5px;
}
#requestHeader{
 	width: 430px;
 	height: 40px;
 	position: relative;
}
#requestPageContent{
	width: 430x;
	height: 340px;
	border-style: none;
	border-radius: 20px;
	background-color: white;
	margin: 0px auto;
	padding: 20px;
	position: relative;
	
}
#getUsersWrapper{
	width: 440px;
	height: 80px;
	float: left;
	padding-top: 5px;
	border-top:1px solid grey;
	border-bottom: 1px solid grey;
	
}
#ptoMsgWrapper{
	width : 200px;
	margin-left: 30px;
	float: left;
	position: relative;
}
#inputWrapper{
	width : 440px;
	padding: 10px;
	display: block;
	float: left;
}
#btnWrapper{
	text-align: center;
}
#btnApply{
	width : 100px;
	height: 35px;
	background-color: #FF6F6B;
	color : white;
	border-style:none;
	border-radius:10px;
	font-size: 120%;
	margin-top: 15px;
	
}
#btnCancle{
	width : 100px;
	height: 35px;
	background-color: white;
	color : #FF6F6B;
	border: 2px solid #FF6F6B;
	border-radius:10px;
	font-size: 120%;
	margin-left: 60px;
}
#imgHeader{
	float:left;
}
#txtMsg{
	width: 400px;
	height: 40px;
	resize: none;
}


hr{
	margin:5px 10px 5px;
	border-style: 1px dotted grey;
	float: left;
}
input{
	width: 100px;
	height: 25px;
}

</style>
</head>
<body>
<div id = "requestHeader">
<img id = "imgHeader" src="${pageContext.request.contextPath}/resources/images/logoIcon40px.png">
<p id = "ptheaderF">일촌명 변경</p>
</div>
<hr>
<div class = "requestPageMain">
	<div id = "requestPageContent">
		<label>보내는 이 : ${vo.send_user_name }</label> 
		<br>
	<div id = "getUsersWrapper">
		<img id = "imgHeader" src=" ${pageContext.request.contextPath}/resources/images/tempProfile.png">
		<div id = "ptoMsgWrapper">
		<p class = "pp">${vo.get_user_name } 님에게 </p>
		<p class = "pp">일촌명 변경을 요청합니다.</p>	
		</div>		
	</div>
	<br>
	<div id = "inputWrapper">
		<label class = "lblapplyInput"><b>${vo.get_user_name }</b>님을 <b>${vo.send_user_name }</b>님의
		 <input id = "inputGetnick" type = "text" placeholder="일촌명 입력"> 로 </label><br><br>
		<label class = "lblapplyInput"><b>${vo.send_user_name }</b>님을 <b>${vo.get_user_name }</b>님의
		 <input id = "inputSendnick" type = "text" placeholder="일촌명 입력"> 로 </label><br><br>
		
		<textarea id = "txtMsg" placeholder="보내고 싶은 메세지를 입력하세요"></textarea><br>
		<label class = "lblAlert"> - 상대방이 동의하면 일촌명이 변경됩니다.</label>
	</div>
	<br>
	<div id = "btnWrapper">
		<button id = "btnApply">보내기</button>
		<button id = "btnCancle">취소</button>
	</div>
	
		
	</div>
</div>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		$('#btnApply').click(function(){
			var send_userid = '${vo.send_userid}';
			var send_user_name = '${vo.send_user_name}';
			var get_userid = '${vo.get_userid}';
			var get_user_name = '${vo.get_user_name}';
			var get_nickname = $('#inputGetnick').val();
			var send_nickname = $('#inputSendnick').val();
			var message = $('#txtMsg').val();
			
			if(get_nickname == '' || get_nickname == null){
				alert('상대방의 일촌명을 정해주세요');
				return;
			}
			
			if(send_nickname == '' || send_nickname == null){
				alert('본인의 일촌명을 정해주세요');
				return;
			}	
			
			if(get_nickname.length > 6){
				alert('닉네임은 6자 이내로 정해야합니다.');
				return;
			}
			
			if(send_nickname.length > 8){
				alert('닉네임은 6자 이내로 정해야합니다.');
				return;
			}
			
			if(message.length>20){
				alert('메세지가 너무 깁니다.');
				return;
			}
			
			var obj = {
				'send_userid' : send_userid,
				'send_user_name' : send_user_name,
				'get_userid' : get_userid,
				'get_user_name' : get_user_name,
				'get_user_nickname' : get_nickname,
				'send_user_nickname' : send_nickname,
				'message' : message			
			}
			
	  	  	$.ajax({
	  	  	  type : 'post',
	  	  	  url : '/helloworld/friend/changeNickname',
	  	  	  headers : {
	  	  	    'Content-Type' : 'application/json',
	  	  	    'X-HTTP-Method-Override' : 'POST'
	  	  	  },
	  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
	  	  	  success : function(result){
	  	  	     if(result == 1){
	  	  	    	  alert('성공적으로 일촌명변경 신청이 되었습니다.');
	  	  	    	  window.close();
	  	  	      }else{
	  	  	    	  alert('이미 요청된 일촌명 변경요청입니다.');
	  	  	      }
	  	  	     
	  	  	    	  
	  	  	  }  	  
	  	  	  });//end ajax
			
		}); //end btnApply clicked
		
		$('#btnCancle').click(function(){
			window.close();
		});
		
		
		
	});
	
	



</script>


</body>
</html>