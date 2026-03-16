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
<title>API 테스트</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> -->
</head>
<body>
	<h2>카카오 로그인 API 테스트</h2>
	
	<form action="${ path }/login/kakao" method="POST">
	<button>post 로그인 테스트</button>
	</form>
	
<!-- 카카오 로그인 -->
<a href="${ path }/api/logout">로그아웃</a>
<a href="${ path }/api/logout/kakao">카카오 진짜 로그아웃</a>
	
<script>

</script>
</body>
</html>