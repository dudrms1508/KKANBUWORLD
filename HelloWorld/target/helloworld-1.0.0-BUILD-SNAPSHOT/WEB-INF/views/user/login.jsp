<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">

#inputrow{
	position: relative;
    height: 29px;
    margin: 0 0 14px;
    padding: 10px 35px 10px 15px;
    border: solid 1px #dadada;
    background: #fff;
}
#inputBox{
	height: 30px;
	width: 465px;
	border-radius: 5px;
	border: 1px solid grey;
}

#memberMenu{

    height: 29px;
    padding: 10px 35px 10px 15px;  
    background: #fff;
	width: 450px;
	margin-top: 50px;
}

body{
	background-color: #fafafa;
}
#registerWrapper{
	float : right;
}

#findInfoWrapper{
	float : left;
}

#inputid{
	width: 460px;
 	height: 35px;
 	background-color: #FF6F61;
 	color: white;
 	margin: 20px 0px 10px;
 	font-size: 120%;
 	font-weight: bold;
 	border-style: none;
 	border-radius: 10px;
}

.loginFrm{
	width: 500px;
	height : 600px;
	border: 1px solid grey;
	margin: 100px auto;
	background: white;
}

a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration: underline; color: black;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >
<main id = main role="main">
<div class = "loginFrm" style="text-align: center;">
  <div id="logo" style="margin-top: 30px; margin-bottom: 30px">
  <img   src="${pageContext.request.contextPath}/resources/images/logo1.png">
  </div>	
  <!-- 
    form에서 action의 주소 표시방법
    1) 절대 경로 : /ex04/member/login-post
    2) 상대 경로 : ./login-post 또는 login-post
    상대 결로(패스)에서 .은 현재 폴더(위치)를 의미, .. 는 상위 폴더를 의미
   -->
   <div>
  	<form action="login-post" method="post">
 	<div id="inputrow"> 
 	  <input id="inputBox" type="text" name="userid" placeholder="USER ID" required autofocus>
    </div>
    <br>
    <div id="inputrow">
    	<input id="inputBox" type="password" name="password" placeholder="PASSWORD" required>
    </div>
    <br>
    
    <input type="hidden" name="targetUrl" value="${targetUrl }">
   	<input id="inputid"type="submit" value="로그인">
 	<c:if test="${login_fail eq 'fail'}"><p>아이디 비밀번호가 일치하지 않습니다.</p></c:if>
  </form>
  
  <div id = "memberMenu">
  	<div id = "registerWrapper">
  		<img src = "${pageContext.request.contextPath}/resources/images/profile.png">
  		<a href="/helloworld/user/user-register">회원가입</a>
  	</div>
 	<div id = "findInfoWrapper">
  		<img  src="${pageContext.request.contextPath}/resources/images/lockIcon.png">
  		<a href = "#" id = "btnFindId">아이디</a> / <a href ="#" id = "btnFindPw">비밀번호 찾기</a>
  	</div>
  </div>
  
  </div>
  </div>
</main>  
  <script type="text/javascript">
  
  $(document).ready(function(){
	
	  $('#btnFindId').click(function(){

				window.open("findId", "child", "width=750px, height=500px");
 
	  });
	  
	  $('#btnFindPw').click(function(){

				window.open("findPw", "child", "width=750px, height=500px");

	  });
	  
	  $('#logo').click(function() {//로고클릭 

			location = '/helloworld';

		}); // emd #logoWrapper click()
	  
	  
  });
  
  
  
  
  
  </script>
</body>
</html>