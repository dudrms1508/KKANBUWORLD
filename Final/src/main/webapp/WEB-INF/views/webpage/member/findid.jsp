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
</head>
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
    #a_id{
        color: black;
        font-weight: 900;
    }
    #a_pwd{
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
<body>
	<div id="wrap">
        <div id="header">
            <a href="${path}/webpage/member/findid" id="a_id">ID 찾기</a>
            <a href="${path}/webpage/member/findpwd" id="a_pwd">비밀번호찾기</a>
            <hr>
        </div>
        <div id="contents">
        <div id="content">
			<form method="POST" name=iniform >
            <div class="label_div">
                <input type="text" id="name" name="name" required>
                <label for="name" class="label">이름</label>
                <span></span>
            </div>
            <div class="label_div">
                <input type="number" id="phone" name="phone" required  maxlength="11" oninput="numberMaxLength(this);">
                <label for="phone" class="label">핸드폰번호</label>
                <span></span>
            </div>
            <div class="label_div">
                <input type="number" id="birth" name="birth" required maxlength="8" oninput="numberMaxLength(this);">
                <label for="birth" class="label">생년월일 ex)20000101</label>
                <span></span>
            </div>
			</form>
            <div class="label_div">
                <input type="button" id="btn" value="아이디 찾기" onclick="openPopup()" >
            </div>
        </div>
        </div>
    </div>
    
<script>
function openPopup() {

    window.open("", 'popOpen', 'fullscreen=no,menubar=no,status=no,toolbar=no,titlebar=no,location=no,scrollbar=auto,width=600,height=300');

    iniform.target="popOpen";
    iniform.action="${path}/webpage/member/findid2";

    iniform.submit();

}
function numberMaxLength(e){

    if(e.value.length > e.maxLength){

        e.value = e.value.slice(0, e.maxLength);

   }
}
       /*
    $(document).ready(function(){
    	
       방법1 창크기 조절 x
       $('#btn').on('click', function(){
    	let formObj = $('<form>', {'id': 'formData', 'action': '${path}/webpage/member/findid2', 'method':'POST', 'target':'_blank'});
    	let name = $('<input>', {'name': 'name', 'value': name});
    	let phone = $('<input>', {'name': 'phone', 'value': phone});
    	let birth = $('<input>', {'name': 'birth', 'value': birth});
    	formObj.append(name);
    	formObj.append(phone);
    	formObj.append(birth);
    	 $(document.body).append(frmObj);
    	 $('#fm_formIO').submit(); */

        /* 	
         // 방법2 post로 안가짐
          $('#btn').on('click', function(){
        	  
	         let url = '${ path}/webpage/member/findid2';
	         let status = 'left=600px, top=200px, width =600px, height=400px';
	         open(url,'_blank',status);
          }
           */
         
         /* 
          let url = '${ path}/webpage/member/findid2';
         let status = 'left=600px, top=200px, width =600px, height=400px';
         
    	 open( ,"findid",status); 
    	 
		   var myForm = $('form[name=popForm]');
		   //var url = "${path}/webpage/member/findid2";
		   //myForm.action =url; 
		   myForm.method="post";
		   myForm.target="_blank";
		   myForm.find('input[name=name]').val();
		   myForm.find('input[name=phone]').val();
		   myForm.find('input[name=birth]').val();
		  myForm.submit(); 
        });
    });
		   */
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>