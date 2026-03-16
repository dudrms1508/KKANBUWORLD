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
	div{
		margin:80px auto;
	}
    p{
        text-align: center;
    }
    button{
        margin: auto;
        display:block;
        width: 80px;
        height: 40px;
    }
    span {
	font-weight: bold;
	color: orange;
}
</style>
</head>

<body>
	<c:if test="${not empty member}">
    <div>
        <p><span>${member.name}</span>님은 <span><fmt:formatDate value="${member.createDate}" pattern="yyyy년 MM월 dd일" /></span>에 가입하셨고,</p>
        <p>아이디는 <span>${id}</span>입니다.</p>
        <button id="btn">확인</button>
    </div>
	</c:if>
	<c:if test="${empty member}">
    <div>
        <p>잘못 입력하셨습니다.</p>
        <p>다시 정확하게 입력해 주세요</p>
        <button id="btn">확인</button>
    </div>
	</c:if>
</body>
<script>




$(document).ready(function(){
	$('#btn').on('click', function(){
		close();
	});
});
</script>
</html>