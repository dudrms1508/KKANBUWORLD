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
<title>신고내역</title>
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

    #wraprightdiv {
/*         border: 1px solid red; */
        width: 300px;
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
        cursor: pointer;
    }

    #categoryul>li>button {
        color: darkgray;
        text-decoration: none;
    }

    /* hover 이벤트 */
    #categoryul>li>button:hover{
        color: rgb(243, 156, 18);
    }

    #periodtextdiv {
        height: 30px;
        
    }

    #listdiv {
        width: 650px;
    }

    table {
        width: 100%;
        border-spacing: 0px;
        border: 1px solid black;
        table-layout: fixed;
    }

    table tr {
        height: 27px;
    }

    table th {
        background-color: skyblue;
        color: white;
        padding: 0px;
        margin: 0;
    }

    table td {
        /* border: 1px solid black; */
        font-size: 15px;
        padding: 0px;
        text-align: center;
        border-top: 1px solid lightgray;
        text-overflow: ellipsis; 
        overflow: hidden; 
        white-space: nowrap;
    }
    
        
    #pagingdiv {
    	margin-top: 10px;
    	text-align: center;
    }
    
    #pagingdiv button {
    	background-color: transparent;
    	border: 0;
    	cursor: pointer;
    }
    
    #pagingdiv button:disabled {
	   	cursor: default;
    }
       
    #aTag {
    	color: darkblue;
    	text-decoration: none;
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

    #mPfeelingimg>span {
        height: 60%;
        color: rgb(243, 156, 18);
        /* width: 80%; */
        height: 100%;
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
<body>
    <div id="wrapdiv">
        <div id="wrapleftdiv">
            <div id="categorydiv">
                <ul id="categoryul">
                    <li id="qnacategory"><button onclick="location.href='${ path }/webpage/mypage/qnahistory'">문의내역</button></li>
                    <li id="reportcategory"><button style="border-bottom: 2px solid rgb(243, 156, 18); color: rgb(243, 156, 18); cursor: default;">신고내역</button></li>
                </ul>
            </div>
            <div id="periodtextdiv">
                <span><b>${ loginMember.name }님의 신고내역입니다.</b></span>
                <span style="color: rgb(243, 156, 18);"><b>(총 ${ listCount }건)</b></span>

            </div>
            <div id="listdiv">
                <table>
                    <tr>
                        <th style="width: 20%;">날짜</th>
                        <th style="width: 20%;">신고유형</th>
                        <th style="width: 30%;">신고내용</th>
                        <th style="width: 15%;">확인여부</th>
                        <th style="width: 15%;">비고</th>
                    </tr>
                    <c:if test="${ not empty list }">
	                    <c:forEach var="list" items="${ list }">
		                    <tr>    
		                        <td><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd" /></td>
		                        <td>${ list.categoryName }</td>
		                        <td><a href="${ path }/webpage/mypage/reportdetail?reportNo=${ list.no }" id="aTag"
		                        onclick="window.open(this.href, '신고내역 상세보기', 'width=350, height=340, top=200, left=500'); return false;">${ list.content }</a></td>
		                        <c:if test="${ list.status == 'N' }">
			                        <td>미처리</td>
		                        </c:if>
		                        <c:if test="${ list.status == 'Y' }">
		                        	<td>처리완료</td>
		                        </c:if>
		                        <td>-</td>
		                    </tr>
	                    </c:forEach>
                    </c:if>
                    <c:if test="${ empty list }">
                    <tr>
                    	<td colspan="5">조회된 내역이 없습니다.</td>
                    </tr>
                    </c:if>
                </table>
                <!-- 페이징 div -->
	            <div id="pagingdiv">
	            	<button onclick="location.href='${ path }/webpage/mypage/report?page=${ pageInfo.prevPage }'"><</button>
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status" >
							<c:choose>
								<c:when test="${ status.current == pageInfo.currentPage }">
					            	<button disabled>${ status.current }</button>
								</c:when>
								<c:otherwise>
					            	<button type="button" onclick="location.href='${ path }/webpage/mypage/report?page=${ status.current }'">${ status.current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>            
	           		<button onclick="location.href='${ path }/webpage/mypage/report?page=${ pageInfo.nextPage }'">></button>
	            </div>
            </div>


        </div>
        
        <!-- 프로필 div -->
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

    <!-- 전체 div 끝 -->
    </div>	
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>