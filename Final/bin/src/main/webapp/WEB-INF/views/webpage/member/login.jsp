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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
  window.Kakao.init("0c166c05c3439af3336d5b46a1be95f2");
</script>
<script>
function kakaoLogin(){
	window.Kakao.Auth.login({
    scope:'profile_nickname, account_email, gender',
    success: function(authObj){
      console.log(authObj);
      window.Kakao.API.request({
        url:'/v2/user/me',
        success: res =>{
          const kakao_account = res.kakao_account;
          console.log(kakao_account);
        }
    });
    }
  });
}
function googleLogin(){
	location.href='<%=request.getAttribute("googleLoginUrl")%>'
}
function naverLogin(){
	location.href='<%=request.getAttribute("naverLoginUrl")%>'
}
</script>
<style>
	.button{
		color: black;
	}
	.body{
		text-align:center;
	}
	
	#wrap{
	    border: 1px solid #dae1e6;
	    width:700px; 
	    margin: auto; 
	    padding:60px 10px;
	    text-align: center;
	}
	#content{
	    width:100%; 
	    margin: auto; 
	}
	.a_find{
		padding: 30px;
	}
	
	#input_id{
	    width:300px;
	    height:30px;
	    font-size:20px;
	    font-family:Comic Sans MS;
	    margin-bottom: 10px;
	}
	#input_pwd{
	    width:300px;
	    height:30px;
	    font-size:20px;
	    font-family:Comic Sans MS;
	    margin-bottom: 10px;
	}
	#input_login{
	    width:310px; 
	    font-size:25px;
	}
	
</style>
</head>
<body>
	

	<div id="wrap">
	<div id="content">	
	
		<form action="${path}/webpage/member/login" method="post" >
		    <input type="text" id="input_id" name="id" placeholder="ID">
		    <br>
		    <input type="password" id="input_pwd" name="password" placeholder="password">
			<br>
		    <input type="submit" id="input_login" class="button"  value="로그인"><br>
		</form> 
		
		<div class="a_find">
		  	<a href="${path}/webpage/member/findid" style =" text-decoration:none;color: blue;">ID 찾기 </a>
			|
			<a href="${path}/webpage/member/findpwd" style =" text-decoration:none;color: blue;">비밀번호 찾기 </a>
			|
			<a href="" style =" text-decoration:none;color: blue;">회원가입 </a>
		</div>
	  
 			<a href="javascript:kakaoLogin();"><img  src="../resources/image/kakao.png" width="300" height="60"></a><br>
	    
			<img  src="${path}/resources/image/kakao.png" width="300" height="60" onclick="kakaoLogin()"><br>
			<img  src="../resources/image/google.png" width="300" height="60" onclick="googleLogin()"><br>
			<img  src="../resources/image/naver.png" width="300" height="60" onclick="naverLogin()"><br>
		  
	</div>
	</div>
</body>
</html>