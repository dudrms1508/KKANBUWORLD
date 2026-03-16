<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

	<P>  The time on the server is ${serverTime}. </P>
	
	<a href="${path}/notice/list">
		게시글 조회
	</a>
	
	
	<c:if test="${empty loginMember}">
	<form action="${path}/webpage/member/login" method="POST">
		<label for="userId">아이디 : </label>
		<input type="text" id="userId" name="id" required>
		<br>
		<label for="userPwd" >비밀번호 : </label>
		<input type="password" id="userPwd" name="password" >
		<br> <br>
		
		<button type="button" onclick="location.href='${path}/webpage/member/enroll'">회원가입</button>
		<input type="submit" value="로그인">
		<button onclick="location.replace('${path}/webpage/member/login')">로그인 으로</button>
	</form>
	
	</c:if>
	<c:if test="${!empty loginMember}">
		<a href="${path}/webpage/member/myPage">
			${loginMember.name}</a>님, 안녕하세요.

		<a href="${path}/webpage/cash/acorn" onclick="window.open(this.href, '_blank','width=410, height=430'); return false;">충전</a>
		<button onclick="location.replace('${path}/webpage/member/logout')">로그아웃</button>

		<button onclick="location.replace('${path}/logout')">로그아웃</button>
		<a href="${path}/webpage/Charge/payment" onclick="window.open(this.href, '_blank','width=430,height=410'); return false;">충전</a>

	</c:if>
</body>
</html>
