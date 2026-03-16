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
</head>
<body>
	<h2>선물하기 테스트 페이지</h2>
	
	<form name="iniform" id="ini"  method="post">
<!-- 		<input type="hidden" name="appno" value="a"> -->
<!-- 		<input type="hidden" name="nm" value="b"> -->
<!-- 		<input type="hidden" name="fee" value="c">	 -->
<!-- 		<input type="hidden" name="mobile" value="d"> -->
<!-- 		<input type="hidden" name="email" value="e"> -->

		<input name="appno" value="a">
		<input name="nm" value="b">
		<input name="fee" value="c">
		<input name="mobile" value="d">
		<input name="email" value="e">
	</form>
	
	
	<button type="button" id="btn1" onclick="openPopup()">선물하기</button>
<!--    <a href="#none" target="_blank" onclick="openPop()">팝업 클릭</a> -->

<script>
// function openPop() {

// 	window.open('http://www.naver.com', '네이버팝업', 'width=700px,height=800px,scrollbars=yes');

// }

function openPopup( ) {

	window.open("", 'popOpen', 'fullscreen=no,menubar=no,status=no,titlebar=no,location=no,scrollbar=auto,top=200,left=500,width=430,height=500');

	iniform.target="popOpen";
	iniform.action="${path}/gift/send";

	iniform.submit();



}

</script>
</body>
</html>