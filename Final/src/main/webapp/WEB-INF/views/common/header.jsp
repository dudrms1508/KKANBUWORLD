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
	
	<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
	<link rel="stylesheet" href="resources/css/header.css">
	
	<!-- slick css -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<!-- slick JS -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<header>
			<!-- 헤더 로그인 전 -->
			<c:if test="${ empty loginMember }">
	            <div id="headerLogout">
	                <button type="button" onclick="location.href='${path}/webpage/member/login'">Login</button>
	                <button type="button" onclick="location.href='${path}/join/terms'">Join</button>
	            </div>
	        </c:if>
            <!-- 헤더 로그인 후 -->
            <c:if test="${ not empty loginMember }">
            	<div id="headerLogin">
                	<!-- 유저 -->
                	<c:if test="${ not empty loginMember && loginMember.role.equals('N') }">
                      <button type="button" onclick="location.href='${ path }/webpage/mypage/myInfo'">Mypage</button>
                      <button type="button" onclick="location.replace('${path}/webpage/member/logout')">Logout</button>
                   </c:if>
                
                   <!-- 관리자 -->
                  <c:if test="${ not empty loginMember && loginMember.role.equals('Y')}">
                      <button type="button" onclick="location.href='${path}/admin/adminMember'">Admin</button>
                      <button type="button" onclick="location.replace('${path}/webpage/member/logout')">Logout</button>
                  </c:if>
            	</div>
            </c:if>

            <!-- 로고 -->
            <div id="logo">
            	<a href="${ path }">
                	<img src="${ path }/resources/image/header/logo.jpg">
                </a>
            </div>
            <!-- 검색 -->
            <div id="search">
                <form action="${ path }/userSearch" method="get">
                    <div class="search-form">
                        <input class="text-box" type="text" id="searchUser" name="searchUser" value="${ searchUser }" placeholder="어떤 친구를 찾아볼까요?">
                        <span class="focus-border"></span>
                    </div>
                    <button type="button" id="search-button" onclick="location.href='${ path }/userSearch'"><img src="${ path }/resources/image/header/search.png"></button>
                </form>
            </div>
            <!-- 미니미 -->
            <div id="minimi">
                <img src="${ path }/resources/image/header/minimi-removebg.png">
            </div>
            <!-- 메뉴바 -->
            <div id="menu">
            
                <nav class="mainNav">
                    <ul id="mainBar">
                        <li>
                            <a href="${ path }/webpage/mypage/myInfo">마이 싸이월드 &dtrif;</a>
                            <ul>
                                <li><a href="${ path }/webpage/mypage/payhistory">구매/결제내역</a></li>
                                <li><a href="${ path }/webpage/mypage/cart">장바구니</a></li>
                                <li><a href="${ path }/webpage/mypage/myInfo">회원 정보 변경</a></li>
                                <li><a href="${ path }/webpage//mypage/sendgifthistory">선물내역</a></li>
                                <li><a href="${ path }/webpage/mypage/qnahistory">문의내역</a></li>
                                <li><a href="${ path }/webpage/mypage/report">신고내역</a></li>
                            </ul>
                        </li>
                        <li>
		
                            <a href="${ path }/webpage/shop/mainshop">선물가게 &dtrif;</a>

                            <ul>
                                <li><a href="${ path }/webpage/shop/mainshop">미니홈피 스킨</a></li>
                                <li><a href="${ path }/shop/musicShop">BGM</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${ path }/webpage/ilchon/ilchonList">일촌관리 &dtrif;</a>
                            <ul>
                                <li><a href="${ path }/webpage/ilchon/ilchonList">나의 일촌</a></li>
                                <li><a href="${ path }/webpage/ilchon/memberList">일촌 맺기</a></li>
                                <li><a href="${ path }/webpage/message/sent">일촌 쪽지</a></li>
                                <li><a href="${ path }/webpage/ilchon/inbox">일촌 신청함</a></li>
                            </ul>
                        </li>
                        <li><a href="#">고객센터</a>
                            <ul>
                                <li><a href="${ path }/webpage/qna/insert">문의하기</a></li>
                                <li><a href="${ path }/webpage/notice/list">공지사항</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                
            </div>
            <div id="text">
            	<c:if test="${ empty loginMember }">
                	<!-- <p id="text">The Journey With KKANBU WORLD</p> -->
                	<span>The Journey With KKANBU WORLD</span>
                </c:if>
                <c:if test="${ not empty loginMember }">
                	<%-- <p id="text">${ loginMember.name }님 안녕하세요 *^^*</p> --%>
                	<span>${ loginMember.name }님 안녕하세요 *^^*</span>
                </c:if>
            </div>
        </header>
	</div>