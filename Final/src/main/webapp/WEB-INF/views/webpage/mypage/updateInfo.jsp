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
<meta charset="UTF-8">
<title>내정보 수정</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
<link rel="stylesheet" href="${ path }/resources/css/header.css">
<link rel="stylesheet" href="${ path }/resources/css/footer.css">
<style>
    #wrapdiv {
        width: 1200px;
        height: 100%;
        margin: 0 auto;
        /* border: 1px solid red; */
    }

    #wrapdiv>div {
        float: left;
        /* box-sizing: border-box; */
    }

    #wrapleftdiv {
        width: 650px;
        /* border: 1px solid black; */
    }

    #categorydiv {
        height: 30px;
        border-bottom: 1px solid lightgray;
        margin-bottom: 30px;
    }

    #categoryul {
        /* border: 1px solid blue; */
        list-style-type: none;
        margin: 0px;
        padding: 0px;
        height: 100%;
    }

    #categoryul>li {
        float: left;
        width: 120px;
        height: 100%;
    }

    #categoryul>li>button {
        width: 100%;
        height: 100%;
        border-radius: 10px 10px 0px 0px;
        border: 1px solid lightgrey;
        border-bottom: 0px;
        background-color: white;
        color: rgb(243, 156, 18);
        font-weight: bold;
    }

    #categoryul>:not(#myInformation)>button {
        color: darkgray !important;
    }

    #myInformation {
        border-bottom: 2px solid rgb(243, 156, 18);
    }

    #privatetextdiv {
        height: 30px;
    }

    #rectanglediv {
        border: 2px solid skyblue;
        /* height: 80px; */
        height: 100%;
        padding: 20px;
    }

    #rectanglediv>div {
        /* border: 1px solid black; */
        display: flex;
        align-items: center;
        height: 100%;
    }

    table {
        border-collapse: separate;
        border-spacing: 0px 12px;
    }

    table td {
        font-size: 16px;
        height: 27px;
    }

    
    /* readonlyClass */
    table td .inputchg {
        width: 200px;
        border: 1px solid lightgray;
        border-radius: 4px;
        height: 20px;
        padding: 2px 3px 0px 3px;
        margin: 0px;
        height: 90%;
    }
    
    .tdbold {
        font-weight: bold;
    }

    .readonlyClass {
        border: 0px solid black;
        outline: none;
        background-color: white;
        font-size: 14px;
        /* font-weight: bold; */
    }

    .readonlyClass:focus {
        outline: none;
    }

    .readonlyClass:hover{
        cursor: default;
    }

    .inputchg::placeholder {
        color: lightgray;
    }

    .inputchg:focus {
        outline: 1px solid rgb(245, 124, 77);
        border: 1px solid white;
    }

    td>.tdbtn {
        margin-left: 5px;
        background-color: whitesmoke;
        border: 1px solid lightgray;
        border-radius: 4px;
        height: 100%;
        font-size: 12px;
    }

    td label {
        float: left;
        margin-right: 15px;
        /* border: 1px solid black; */
    }

    td input[type="radio"] {
        margin: 0px;
        height: 18px;
        vertical-align: middle;
    }

    td input[type="radio"]+span {
        vertical-align: middle;
    }

    #btmbtndiv {
        display: flex;
        justify-content: center;
    }

    #btmbtndiv>input {
        margin: 15px 20px;
        border: 0px;
        /* border: 1px solid lightgray; */
        border-radius: 4px;
        font-size: 14px;
        font-weight: bold;
        background-color: rgb(243, 156, 18);
        color: white;
        height: 30px;
        width: 80px;
      	cursor: pointer;
    }


    #certTr {
        display: none;
    }
    
    
    /* 마이페이지 프로필 div */
    #mPrectanglediv {
        border: 1px solid;
        width: 320px;
        margin: 50px 0px 0px 50px;
        height: 200px;    
    }

    #mPrectanglediv>div {
        box-sizing: border-box;
    }

    #mPrectopdiv {
        height: 15%;
    }
    
    #mPrectopdiv>div {
        /* border: 1px solid red; */
        height: 30px;
    }

    #mPrectopdiv>div>span {
        display: flex;
        height: 100%;
        justify-content: center;
        align-items: center;
    }

    #mPrecmiddiv {
        /* border: 1px solid red; */
        /* margin-top: 3px; */
        /* height: 130px; */
        height: 70%;
    }

    #mPrecbttmdiv {
        height: 15%;
    }

    #mPrecmiddiv>div {
        float: left;
        box-sizing: border-box;
        height: 100%;
    }

    #mPgapdiv {
        /* border: 1px solid; */
        width:4%;
    }

    #mPprofileimgdiv {
        width: 42%;
        position: relative;
        border: 1px solid lightgray;
    }

    #mPprofileimgdiv>img {
        /* border: 1px solid black; */
        width: 100%;
        height: 100%;
        /* width: 125px; */
        /* height: 125px; */
    }

    #mPmiddlegapdiv {
        width: 2%;
    }

    #mPcontentrightdiv {
        /* border: 1px solid violet; */
        width: 52%;
    }

    #mPcontentrightdiv>div {
        /* border: 1px solid red; */
        box-sizing: border-box;
    }

    #mPinnercontent1 {
        height: 15%;
    }

    #mPinnercontent1>div {
        height: auto;
        float: left;
        box-sizing: border-box;
        font-size: 12px;
    }

    #mPtodaycount {
        /* width: 60%; */
        display: flex;
        justify-content: center;
        /* align-items: center; */
    }
    
    #mPtotalcount {
        /* width: 40%; */
        display: flex;
        /* align-items: center; */
        justify-content: center;
    }

    #mPinnercontent2 {
        height: 15%;
    }

    #mPinnercontent2>div {
        float: left;
        /* border: 1px solid red; */
        height: 100%;
        box-sizing: border-box;
    }

    #mPinnername {
        display: flex;
        align-items: center;
    }

    #mPinnerhome {
        display: flex;
        align-items: center;
    }
    
    #mPinnercontent2>div>span {
        /* border: 1px solid black; */
    }

    #mPinnercontent3 {
        height: 45%;
    }
    
    #mPinnercontent4 {
        height: 20%;
    }

    #mPlineheightsizediv {
        line-height: 15px;
    }

    .material-symbols-outlined {
        font-variation-settings:
        'FILL' 100,
        'wght' 200,
        'GRAD' 0,
        'opsz' 48;
        color: rgb(243, 156, 18);
    }

    #mPinnercontent3>div {
        height: 100%;
    }

    #mPprofilecontent {
        width: 100%;
        height: 100%;
    }

    #mPprofilecontent>textarea {
        border: 0px;
        box-sizing: border-box;
        margin: 0px;
        padding: 5px 0px;
        font-size: 13px;
        overflow: scroll;
        overflow-x: hidden;
        overflow-y: scroll;
        resize: none;
        outline: none;
        height: 100%;
        width: 99%;
    }

    #mPprofilecontent>textarea::-webkit-scrollbar {
        width: 7px;
    }

    #mPprofilecontent>textarea::-webkit-scrollbar-thumb {
        background-color: rgb(243, 156, 18);
        border-radius: 10px;
        height: 1px;
    }

    #mPprofilecontent>textarea::-webkit-scrollbar-track {
        background-color: rgba(0,0,0,0);
    }

    #mPinnercontent4>div {
        /* border: 1px solid black; */
        float: left;
        height: 100%;
        box-sizing: border-box;
        display: flex;
        align-items: last baseline;
    }

    #mPsmallimg {
        margin-right: 3px;
    }

    .mPacornsmallimg {
        width: 13px;
        height: 17px;
    }

    #mPholdacorn>span {
        font-size: 14px;
        color: rgb(243, 156, 18);
    }

    #mPrecbttmdiv>div {
        float: left;
        height: 100%;
        box-sizing: border-box;
    }

    #mPrecbttmdiv>div>div {
        float: left;
        height: 100%;
    }

    #mPrecbttm0 {
        width: 5%;
    }

    #mPrecbttm1 {
        /* border: 1px solid black; */
        width: 30%;
    }

    .mPbttmblue {
        color: rgb(120, 186, 231);
        display: flex;
        align-items: center;
    }


    #mPrecbttm1>.material-symbols-outlined {
        /* font-size: 16px; */
        color: rgb(243, 156, 18);
        display: flex;
        align-items: center;
    }

    #mPrecbttm2 {
        width: 30%;
    }

    #mPrecbttm2>div{
        display: flex;
        align-items: center;
        height: 100%;
    }

    #mPfeelingimg>img {
        height: 60%;
        color: rgb(243, 156, 18);
        /* width: 80%; */
    }

    #mPrecbttm3 {
        width: 30%;
    }

    #mPrecbttm3>div {
        display: flex;
        align-items: center;
    }

    #mPrecbttm4 {
        width: 5%;
    }

</style>
</head>
<body>
    <div id="wrapdiv">
        <div id="wrapleftdiv">
            <div id="categorydiv">
                <ul id="categoryul">
                    <li id="myInformation"><button>내정보</button></li>
                    <li id="passwordchg"><button onclick="location.href='${ path }/webpage/mypage/changePwd'">비밀번호변경</button></li>
                    <li id="deleteAccount"><button onclick="location.href='${ path }/webpage/mypage/accountdel'">회원탈퇴</button></li>
                </ul>
            </div>
            <div id="privatetextdiv">
                <span><b>${ loginMember.name }님의 정보</b></span>
                <span style="color: rgb(243, 156, 18);"></span>
            </div>
            <form action="${ path }/webpage/mypage/updateInfo" method="post" id="tableformdiv">
                <div id="rectanglediv">
                    <div id="tablediv">
                        <table>
                            <tr>
                                <td style="width: 150px;" class="tdbold">아이디</td>
                                <td style="width: 200px;">${ loginMember.id }</td>
                            </tr>
                            <tr>
                                <td class="tdbold">이름</td>
                                <td>${ loginMember.name }</td>
                            </tr>
                            <tr>
                                <td class="tdbold">휴대폰번호</td>
                                <td><input type="tel" id="phone" name="phone" value="${ loginMember.phone }" class="inputchg" placeholder="휴대폰번호를 입력하세요." pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"></td>
                            </tr>
                            <tr>
                                <td class="tdbold">생년월일</td>
                                <c:set var="birth" value="${ loginMember.birth }" />
                                <c:set var="year" value="${ fn:substring(birth, 0, 4) }" />
                                <c:set var="month" value="${ fn:substring(birth, 4, 6) }" />
                                <c:set var="day" value="${ fn:substring(birth, 6, 8) }" />
                                <td>${ year }년 ${ month }월 ${ day }일</td>
                            </tr>
                            <tr>
                                <td class="tdbold">이메일</td>
                                <td><input type="text" id="email" name="email" value="${ loginMember.email }" class="inputchg" placeholder="이메일을 입력하세요."></td>
                                <td><button type="button" class="tdbtn" id="emailcertbtn" disabled="disabled">인증</button></td>
                            </tr>
                            <tr id="certTr">
                                <td></td>
                                <td><input type="text" class="inputchg" id="mailcertInput" style="border-spacing: 0px !important;" placeholder="인증번호를 입력하세요."></td>
                                <td><span id="emailMsg"></span></td>
                            </tr>
                            <tr>
                                <td class="tdbold">주소</td>
                                <td><input type="text" name="address" class="inputchg" value="${ loginMember.address }" placeholder="주소를 입력하세요."></td>
<!--                                 <td><button type="button" class="tdbtn">주소입력</button></td> -->
                            </tr>
<!--                             <tr> -->
<!--                                 <td></td> -->
<!--                                 <td><input type="text" class="inputchg" style="border-spacing: 0px !important;" placeholder="상세주소"></td> -->
<!--                                 <td></td> -->
<!--                             </tr> -->
                            <tr>
                                <td class="tdbold">검색허용</td>
                                <td>
                                	<c:if test="${ loginMember.searchMe eq 'Y' }">
	                                    <label>
	                                        <input type="radio" name="searchMe" class="radioClass" value="Y" checked>
	                                        <span>허용</span>
	                                    </label>
	                                    <label>
	                                        <input type="radio" name="searchMe" class="radioClass" value="N">
	                                        <span>비허용</span>
	                                    </label>
                                	</c:if>
                                	<c:if test="${ loginMember.searchMe eq 'N' }">
	                                    <label>
	                                        <input type="radio" name="searchMe" class="radioClass" value="Y">
	                                        <span>허용</span>
	                                    </label>
	                                    <label>
	                                        <input type="radio" name="searchMe" class="radioClass" value="N" checked>
	                                        <span>비허용</span>
	                                    </label>
                                	
                                	</c:if>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="btmbtndiv">
                    <input type="button" onclick="location.href='${ path }/'" id="back" value="돌아가기"></input>
                    <input type="submit" id="updatebtn" value="수정하기"></input>
                </div>
            </form>
        </div>

        <div id="wraprightdiv">
            <div id="myPagediv">
                <div id="mPrectanglediv">
                    <div id="mPrectopdiv">
                        <div><span style="font-size: 13px; color: grey;">싸이월드 미니홈피에 오신 것을 환영합니다.</span></div>
                    </div>
                    <div id="mPrecmiddiv">
                        <div id="mPgapdiv"></div>
                        <div id="mPprofileimgdiv">
                            <img src="${ path }/${ myMinihome.profile }" alt="">
                        </div>
                        <div id="mPmiddlegapdiv"></div>
                        <div id="mPcontentrightdiv">
                            <div id="mPinnercontent1">
                                <div id="mPtodaycount"><span style="color: grey;">TODAY</span>&nbsp;<span style="color: rgb(243, 156, 18);"><b><fmt:formatNumber value="${ minihomeToday.today }" pattern="#,###" /></b></span>&nbsp;&nbsp;</div>
                                <div id="mPlineheightsizediv">|</div>
                                <div id="mPtotalcount">&nbsp;&nbsp;<span><b><fmt:formatNumber value="${ minihomeToday.total }" pattern="#,###" /></b></span></div>
                            </div>
                            <div id="mPinnercontent2">
                                <div id="mPinnername"><span><b>${ loginMember.name }</b></span></div>
                                <div id="mPinnerhome"><span class="material-symbols-outlined">home</span></div>
                            </div>
                            <div id="mPinnercontent3">
                                <div id="mPprofilecontent"><textarea readonly>${ myMinihome.intro }</textarea></div>
                            </div>
                            <div id="mPinnercontent4">
                                <div id="mPsmallimg"><img class="mPacornsmallimg" src="${ path }/resources/image/mypage/acornone.png"></div>
                                <div id="mPholdacorn"><span><b>${ loginMember.acorn }</b></span></div>
                            </div>
                        </div>
                    </div>
    
                    <div id="mPrecbttmdiv">
                        <div id="mPrecbttm0"></div>
                        <div id="mPrecbttm1">
                            <div id="mPtodayfeeling" class="mPbttmblue">today is..</div>
                            <div id="mPfeelingimg" class="material-symbols-outlined"></div>
                        </div>
                        <div id="mPrecbttm2">
                            <div id="mPrelativediv" class="mPbttmblue">일촌&nbsp;</div>
                            <div id="mPrelativecount">9,999</div>
                        </div>
                        <div id="mPrecbttm3">
                            <div id="mPmbtidiv" class="mPbttmblue">MBTI&nbsp;</div>
                            <div id="mPdetailmbtidiv">${ myMinihome.mbti }</div>
                        </div>
                        <div id="mPrecbttm4"></div>
                    </div>
    
                </div>
            <!-- myPagediv 끝 -->
            </div>
        </div>
    </div>
    
    
    
    
<script>
window.onload = function() {
	// 검색허용 현재 가진 값으로 checked 되도록
	// 이메일 검사
	
	
    // 휴대전화 하이픈(-) 넣는 함수
    function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }



    // 휴대전화 하이픈 넣는 keyup 이벤트
    var phoneInput = document.getElementById('phone');
    phoneInput.onkeyup = function(event){
        event = event || window.event;
        var phone_val = this.value.trim();
        this.value = autoHypenPhone(phone_val);
    }


    // 휴대폰번호 메시지만 이벤트 막는거는 버튼에서하기
    phoneInput.addEventListener('keyup', () => {
        let phone = document.getElementById('phone').value;
        var phoneRegExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		
        console.log(phoneReady);
        
        if(!phoneRegExp.test(phone)) {

            phoneReady = false;
            return false;
        } else {

        	phoneReady = true;
            return true;
        }
        

    });
    
    // 이메일 인증 버튼
    let certTr = document.getElementById('certTr');

    // 이메일 중복검사
    // 이메일 인증번호 검사

        // 이메일 유효성 (++ 중복 검사도 해야함...)
    let emailInput = document.getElementById('email');
    let emailcertbtn = document.getElementById('emailcertbtn');
    
    emailInput.addEventListener('keyup', () => {
        let emailRegExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        let email = document.getElementById('email').value;
        
        if(email == "") {
            document.getElementById('emailMsg').innerHTML = '';
            emailcertbtn.disabled = true;
            emailDuplReady = false;
            return false;
        } else if(!emailRegExp.test(email)) {
            emailcertbtn.disabled = true;
            emailDuplReady = false;
            return false;
        } else {
        	// 인증버튼 활성화
            emailcertbtn.disabled = false;
            emailDuplReady = false;
            return true;
        }
    });
    
    // 수정 이벤트
    let updatebtn = document.getElementById('updatebtn');
	let myEmail = "<c:out value = '${ loginMember.email }' />";
    let myPhone = "<c:out value = '${ loginMember.phone }' />";
	let myAddress = "<c:out value = '${ loginMember.address }' />";
    let mysearchMe = "<c:out value = '${ loginMember.searchMe }' />";
	let searchMe = document.querySelector('input[name="searchMe"]:checked').value;
	
	
	
	updatebtn.addEventListener('click', (event) => {
		console.log(myEmail)
		console.log(myPhone)
		console.log(myAddress)
		console.log(mysearchMe)
		console.log(searchMe)
		
/* 		event.preventDefault();
		return false;
 */		
		// 현재 이메일이 아니면 수정하기 눌렀을 때 submit 안되도록
		
		if(myEmail == document.getElementById('email').value
			&& myPhone == document.getElementById('phone').value 
			&& mysearchMe == searchMe) {
			
			alert('변경사항이 없습니다.');
            event.preventDefault();
            return false;
            
		} else if(myEmail != document.getElementById('email').value || myPhone != document.getElementById('phone').value) {
			
			// 이메일이 달라!
			if(myEmail != document.getElementById('email').value && myPhone == document.getElementById('phone').value) {
				if(!emailReady) {
		            alert('이메일을 변경하시려면 인증해주세요.');
		            event.preventDefault();
		            return false;
		        } else if(!emailDuplReady) {
		            alert('사용할 수 없는 이메일 입니다. 다른 이메일을 사용해주세요.');
		            event.preventDefault();
		            return false;
		        } else {
		        	return true;
		        }
				
				// 휴대폰이 달라!
			} else if(myEmail == document.getElementById('email').value && myPhone != document.getElementById('phone').value) {
		        if(!phoneReady) {
		            alert('사용할 수 없는 휴대폰 번호 입니다.');
		            event.preventDefault();
		            return false;
				} else if(!phoneDuplReady) {
		            alert('중복된 휴대폰 번호 입니다. 다른 번호를 입력해주세요.');
		            event.preventDefault();
		            return false;
		        } else {
		        	return true;
		        }
		        
		        // 이메일, 폰 값이 둘다 달라!
			} else {
				if(!emailReady) {
		            alert('이메일을 변경하시려면 인증해주세요.');
		            event.preventDefault();
		            return false;
		        } else if(!emailDuplReady) {
		            alert('사용할 수 없는 이메일 입니다. 다른 이메일을 사용해주세요.');
		            event.preventDefault();
		            return false;
		        } else if(!phoneReady) {
		            alert('사용할 수 없는 휴대폰 번호 입니다.');
		            event.preventDefault();
		            return false;
				} else if(!phoneDuplReady) {
		            alert('중복된 휴대폰 번호 입니다. 다른 번호를 입력해주세요.');
		            event.preventDefault();
		            return false;
		        } else {
		        	return true;
		        }
			}
		} else {
			
        	return true;
            
        }
		

		
	// 제출 이벤트 끝
    });
    
    
    
    

}
</script>
<script>

    //이메일 검사 기본값 선언 false (++ 중복검사하기)
    let emailReady = false;
    
    //휴대폰번호 검사 선언! (++ 중복검사 하기)
    let phoneReady = false;
    
    
    // 중복검사 아이디, 이메일, 휴대폰번호
    let emailDuplReady = false;
    let phoneDuplReady = false;
    
    $(document).ready(() => {
        
        $('#email').on('keyup', () => {
            let email = $('#email').val();
            
            $.ajax({
                url: '${ path }/join/check',
                type: 'POST',
                dataType: 'json',
                data: {
                    email
                },
                success: (data) => {
                    console.log(data);
                    console.log(data.duplicatedEmail)
                    
                    if(data.duplicatedEmail) {
                        
                        // 중복 이메일 있음
                        // 중복되면 버튼 비활성화
                        $('#emailcertbtn').attr('disabled',true);
                        $('#emailcertbtn').css('cursor','pointer');
//                      $('#emailMsg').html('중복된 이메일 입니다.').css('color', 'deeppink');
                        emailDuplReady = false;
                    } else {
                        
                        // 중복 이메일 없음
                        emailDuplReady = true;
                    }
                },
                error: (error) => {
                    console.log(error)
                }
                
                
            // ajax 끝
            });
            
            
        // 이메일 keyup 이벤트 끝
        });
        
        
        // 휴대폰번호 중복 검사
        $('#phone').on('keyup', () => {
            let phone = $('#phone').val();
            
            $.ajax({
                url: '${ path }/join/check',
                type: 'POST',
                dataType: 'json',
                data: {
                    phone
                },
                success: (data) => {
                    console.log(data);
                    console.log(data.duplicatedPhone)
                    
                    if(data.duplicatedPhone) {
                        
                        // 중복 휴대폰 있음
                        $('#phoneMsg').html('중복된 휴대폰번호 입니다.').css('color', 'deeppink');
                        phoneDuplReady = false;
                    } else {
                        
                        // 중복 휴대폰 없음
                        phoneDuplReady = true;
                    }
                },
                error: (error) => {
                    console.log(error)
                }
                
                
            // ajax 끝
            });
            
            
        // 이메일 keyup 이벤트 끝
        });
        
        
        
        
        
        // 이메일 인증 버튼
        $('#emailcertbtn').click(function() {
            // let mailcertInput = $('#mailcertInput') // 인증번호 입력 input태그
            
            let emailaddress = $('#email').val(); // 이메일 주소값 얻어오기!
            console.log('완성된 이메일 : ' + emailaddress); // 이메일 오는지 확인
            
            // 이메일 검사 테스트
            console.log(emailReady);
            
            
            $.ajax({
                type : 'get',
                url : '${path}/webpage/mypage/update/mailCheck',
    // 			dataType: 'json',
                data: {
                    emailaddress
                },
                success : function (data) {
                    console.log("data : " +  data);
                    // 인증버튼 비활성화
                    $('#emailcertbtn').attr('disabled',true);
                    $('#emailcertbtn').css('cursor','default');
                    // 성공하면 이메일도 readonly
                    $('#email').attr('readonly',true);
                    // 숨겨져있던 input display는 block으로
                    $('#certTr').css('display', 'contents');
                    
                    code = data;
                    $('#emailMsg').html('인증번호가 전송되었습니다.');
                }			
            }); // end ajax
        }); // end send email   
    
        
        // 인증번호 비교
        $('#mailcertInput').blur(function () {
            const inputCode = $(this).val();
            mailcertInput
            
            if(inputCode === code){
                $('#emailMsg').html('인증번호가 일치합니다.').css('color','green');
                $('#email').attr('readonly',true);
                // 인증 일치하면 true로
                emailReady = true;
                console.log(emailReady);
            }else{
                $('#emailMsg').html('인증번호가 불일치 합니다. 다시 확인해주세요.');
                $('#emailMsg').css('color','red');
                // 인증 실패하면 false
                emailReady = false;
                console.log(emailReady);
            }
        });
        
        
    
});
    
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>