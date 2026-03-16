<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${ path }/js/jquery-3.6.3.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Open+Sans&display=swap');
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        * {
            font-family: 'GmarketSansMedium';
        }
        body {
            font-family: 'Noto Sans', sans-serif;
        }
        div {
            box-sizing: border-box;
        }
        
        .wrap{
            width:1200px;
            height:800px;
            margin:auto;
        }

        #header{
            margin-top: 50px;
        }
/* 메뉴바 */
        #navigator {
            /* margin-top: 10px; */
            height: 5%;
        }

        #navi{
            list-style-type: none;
            background-color: orangered;
            background-color: orangered;
            margin:0;
            padding:0;
            height:100%;
            position: relative;
        }

        #navi> li{
            float:left;
            width:25%;
            height:100%;
            text-align:center;
            font-size:13px;
            line-height:5px;
        }
        
        #navi> li:hover{
            background-color: orangered;
        }

        #navi a{
            text-decoration: none;
            color: white;
            font-size: 1.5em;
            font-weight: 900;
            height: 100%;
           line-height: 35px;
            vertical-align: middle;
        }

        #navi>li>ul a:hover{
            color: orangered;
            
        }

        #navi>li>ul{
            list-style-type: none;
            display: none;
            background-color: wheat;
            padding: 5px 0 0 0 ;
            margin: 5px 0 0 0 ; 
            opacity: 1;
        }

        #navi>li:hover>ul{
            display: block;
        }

        #navi>li>ul>li:hover {
            display: block;
            transition: ease 1s;
        }

        #navi>li>ul a{
            font-size: 1.4em;
            color: orangered;
        }

        #section {
            height: 85%;
            font-family: 'GmarketSansMedium';
            z-index:1;
        }

        table {
            width: 100%;
            height: 100%;
            /* border-width:medium; */
            /* border-bottom: 1px solid; */
            text-align:center;
            font-size: 14px;
        }

        #content1 {
            margin-top: 50px;
            height: 5%;
        }

        #content2 {
            margin-top: 10px;
            /* border-style: solid; */
            background-color: wheat;
            height: 90%;
        }

        #userNo {
            width: 7%;
        }

        #userName {
            width: 10%;
        }

        #userId {
            width: 19%;
        }

        #enrollDate {
            width: 15%;
        }

        #status {
            width: 15%;
        }

        #content3 {
            /* height: 3%; */
            /* margin-top:1px;  */
            text-align:center;
            background-color: orangered;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
        }
        
        #content4 {
            height: 15%;
            margin-top:10px; text-align:right;
        }

        button {
            font-weight: bold;
            background-color: white;
            color: black;
            border: 3px solid;
        }

        td {
            border-bottom: 1px solid orange;
        }

        thead {
            background-color: orangered;
            color: white;
            font-weight:bold; 
        }

        #delete {
        height: 25px;
        box-sizing: border-box;
        width: 80%;
        /* margin-top: 10px; */
        background-color: orangered;
        font-weight: bold;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        }

        #logout {
        height: 30px;
        box-sizing: border-box;
        width: 10%;
        margin-top: 1px;
        background-color: orangered;
        font-weight: bold;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        }
    </style>

</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header1"> 
                <h1 align="center">Admin page</h1>
            </div>
        </div>

        <div id="navigator">
            <ul id="navi">
                <li>
                    <a href="${ path }/admin/adminMember">회원 관리</a>
                </li>
                <li>
                    <a href="${ path }/admin/adminQnA?table=QNA">문의 관리</a>
                
                </li>
                <li>
                    <a href="${ path }/admin/report?table=REPORT">신고 관리</a>
                </li>
                <li>
                    <a>상품 관리</a>
                    <ul>
                        <li><a href="${ path }/admin/product?product=MINIMI">미니미</a></li>
                        <li><a href="${ path }/admin/product?product=BGM">BGM</a></li>
                        <li><a href="${ path }/admin/product?product=THEME">테마</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div id="section">
            <div id="content1">
                <h2 align="center">회원 관리</h2>
            </div>
            <div id="content2">
            <table class="test1">
                <thead>
                <tr height="30">
                	<td id="userNo">회원번호</td>
                    <td id="userName">이름</td>
                    <td id="userId">아이디</td>
                    <td>이메일</td>
                    <td id="createDate">회원가입일</td>
                    <td id="status" colspan="2">관리</td>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="member" items="${memberlist}">
	                <tr id="infomation">
	                	<td>${member.no}</td>
	                    <td>${member.name}</td>
	                    <td>
	                    	<a href="${ path }/admin/minihomepage?no=${member.no}">
	                    		${member.id}
	                    	</a>
	                    </td>
	                    <td>${member.email}</td>
	                    <td>
							<fmt:formatDate value="${member.createDate}" pattern="yyyy-MM-dd" type="date"/>
	                    </td>
	              		<c:if test="${ member.status.equals('Y')}">
	                    	<td>
	                    		<button id="delete" onclick="location.href='${ path }/admin/status?no=${member.no}&state=S'">회원 정지</button>
	                    		<%-- <button id="delete" onclick="updateMemberStatus('${member.no}', '${ member.status }');">회원 정지</button> --%>
	                    	</td>
	                    </c:if>
	                    <c:if test="${ member.status.equals('S')}">
		                    <td>
		                    	<button id="delete" onclick="location.href='${ path }/admin/status?no=${member.no}&state=Y'">정지 해제</button>
		                    </td>
	                    </c:if>
		                    <td>
		                    	<button id="delete" onclick="memberDelete(${member.no}, '${ member.status }');">회원 삭제</button>
		                    </td>
	                </tr>							
                </c:forEach>	
            </tbody>
            </table>
        </div>
    
        <div id="content3">
        <!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/admin/adminMember?page=1&table=MEMBER'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/admin/adminMember?page=${ pageInfo.prevPage }&table=MEMBER'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<!--  -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage }">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='${ path }/admin/adminMember?page=${ status.current }&table=MEMBER'">${ status.current }</button>
						</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/admin/adminMember?page=${ pageInfo.nextPage }&table=MEMBER'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/admin/adminMember?page=${ pageInfo.maxPage }&table=MEMBER'">&gt;&gt;</button>
        </div>
        <div id="content4">
            <span>&nbsp;&nbsp;<button id="logout" onclick="location.href='${ path }'">관리자 로그아웃</button></span>
        </div>
            <p align="center" style="font-size: small;">Copyright © semi 3. All rights reserved.</p>
            <br>
        </div>     
    </div>
    <script>
    	function memberDelete(no, state) {
    	
   			if(state == 'S'){
   				if(confirm("정말 삭제 하시겠습니까?")) {
   					location.href='${ path }/admin/status?no=' + no + '&state=N'
   				} 
   			} else {
   				alert("정지된 회원만 삭제할 수 있습니다.");
   			}
    		
    	}
    	
    </script>
  
</body>
</html>