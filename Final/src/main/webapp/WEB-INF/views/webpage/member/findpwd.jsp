<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ path }/resources/css/header.css">
<link rel="stylesheet" href="${ path }/resources/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
<style>
    #wrap{
        height: 600px;
        width: 700px;
        margin: 250px auto;
    }
    #header{
        height: 20%;
        width: 100%;
        line-height: 50px;
    }
    a{
        text-decoration-line: none;
        font-size: large;
        margin: 0 5px;
    }
    #a_pwd{
        color: black;
        font-weight: 900;
    }
    #a_id{
        color: gray;
        font-weight: 500;
    }
    #contents{
        text-align: center;
    }
    #content{
        display: inline-block;
    }
    .label_div {
        position: relative;
        width: 400px;
        margin-left: 50px;
        margin-top: 40px;
    }
    
    input {
        font-size: 20px;
        color: #222222;
        width: 400px;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        border-radius:0px;
        padding-left: 10px;
        position: relative;
        background: none;
        z-index: 5;
    }
    
    input::placeholder { color: #aaaaaa; }
    input:focus { outline: none; }
    
    span {
        display: block;
        position: absolute;
        bottom: 0;
        left: 0%;  /* right로만 바꿔주면 오 - 왼 */
        background-color: #666;
        width: 0;
        height: 2px;
        border-radius: 2px;
        transition: 0.5s;
    }
    #findId{
    width: 30px;
    }
    .label {
        position: absolute;
        color: #aaa;
        left: 10px;
        font-size: 20px;
        bottom: 8px;
        transition: all .2s;
    }
    
    input:focus ~ label, input:valid ~ label {
        font-size: 15px;
        bottom: 10px;
        color: #ddd;
        font-weight: bold;
    }
    
    input:focus ~ span, input:valid ~ span {
        width: 103%;
    }
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }
    #btn{
        
    background-color:  orange;
   	color: white;
    width:150px;
    height: 30px;
    border-radius: 10px;
    cursor: pointer;
    padding: 0;
    display: block;
    margin: 0 auto;
    
    }
    p{
        text-align: center;
    }
</style>
</head>
<body>
<form action="${path}/webpage/member/findpwd" method="post">
	<div id="wrap">
	    <div id="header">
	        <a href="${path}/webpage/member/findid" id="a_id">ID 찾기</a>
	        <a href="${path}/webpage/member/findpwd" id="a_pwd">비밀번호찾기</a>
	        <hr>
	    </div>
	    <div id="contents">
	    <div id="content">
	        <div class="label_div">
	            <input type="text" id="name" name="name" required>
	            <label for="name" class="label">이름</label>
	            <span></span>
	        </div>
	        <div class="label_div">
	            <input type="text" id="id" name="id" required>
	            <label for="id" class="label">아이디</label>
	            <span></span>
	        </div>
	        <div class="label_div">
	            <input type="number" id="phone" name="phone" required maxlength="11" oninput="numberMaxLength(this);">
	            <label for="phone" class="label">핸드폰번호</label>
	            <span></span>
	        </div>
	        <div class="label_div">
	            <input type="email" id="email" name="email" required>
	            <label for="email" class="label">이메일 </label>
	            <span></span>
	        </div>
	        <div class="label_div">
	            <input type="number" id="birth" name="birth" required maxlength="8" oninput="numberMaxLength(this);">
	            <label for="birth" class="label">생년월일 ex)20000101</label>
	            <span></span>
	        </div>
	        
	        <div class="label_div">
	            <input type="submit" id="btn" value="비밀번호 찾기" >
	        </div>
	    </div>
	    </div>
	</div>
</form>

<script>
function numberMaxLength(e){

    if(e.value.length > e.maxLength){

        e.value = e.value.slice(0, e.maxLength);

   }
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>