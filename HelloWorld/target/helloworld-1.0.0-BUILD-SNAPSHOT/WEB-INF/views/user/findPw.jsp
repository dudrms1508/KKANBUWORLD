<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">

.findPwMain{
	width: 635px;
	height: 290px;
	border: 1px solid grey;
	padding: 30px 31px 15px;
	font-family: '돋움',Dotum,AppleGothic,sans-serif;
}

.frmLabel{
	font-family: '돋움',Dotum,AppleGothic,sans-serif;
	font-size: 90%;
}

.frmInput{
	width: 220px;
	height: 25px;

}

.frmSpan{
	width: 75px;
	height: 25px;
	display: block;
}
.afterVerified{
	display: none;
}

p{
	font-size: 80%;
}

button:hover{
	cursor: pointer;
}


#ptheaderF{
	font-size: 130%;
	font-weight: bold;
	float: left;
	margin: 7px 5px;
}
#byPhoneFrm{
	display: block;
}
#byEmailFrm{
	display: none;
}
#btnFindPw{
 	width: 630px;
 	height: 35px;
 	background-color: #FF6F61;
 	color: white;
 	margin: 20px 0px 10px;
 	font-size: 120%;
 	font-family: '굴림',Gulim,AppleGothic,sans-serif;
 	font-weight: bold;
 	border-style: none;
 	border-radius: 10px;
}
#btnendFind{
	width: 300px;
	height: 30px;
	background-color: #FF6F61;
 	color: white;
 	font-size: 110%;
 	font-family: '굴림',Gulim,AppleGothic,sans-serif;
 	border-style: none;
 	border-radius: 10px;
 	margin-left: 160px;
 	
}
#btnCheckingId{

	width: 550px;
 	height: 35px;
 	background-color: #FF6F61;
 	color: white;
 	margin: 20px 50px 10px;
 	font-size: 120%;
 	font-family: '굴림',Gulim,AppleGothic,sans-serif;
 	font-weight: bold;
 	border-style: none;
 	border-radius: 10px;
 	

}
#idInput{
	width: 550px;
	height: 30px;
	margin: 50px;
	display: block;

}
#lblidInfo{
	padding : 100px;
	margin-left: 30px;
	font-size: 110%;
	display: block;
}
#findHeader{
 	width: 630px;
 	height: 40px;
}
#imgHeader{
	float:left;
}



</style>
</head>
<body>
<div id = "findHeader">
<img id = "imgHeader" src="${pageContext.request.contextPath}/resources/images/logoIcon40px.png">
<p id = "ptheaderF">비밀번호 찾기 </p>
</div>
<hr>
<p id = "pp">찾고자 하는 비밀번호의 아이디를 입력해 주세요</p>

<div class = findPwMain>

	<div class = "beforeVerified">
		<input id = "idInput" type = "text" placeholder = "아이디를 입력해주세요">
		<button id = "btnCheckingId">다음</button>
	</div>


	<div class = "afterVerified">
	<input class = "radio" type = "radio" id = "rb_phone" name = "rb" checked="checked">
	<label for="rb_phone" ><b>회원정보에 등록한 휴대전화로 인증</b></label>
	<div id = "byPhoneFrm">
		<p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 찾을수 있습니다.</p>
		<span class = "frmSpan"><label class = "frmLabel">이름</label></span>
		<input class = "frmInput" type = "text" id = "byPhoneNInput"> <br>
		<span class = "frmSpan"><label class = "frmLabel">휴대전화</label></span>
		<input class = "frmInput" type = "text" id = "byPhonePInput" placeholder="하이픈(-) 없이 입력해주세요"><br>
	</div>
	<br>
	<br>
	<input class = "radio" type = "radio" id = "rb_email" name = "rb">
	<label for="rb_phone"><b>회원정보에 등록한 이메일로 인증</b></label>
	<div id = "byEmailFrm">
		<p>회원정보에 등록한 이메일과 입력한 이메일이 같아야, 찾을수 있습니다.</p>
		<span class = "frmSpan"><label class = "frmLabel">이름</label></span>
		<input class = "frmInput" type = "text" id = "byEmailNInput"> <br>
		<span class = "frmSpan"><label class = "frmLabel">이메일</label></span>
		<input class = "frmInput" type = "text" id = "byEmailEInput" placeholder="이메일"><br>	
	</div>
	<button id = btnFindPw>비밀번호 찾기</button>
	</div>	
</div>



<script type="text/javascript">



$(document).ready(function(){
	
	  var userid = '';
	  
	  
	  $('#btnCheckingId').click(function(){
		  var idInput = $('#idInput').val();
		  console.log(idInput);
		  var url = '/helloworld/find/checkid?userid=' + idInput;
		  var obj = {'userid' : idInput}; 
		  	  	
		  	  	$.ajax({
		  	  	  type : 'get',
		  	  	  url : url,
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'GET'
		  	  	  },
		  	  	   // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  	      if(result == "" || result == null){
		  	  	     	 alert('등록되어 있지 않은 아이디 입니다.');
		  	  	      }else{
		  	  	    	 userid = result;
		  	  	    	 
		  	  	    	 $('#pp').html('비밀번호 찾으실 방법을 선택하세요');
		  	  	     	 $('.beforeVerified').css("display", "none");
		  				 $('.afterVerified').css("display", "block"); 
		  	  	    	
		  	  	      }
		  	  	  	 } 
		  	  	    });
		  	  	  
		  	  	     
		  	  	
		  
		  
		  
	  });
	  
	  
	  
	
	  $('#btnFindPw').click(function(){
			
		  var fstName = $('#byPhoneNInput').val();
		  var phoneInput = $('#byPhonePInput').val();
		  var scdName = $('#byEmailNInput').val();
		  var emailInput = $('#byEmailEInput').val();
		
		  var show = '';
		  if($("input:radio[name='rb']:radio[id='rb_phone']").is(":checked")){
			   
		  	  	var obj = {
		  	  		'userid' : userid,	
		  	  	    'user_name' : fstName,
		  	  		'user_phone' : phoneInput,	
		  	  	}; 
		  	  	
		  	  if(fstName == '' || phoneInput == ''){
				  alert('모든항이 올바르게 입력되었는지 확인하세요.');
				  return;
			  }
		  	  	
		  	  	$.ajax({
		  	  	  type : 'post',
		  	  	  url : '/helloworld/find/pw',
		  	  	  headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'POST'
		  	  	  },
		  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
		  	  	  success : function(result){
		  	  	      if(result == "" || result == null){
		  	  	     	 alert('입력하신 정보로 아이디를 찾을 수 없습니다. 다시 확인해주세요.');
		  	  	      }else{
		  	  	    	 show += '<label id = "lblidInfo">회원님의 비밀번호는 [ <b>' + result + ' </b>] 입니다. 로그인해주세요</label><br>'
		  	  	    	 	   + '<button id = "btnendFind">확인</button>' ;
		  	  	    	 $('#pp').remove();
		  	  	    	 $('#btnFindPw').remove();
		  	  	    	 $('.findPwMain').empty();  
		  	  	    	 $('.findPwMain').html(show);	
		  	  	    	 
		  	  	    	$('#btnendFind').click(function(){
		  	  	    	self.close(); 
		  	  	     });
		  	  	      }
		  	  	     // end if()
		  	  	  } // end success
		  	  	  
		  	  	});// end ajax
		  }// end if
		
		  if($("input:radio[name='rb']:radio[id='rb_email']").is(":checked")){
			  var obj = {
					  	'userid' : userid,
			  	  	    'user_name' : scdName,
			  	  		'user_email' : emailInput,	
			  	  	}; 
			  if(scdName == '' || emailInput == ''){
				  alert('모든항이 올바르게 입력되었는지 확인하세요.');
				  return
			  }
			  	  	
			  	  	$.ajax({
			  	  	  type : 'post',
			  	  	  url : '/helloworld/find/pw',
			  	  	  headers : {
			  	  	    'Content-Type' : 'application/json',
			  	  	    'X-HTTP-Method-Override' : 'POST'
			  	  	  },
			  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
			  	  	  success : function(result){
			  	  	      if(result == "" || result == null){
			  	  	     	 alert('입력하신 정보로 아이디를 찾을 수 없습니다. 다시 확인해주세요.');
			  	  	      }else{
			  	  	    	 show += '<label id = "lblidInfo">회원님의 비밀번호는 [ <b>' + result + ' </b>] 입니다. 로그인해주세요</label><br>'
			  	  	    	 	   + '<button id = "btnendFind">확인</button>' ;
			  	  	    	 $('#pp').remove();
			  	  	    	 $('#btnFindPw').remove();
			  	  	    	 $('.findPwMain').empty();  
			  	  	    	 $('.findPwMain').html(show);	
			  	  	    	 
			  	  	    	$('#btnendFind').click(function(){
			  	  	    	self.close(); 
			  	  	     });
			  	  	      }
			  	  	     // end if()
			  	  	  } // end success
			  	  	  
			  	  	});// end ajax
		  }
			 
		  
		  
		
				
	  });// end findMethod
	  
	  $("input:radio[name='rb']:radio[id='rb_phone']").click(function(){
		
		 
			  $('#byPhoneFrm').css("display", "block");
			  $('#byEmailFrm').css("display", "none");   
	  });
	  
	  $("input:radio[name='rb']:radio[id='rb_email']").click(function(){
				
		  $('#byPhoneFrm').css("display", "none");
		  $('#byEmailFrm').css("display", "block");   
  	  });
	  
			  
		 
	  
	  
	  
	  
});
	



</script>

</body>
</html>