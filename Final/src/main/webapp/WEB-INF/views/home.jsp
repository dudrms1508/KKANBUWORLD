<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<%@ include file="common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title>깐부월드 홈페이지</title>
	
	<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
	<link rel="stylesheet" href="resources/css/home.css">
	
	<!-- slick css -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<!-- slick JS -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<section>
		
			<div id="noticeBanner1">
				<span>! 깐부월드에서 알려드립니다 : </span>
			</div>
			<div id="noticeBanner2">
				<span><a id="result1" href="${ path }/noticeView"></a></span>
			</div>
			
            <!-- 공지 게시판 -->
				<div class="banner">
					<div>
						<img src="resources/image/home/banner01.jpg">
					</div>
					<div>
						<img src="resources/image/home/banner02.jpg">
					</div>
					<div>
						<img src="resources/image/home/banner03.jpg">
					</div>
				</div>
				
            <!-- 메인 페이지 로그인 전 -->
            <c:if test="${ empty loginMember }">
	            <div id="login">
	                <form action="${ path }/webpage/member/login" method="POST">
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
	                        <a id="findA" href="${ path }/webpage/member/findid">ID/PW 찾기</a>
	                    </div>
	                    <div class="btnWrapper">
	                        <a id="joinA" href="${ path }/join/terms">회원가입</a>
	                        <label for="loginBtn">로그인 버튼</label>
	                        <input type="submit" id="loginBtn" value="로그인">
	                    </div>
	                    <div class="kakao">
	                        <a id="kakaoA" href="${ path }/login/kakao">
	                            <img src="resources/image/home/kakao.png">
	                        </a>
	                    </div>
	                    <%-- <div class="google">
	                        <a id="googleA" href="${ path }/">
	                            <img src="resources/image/home/google.png">
	                        </a>
	                    </div> --%>
	                </form>
	            </div>
            </c:if>
            
            <!-- 메인 페이지 로그인 후 변경 레이아웃-->
            <c:if test="${ !empty loginMember }">
	        	<div id="infoTab">
	                <div id="tab1">
	                    <table>
	                        <tr>
	                            <td id="tab1Id">
	                                ${ loginMember.id }
	                            </td>
	                            <td id="tab1Title">
	                                깐부와 함께
	                            </td>
	                            <td id="tab1Total">
	                                ${ loginMember.createDate }
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	                <div id="infoTabImg">
	                    <img src="${ memberMinihome.profile }">
	                </div>
	                <div id="tab2">
	                    <table>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                오늘 방문자
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${ path }/">${ minihomeToday.today }</a>
	                            </td>
	                        </tr>
	                        <%-- <tr>
	                            <td id="tab2Title" colspan="2">
	                                선물함
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${ path }/">90</a>
	                            </td>
	                        </tr> --%>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                새 방명록
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${ path }/">${ visitorCount }개</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                내 일촌
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${ path }/">${ ilchonCount }명</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" colspan="2">
	                                쪽지
	                            </td>
	                            <td id="tab2Total" colspan="2">
	                                <a href="${ path }/">${ messageCount }개</a>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td id="tab2Title" style="height: 20px;">
	                                <img src="resources/image/home/acorn.png">
	                            </td>
	                            <td id="tab2Title">	                                
	                            ${getAcorn}
								</td>
	                            <td id="tab2Total">	                                
									<a class="tab2Total-a" href="${path}/webpage/Charge/payment" onclick="window.open(this.href, '_blank','width=430,height=250'); return false;">
										<span>충전</span>
									</a>
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	                
	                <!-- 미니홈피 방문 버튼 -->
	                <!-- 감싸고 있는 div에도 경로 필요 (버튼의 여백을 눌러도 이동이 가능해짐) -->
	                <div id="tab3" class="minihomeBtn">
	                    <span id="tab3Home">내 미니홈피</span>
	                    <button id="tab3Btn" class="minihomeBtn" type="button">
	                        <img src="resources/image/home/homecolor.png">
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
                        <img src="${path}/${minihomeTotalList1.minihome.profile}">
                    </div>
					<div id="todayText">
						<h1>
							today total Best 1
						</h1>
						<p style="color: rgb(238, 121, 101);">
							방문자 ${ minihomeTotalList1.count }
						</p>
						<p>
							${ minihomeTotalList1.member.name }님의 미니홈피
						</p>
						<p>
							${ minihomeTotalList1.minihome.intro }
						</p>
					</div>
	                    <div id="visitHome">
<%-- 	                    <c:if test="${ not empty minihomeTotalList1 }"> --%>
<%--                     		<c:forEach var="total1" items="${ minihomeTotalList1 }"> --%>
		                        <p>
		                        	${ minihomeTotalList1.member.name } (${ minihomeTotalList1.member.id })
		                        </p>
<%--                         	</c:forEach> --%>
<%-- 		                </c:if> --%>
                    </div>
                    <div>
<%--                  	  <c:if test="${ not empty minihomeTotalList1 }"> --%>
<%--                  		<c:forEach var="total1" items="${ minihomeTotalList1 }"> --%>
	                        <button id="visitBtn" class="minihomeBtn1" type="button">
	                            <span>방문하기</span>
	                        </button>
<%--                         </c:forEach> --%>
<%-- 		             </c:if> --%>
                    </div>
                </div>
                <div id="weeklyTop">
                    <div id="todayTitle">
                        <img src="${path}/${minihomeTotalList2.minihome.profile}">
                    </div>
                    <div id="todayText">
<%--                     	<c:if test="${ not empty minihomeTotalList2 }"> --%>
<%--                     		<c:forEach var="total2" items="${ minihomeTotalList2 }"> --%>
		                        <h1>
		                            today total Best 2
		                        </h1>
		                        <p style="color: rgb(238, 121, 101);">
		                            방문자 ${ minihomeTotalList2.count }
		                        </p>
		                        <p>
		                            ${ minihomeTotalList2.member.name }님의 미니홈피
		                        </p>
		                        <p>
		                            ${ minihomeTotalList2.minihome.intro }
		                        </p>
<%--                         	</c:forEach> --%>
<%-- 		                </c:if> --%>
                    </div>
                    <div id="visitHome">
<%--                     	<c:if test="${ not empty minihomeTotalList2 }"> --%>
<%--                     		<c:forEach var="total2" items="${ minihomeTotalList2 }"> --%>
		                        <p>
		                            ${ minihomeTotalList2.member.name } (${ minihomeTotalList2.member.id })
		                        </p>
<%-- 		                     </c:forEach> --%>
<%-- 		                </c:if> --%>
                    </div>
                    <div>
                        <button id="visitBtn" class="minihomeBtn2" type="button">방문하기</button>
                    </div>
                </div>
            </div>
            
            <!-- 나의 일촌 목록 -->
            <c:if test="${ not empty loginMember }">
	            <div id="friendText">
	                <span>
	                    나의 일촌 목록
	                </span>
	            </div>
	            
	            <!-- 로그인 후 -->
	            <div id="friend">
	                <div>
						<table id="friendContent">
							<c:if test="${ not empty list }">
								<c:forEach var="ilchon" items="${ list }">
									<tr>
										<td>
											<img src="${path}/${ilchon.minihomeAdd.profile}">
										</td>
										<td id="friendlist">
											${ ilchon.member.name }<br>(${ ilchon.ilchonNick })
					                    </td>
										<td>
											<button id="friendBtn" class="ilchonBtn" type="button" onclick="ilchonVisit('${ilchon.minihomeAdd.minihomeNo}');">방문하기</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
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
					<img src="${path}/${findPhotoTotal1.url}">
						<figcaption>
							<p>
								<button class="minihomeBtn3" type="button">
									${ findPhotoTotal1.member.name } (${ findPhotoTotal1.member.id })
								</button>
							</p>
							<div>
								<h2><span>${ findPhotoTotal1.title }</span></h2>
							</div>
						</figcaption>
				</figure>
            </div>
            
            <!-- 오늘의 토픽 2 -->
            <div id="topic2">
                <figure class="best2">
                    <img src="${path}/${findPhotoTotal2.url}">
                    	<figcaption>
							<p>
								<button class="minihomeBtn4" type="button">
									${ findPhotoTotal2.member.name } (${ findPhotoTotal2.member.id })
								</button>
							</p>
							<div>
								<h2><span>${ findPhotoTotal2.title }</span></h2>
							</div>
						</figcaption>
				</figure>
            </div>
            
            <!-- 오늘의 토픽 3 -->
            <div id="topic3">
                <figure class="best3">
                	<img src="${path}/${findPhotoTotal3.url}">
                    	<figcaption>
							<p>
								<button class="minihomeBtn5" type="button">
									${ findPhotoTotal3.member.name } (${ findPhotoTotal3.member.id })
								</button>
							</p>
							<div>
								<h2><span>${ findPhotoTotal3.title }</span></h2>
							</div>
						</figcaption>
				</figure>
            </div>
        </section>
    </div>
    
<script>
function Popup(){
	window.open("${ path }/gift/giftList","giftPopUp","top=50,left=0,width=430,height=450,toolbar=0,status=0,scrollbars=1,resizable=0");
}

<c:if test="${ not empty giftList }">
window.onload = Popup(); // 팝업창 띄우기
</c:if>

	/* 미니홈피 팝업 */
	$('#tab3').on("click", function() {
		 
		let popUrl = "${ path }/minihome/minihomepage/${ memberMinihome.minihomeNo }";
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	
	/* 미니홈피 팝업 */
/* 	$('.ilchonBtn').on("click", function() {

		
		let popUrl = "${ path }/minihome/minihomepage/${ilchon.member.minihomeNo}" ;
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		}); */
		
	function ilchonVisit(minihomeNo) {
			
		
		let popUrl = "${ path }/minihome/minihomepage/" + minihomeNo ;
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
			
		}

		
 	$('.minihomeBtn1').on("click", function() {

	
		let popUrl = "${ path }/minihome/minihomepage/${minihomeTotalList1.minihomeNo}" ;
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	
	$('.minihomeBtn2').on("click", function() {
		 
		let popUrl = "${ path }/minihome/minihomepage/${minihomeTotalList2.minihomeNo}";
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	
	$('.minihomeBtn3').on("click", function() {
		 
		let popUrl = "${ path }/minihome/minihomepage/${findPhotoTotal1.minihome.minihomeNo}";
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	
	$('.minihomeBtn4').on("click", function() {
		 
		let popUrl = "${ path }/minihome/minihomepage/${findPhotoTotal2.minihome.minihomeNo}";
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	
	$('.minihomeBtn5').on("click", function() {
		 
		let popUrl = "${ path }/minihome/minihomepage/${findPhotoTotal3.minihome.minihomeNo}";
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	

	/* 공지사항 slick */
	$( document ).ready(function() {
		$('.banner').slick({
			slidesToShow: 2,
			slidesToScroll: 1,
			autoplay: true,
			autoplaySpeed: 2000,
			infinite : true
		});
	});
	
	/* 사진첩 게시글 마우스 효과 */
	$(".hover").mouseleave(
		    function () {
		        $(this).removeClass("hover");
		    }
		);
	
	/* 공지사항 최신 게시글 */
	$(document).ready(function() {
        let table = 'NOTICE';
        
        $.ajax({
           type: 'GET',
           url: '${ path }/preview',
           dataType: 'json',
           data: {
              table
           },
           success: (obj) => {
              let result = '';
              
              console.log(obj);
              
                 result = obj.title;
                 
                 let result2 = obj.no;


              $('#result1').html(result);
           }
        });
  	});
	
	/* 회원가입 경과일 */
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
	
	
</script>

<%@ include file="common/footer.jsp" %>