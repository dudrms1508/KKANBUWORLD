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
            margin-top: 10px;
            height: 5%;
        }

        #navi{
            list-style-type: none;
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

        #pNo {
            width: 7%;
        }

        #pCate {
            width: 13%;
        }

        #pName {
            width: 25%;
        }

        #price {
            width: 10%;
        }

        #pStatus {
            width: 10%;
        }
        
        #status {
            width: 12%;
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
        
        #register {
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
                    <a href="${ path }/admin/adminMember?table=MEMBER">회원 관리</a>
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
                <h2 align="center">상품 관리 - ${category}</h2>
            </div>
            <div id="content2">
            <table class="test1">
                <thead>
                <tr height="30">
                	<td id="pNo">상품번호</td>
                    <td id="pCate">품목</td>
                    <td id="pName">상품명</td>
                    <td id="price">가격</td>
                    <td id="pStatus">판매 상태</td>
                    <td id="status" colspan="3">관리</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${productlist}">
                <tr id="infomation">
                	<td>${product.productCode}</td>
                    <td>${product.categoryCode}</td>
                    <td>${product.productName}</td>
                    <td>${product.productPrice}</td>
                    <td>${product.status}</td>
                    <td>
                        <c:if test="${ product.status.equals('Y')}">
	                    	<td>
	                    		<button id="delete" onclick="location.href='${ path }/admin/productDelete?no=${product.productCode}&state=N&product=${category}'">판매중지</button>
	                    	</td>
	                    </c:if>
	                    <c:if test="${ product.status.equals('N')}">
		                    <td>
		                    	<button id="delete" onclick="location.href='${ path }/admin/productDelete?no=${product.productCode}&state=Y&product=${category}'">판매시작</button>
		                    </td>
	                    </c:if>
                    </td>
                    <td>
                        <button id="delete" onclick="productDelete(${product.productCode}, '${ product.status }', '${category}');">품목삭제</button>
                    </td>
                </tr>		
                </c:forEach>	
   			 </tbody>
            </table>
        </div>
        <div id="content3">
        <!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/admin/product?page=1&product=${category}'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/admin/product?page=${ pageInfo.prevPage }&product=${category}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<!--  -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage }">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='${ path }/admin/product?page=${ status.current }&product=${category}'">${ status.current }</button>
						</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/admin/product?page=${ pageInfo.nextPage }&product=${category}'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/admin/product?page=${ pageInfo.maxPage }&product=${category}'">&gt;&gt;</button>
        </div>
        <div id="content4">
       		<button id="register" onclick="location.href='${ path }/admin/register'">상품 등록</button>
            <span>&nbsp;&nbsp;<button id="logout" onclick="location.href='${ path }'">관리자 로그아웃</button></span>
        </div>
            <p align="center" style="font-size: small;">Copyright © semi 3. All rights reserved.</p>
            <br>
        </div>     
    </div>
   <script>
    	function productDelete(no, state, category) {
    	
   			if(state == 'N'){
   				if(confirm("정말 삭제 하시겠습니까?")) {
   					location.href='${ path }/admin/productDelete?no=' + no + '&state=NULL&product=' + category
   				} 
   			} else {
   				alert("판매중인 상품은 삭제할 수 없습니다.");
   			}
    		
    	}
    </script>
</body>
</html>