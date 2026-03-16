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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title>깐부월드 홈페이지</title>
	
	<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
	<link rel="stylesheet" href="${ path }/resources/css/home.css">
	
	<!-- slick css -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<!-- slick JS -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>
	<div class="wrapper">
		<section>
            <!-- 공지 게시판 -->
            <div class="banner">
                <div><img src="${ path }/resources/image/home/banner01.jpg"></div>
                <div><img src="${ path }/resources/image/home/banner02.jpg"></div>
                <div><img src="${ path }/resources/image/home/banner03.jpg"></div>
                <div><img src="${ path }/resources/image/home/banner01.jpg"></div>
                <div><img src="${ path }/resources/image/home/banner02.jpg"></div>
                <div><img src="${ path }/resources/image/home/banner03.jpg"></div>
            </div>
            <!-- 메인 페이지 로그인 전 -->
            <c:if test="${empty loginMember}">
	            <div id="login">
	                <form action="${path}/webpage/member/login" method="POST">
	                    <label for="userId" class="labelId">아이디</label>
	                    <input type="text" id="userId" name="id" required placeholder="ID"><br>
	                    <label for="userPwd" class="labelPw">비밀번호</label>
	                    <input type="password" id="userPwd" name="password" placeholder="PASSWORD">
	                    <div class="loginCheck">
	                        <input type="checkbox" id="idCheck">
	                        <label for="idCheck">아이디 저장</label>
	                        <input type="checkbox" id="pwCheck">
	                        <label for="pwCheck">자동 로그인</label>
	                    </div>
	                    <div class="account">
	                        <span class="text">아이디 또는 비밀번호를 잊으셨나요?</span>
	                        <a id="findA" href="${path}/webpage/member/findid">ID/PW 찾기</a>
	                    </div>
	                    <div class="btnWrapper">
	                        <a id="joinA" href="${path}/join/terms">회원가입</a>
	                        <label for="loginBtn">로그인 버튼</label>
	                        <input type="submit" id="loginBtn" value="로그인">
	                    </div>
	                    <div class="kakao">
	                        <a id="kakaoA" href="${path}/login/kakao">
	                            <img src="${ path }/resources/image/home/kakao.png">
	                        </a>
	                    </div>
	                    <div class="google">
	                        <a id="googleA" href="${path}/">
	                            <img src="${ path }/resources/image/home/google.png">
	                        </a>
	                    </div>
	                </form>
	            </div>
            </c:if>
            
            <!-- 메인 페이지 로그인 후 변경 레이아웃-->
            <c:if test="${!empty loginMember}">
	        	<div id="infoTab">
	                <div id="tab1">
	                    <table>
	                        <tr>
	                            <td id="tab1Id">
	                                swimming
	                            </td>
	                            <td id="tab1Title">
	                                깐부와 함께
	                            </td>
	                            <td id="tab1Total">
	                                20230428일
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	                <div id="infoTabImg">
	                    <img src="${ path }/resources/image/home/defaultProfile.jpeg">
	                </div>
	                <div id="tab2">
	                    <table>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                오늘 방문자
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${path}/">960826</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                선물함
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${path}/">90</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                새 게시물
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${path}/">8</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                일촌신청
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${path}/">2</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                쪽찌
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${path}/">28</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" style="height: 20px;">
	                                <img src="${ path }/resources/image/home/acorn.png">
	                            </td>
	                            <td id="tab2Title">
	                                1004
	                            </td>
	                            <td id="tab2Total">
	                                <button id="buy" type="button" onclick="">
	                                    <span id="buyText">충전</span>
	                                </button>
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	                <!-- 미니홈피 방문 버튼 -->
	                <!-- 감싸고 있는 div에도 경로 필요 (버튼의 여백을 눌러도 이동이 가능해짐) -->
	                <div id="tab3" onclick="location.href='${ path }/minihomeTest/${ memberMinihome.minihomeNo }'">
	                    <span id="tab3Home">내 미니홈피 ${ memberMinihome.minihomeNo }</span>
	                    <button id="tab3Btn" type="button">
	                        <img src="${ path }/resources/image/home/homecolor.png">
	                    </button>
	                </div>
	            </div>
            </c:if>
            
            <!-- 인기유저 -->
            <div id="popularText">
                <span>화제의 인물</span>
            </div>
            <div id="popular">
                <div id="todayTop">
                    <div id="todayTitle">
                        <img src="${ path }/resources/image/home/defaultProfile.jpeg">
                    </div>
                    <div id="todayText">
                        <h1>
                            today total 1
                        </h1>
                        <p style="color: rgb(238, 121, 101);">
                            방문자 1,000
                        </p>
                        <p>
                            수수수수님의 미니홈피
                        </p>
                        <p>
                            안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요
                            안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요
                        </p>
                    </div>
                    <div id="visitHome">
                        <p>
                            황수영 (syaa11)
                        </p>
                    </div>
                    <div>
                        <button id="visitBtn" type="button" onclick="location.href='${ path }'">
                            <span>방문하기</span>
                        </button>
                    </div>
                </div>
                <div id="weeklyTop">
                    <div id="todayTitle">
                        <img src="${ path }/resources/image/home/minimi.jpg">
                    </div>
                    <div id="todayText">
                        <h1>
                            weekly total 1
                        </h1>
                        <p style="color: rgb(238, 121, 101);">
                            방문자 1,000
                        </p>
                        <p>
                            수수수수님의 미니홈피
                        </p>
                        <p>
                            안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요
                            안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요
                        </p>
                    </div>
                    <div id="visitHome">
                        <p>
                            황수영 (swimming)
                        </p>
                    </div>
                    <div>
                        <button id="visitBtn" type="button" onclick="location.href='${ path }'">방문하기</button>
                    </div>
                </div>
            </div>
            <!-- 나의 일촌 목록 -->
            <c:if test="${!empty loginMember}">
	            <div id="friendText">
	                <span>
	                    나의 일촌 목록
	                </span>
	            </div>
	            <!-- 로그인 후 -->
	            <div id="friend">
	                <div>
	                    <table id="friendContent">
	                        <tr>
	                            <td>
	                                <img src="${ path }/resources/image/home/defaultProfile.jpeg">
	                            </td>
	                            <td>
	                                김영근<br>(일촌명)
	                            </td>
	                            <td>
	                                <button id="friendBtn" type="button" onclick="location.href='${ path }'">방문하기</button>
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
            </c:if>
            <div id="topicText">
                <span>Hot Topic > Photo</span>
            </div>
            <!-- 오늘의 토픽 1 -->
            <div id="topic1">
                <figure class="best1">
                    <img src="${ path }/resources/image/home/lemoncake.jpg">
                    <figcaption>
                        <p>userID (미니홈피 이름)</p>
                        <div>
                            <h2><span>봄처럼 상큼한 맛! 레몬 케이크 레시피</span></h2>
                        </div>
                    </figcaption>
                    <a href="${path}/"></a>
                </figure>
            </div>
            <!-- 오늘의 토픽 2 -->
            <div id="topic2">
                <figure class="best2">
                    <img src="${ path }/resources/image/home/food.jpg">
                    <figcaption>
                        <p>userID (미니홈피 이름)</p>
                        <div>
                            <h2><span>화제의 예능 '서진이네' 정유미 유부김밥 만들기</span></h2>
                        </div>
                    </figcaption>
                    <a href="${path}/"></a>
                </figure>
            </div>
            <!-- 오늘의 토픽 3 -->
            <div id="topic3">
                <figure class="best3">
                    <img src="${ path }/resources/image/home/cherryblossoms.jpg">
                    <figcaption>
                        <p>userID (미니홈피 이름)</p>
                        <div>
                            <h2><span>국내 최대 벚꽃축제, 진해 군항제 정보 모음</span></h2>
                        </div>
                    </figcaption>
                    <a href="${path}/"></a>
                </figure>
            </div>
        </section>
    </div>

<script>
function Popup(){
	window.open("${ path }/gift/giftList","giftPopUp","top=50,left=0,width=430,height=450,toolbar=0,status=0,scrollbars=1,resizable=0");
}

// 	Popup();
// window.addEventListener('load', function() {
// })
// window.onload = function() {
// window.onload = Popup();

// if 조건 주기 1. 로그인 했을 때 2. 선물이 있을 때
// 	1. loginMember != null 
// var list = '<c:out value="${list}"/>';
// <c:set var="giftList" value="${ giftList }" />
// <c:if test="${ not empty giftList }">  // 새고해야 뜸

// jstl 잘 안먹어서 controller에서 처리해주게 만듦
// </c:if>
// 	<c:if test="${ not empty giftList }">
		window.onload = Popup(); // 팝업창 띄우기
// 	</c:if>


// $(document).ready(() => {
	
	
	var createDate = "<fmt:formatDate value="${ loginMember.createDate }" pattern="yyyy-MM-dd" />";
	var today = new Date();
	
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	
	const getDateDiff = (d1, d2) => {
	  const date1 = new Date(d1);
	  const date2 = new Date(d2);
	  
	  const diffDate = date1.getTime() - date2.getTime();
	  
	  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
	}

	console.log(createDate + ', ' + dateString)
	
	var soFar = getDateDiff(createDate, dateString);
	
	console.log(soFar);
	
	$(document).ready(() => {
		$('#tab1Total').html(soFar + '일');
		
	});
	
	
		

	$('.banner').slick({
		slidesToShow: 2,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2000,
		infinite : true
	});


	$(".hover").mouseleave(
	    function () {
	        $(this).removeClass("hover");
	    }
	);
	
// })

</script>
