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
<title>받은선물</title>
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
        /* border: 1px solid blue; */
        float: left;
    }

    #wrapleftdiv {
        width: 650px;
        /* border: 1px solid red; */
    }

    #categorydiv {
        height: 30px;
        border-bottom: 1px solid lightgray;
        /* margin-bottom: 30px; */
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
    

    #perioddiv {
        /* border-top: 1px solid lightgray; */
        height: 150px;
        position: relative;
        z-index: 0;
        border-collapse: separate;
    }

    #perioddiv>#periodinner {
        border: 1px solid lightgray;
        height: 51%;
        position: absolute;
        top: 50%;
        width: 100%;
        transform: translate(0, -50%);
        /* display: flex; */
        /* align-items: center; */
        
    }

    #periodinner>div {
        /* border: 1px solid red; */
        box-sizing: border-box;
    }

    #selectperiod {
        width: 100%;
        height: 50%;
    }

    #selectperiod>div {
        float: left;
        box-sizing: border-box;
    }

    #periodinner>div>.leftperiod {
        width: 15%;
        font-size: 14px;
        height: 100%;
        display: flex;
        justify-content: end;
        align-items: center;
        color: gray;
        font-weight: bold;
    }
    
    #monthbtndiv>button {
        height: 25px;
        margin: 0px 2px;
        background-color: whitesmoke;
        border: 1px solid lightgray;
        border-radius: 4px;
    }

    #periodinner>div>.middleperiod {
        width: 70%;
        height: 100%;
        display: flex;
        align-items: center;
        padding-left: 10px;
    }

    #periodinner>div>.rightperiod {
        width: 15%;
    }

    #insertperiod {
        height: 50%;
        width: 100%;
    }

    #insertperiod>div {
        float: left;
        box-sizing: border-box;
    }

    .middleperiod>div {
        float: left;
    }

    #viewbtndiv>button {
        height: 23px;
        width: 43px;
        background-color: rgb(051, 051, 051);
        border-radius: 4px;
        border: 0px;
        /* border: 1px solid lightgray; */
        color: white;
        cursor: pointer;
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
    }
    
    #pagingdiv {
    	margin-top: 10px;
    	text-align: center;
    }
    
    #pagingdiv button {
    	background-color: transparent;
    	border: 0;
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
    <div id="wrapdiv">
        <div id="wrapleftdiv">
            <div id="categorydiv">
                <ul id="categoryul">
                    <li id="paymentHistory"><button onclick="location.href='${ path }/webpage/mypage/payhistory'">구매/결제내역</button></li>
                    <li id="sendGift"><button onclick="location.href='${ path }/webpage/mypage/sendgifthistory'">보낸선물</button></li>
                    <li id="receiveGift"><button style="border-bottom: 2px solid rgb(243, 156, 18); color: rgb(243, 156, 18); cursor: default;">받은선물</button></li>
                </ul>
            </div>
            <div id="perioddiv">
                <div id="periodinner">
                    <div id="selectperiod">
                        <div class="leftperiod">조회기간</div>
                        <div class="middleperiod" id="monthbtndiv">
                            <button id="chkbtn1">1개월</button>
                            <button id="chkbtn2">2개월</button>
                            <button id="chkbtn3">3개월</button>
                            <button id="chkbtn4">4개월</button>
                            <button id="chkbtn5">5개월</button>
                            <button id="chkbtn6">6개월</button>
                        </div>
                        <div class="rightperiod"></div>
                    </div>
                    <div id="insertperiod">
                        <div class="leftperiod">&nbsp;</div>
                        <div class="middleperiod">
                            <div>	
                                <input type="date" id="date1">
                            </div>
                            <div>
                                <span>&nbsp;~&nbsp;</span>
                            </div>
                            <div>
                                <input type="date" id="date2">
                            </div>
                            &nbsp;&nbsp;
                            <div id="viewbtndiv">
                                <button id="viewbtn">조회</button>
                            </div>
                        </div>
                        <div class="rightperiod"></div>
                    </div>

                </div>
            </div>
            <div id="historydiv">
            <div id="periodtextdiv">
                <span id="dateSpan"><b>최근 ${ loginMember.name }님의 받은 선물내역입니다.</b></span>
                <span id="countSpan" style="color: rgb(243, 156, 18);"><b>(총 ${ listCount } 건)</b></span>
<%--                 <span id="countSpan" style="color: rgb(243, 156, 18);"><b>(총 ${fn:length(list)} 건)</b></span> --%>
            </div>
            <div id="listdiv">
                <table>
                    <tr>
                        <th style="width: 20%;">날짜</th>
                        <th style="width: 40%;">상품명</th>
                        <th style="width: 20%;">보내신분</th>
                        <th style="width: 20%;">상태</th>
                    </tr>
                    <c:if test="${ not empty list }">
                    <c:forEach var="list" items="${ list }">
	                    <tr>    
	                        <td><fmt:formatDate value="${ list.sendDate }" pattern="yyyy-MM-dd" /></td>
	                        <td>${ list.product.name }</td>
	                        <td>${ list.sender.name }</td>
	                        <c:if test="${ list.progress == 'H' }">
		                        <td>대기중</td>
	                        </c:if>
	                        <c:if test="${ list.progress == 'Y' }">
		                        <td>수락완료</td>
	                        </c:if>
	                        <c:if test="${ list.progress == 'N' }">
		                        <td>선물거절</td>
	                        </c:if>
	                    </tr>
                    </c:forEach>
                    </c:if>
                    <c:if test="${ empty list }">
                    	<tr>
                    		<td colspan="4">조회된 내역이 없습니다.</td>
                    	</tr>
                    </c:if>
                </table>
            </div>
            <div id="pagingdiv">
            	<button onclick="paging('${ pageInfo.prevPage }')"><</button>
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status" >
						<c:choose>
							<c:when test="${ status.current == pageInfo.currentPage }">
				            	<button disabled>${ status.current }</button>
							</c:when>
							<c:otherwise>
				            	<button type="button" onclick="paging('${ status.current }');">${ status.current }</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>            
           		<button onclick="paging('${ pageInfo.nextPage }')">></button>
            </div>
			</div>
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

    // 날짜 형식으로 바꿔주는 함수(yyyy-mm-dd)
    let today = new Date();
    let newDay = new Date(today);

    dateFormatter = function(newDay, today) {
        let year = newDay.getFullYear();
        let month = newDay.getMonth() + 1;
        let date = newDay.getDate();

        if(today){
            let todayDate = today.getDate();

            if(date != todayDate) {
                if(month == 0) {
                    year -= 1;
                    month = (month + 11) % 12;
                    date = new Date(year, month, 0).getDate();
                } 
            }
        }

        month = ('0' + month).slice(-2);
        date = ('0' + date).slice(-2);

        return year + '-' + month + '-' + date;

    }

    // let testbtn = document.getElementById('testbtn');

    let chkbtn1 = document.getElementById('chkbtn1');
    let chkbtn2 = document.getElementById('chkbtn2');
    let chkbtn3 = document.getElementById('chkbtn3');
    let chkbtn4 = document.getElementById('chkbtn4');
    let chkbtn5 = document.getElementById('chkbtn5');
    let chkbtn6 = document.getElementById('chkbtn6');

    chkbtn1.addEventListener('click', () => {
        let endDate = new Date();
        let newDate = new Date();

        newDate.setMonth(newDate.getMonth() - 1) // 1개월 전
        newDate = dateFormatter(newDate, endDate);

        document.getElementById('date1').value = newDate;
        document.getElementById('date2').value = dateFormatter(today, today);


    });

    chkbtn2.addEventListener('click', () => {
        let endDate = new Date();
        let newDate = new Date();

        newDate.setMonth(newDate.getMonth() - 2) // 2개월 전
        newDate = dateFormatter(newDate, endDate);
        // console.log(newDate);

        document.getElementById('date1').value = newDate;
        document.getElementById('date2').value = dateFormatter(today, today);
    });

    chkbtn3.addEventListener('click', () => {
        let endDate = new Date();
        let newDate = new Date();

        newDate.setMonth(newDate.getMonth() - 3)
        newDate = dateFormatter(newDate, endDate);
        // console.log(newDate);

        document.getElementById('date1').value = newDate;
        document.getElementById('date2').value = dateFormatter(today, today);

    });

    chkbtn4.addEventListener('click', () => {
        let endDate = new Date();
        let newDate = new Date();

        newDate.setMonth(newDate.getMonth() - 4)
        newDate = dateFormatter(newDate, endDate);
        // console.log(newDate);

        document.getElementById('date1').value = newDate;
        document.getElementById('date2').value = dateFormatter(today, today);

    });

    chkbtn5.addEventListener('click', () => {
        let endDate = new Date();
        let newDate = new Date();

        newDate.setMonth(newDate.getMonth() - 5)
        newDate = dateFormatter(newDate, endDate);
        // console.log(newDate);

        document.getElementById('date1').value = newDate;
        document.getElementById('date2').value = dateFormatter(today, today);

    });

    chkbtn6.addEventListener('click', () => {
        let endDate = new Date();
        let newDate = new Date();

        newDate.setMonth(newDate.getMonth() - 6)
        newDate = dateFormatter(newDate, endDate);
        // console.log(newDate);

        document.getElementById('date1').value = newDate;
        document.getElementById('date2').value = dateFormatter(today, today);

    });
    
    
    // 조회버튼 클릭 이벤트
    let viewbtn = document.getElementById('viewbtn');
    
    viewbtn.addEventListener('click', (event) => {
        let date1 = document.getElementById('date1').value;
        let date2 = document.getElementById('date2').value;
        
        if(date1 == '' || date2 == '') {
        	alert('조회 기간을 선택해 주세요.')
        	event.preventDefault();
        	// 기간이 제대로 되어있으면
        } else {
        	
        
	        $.ajax({
	            type: 'post',
	            url: '${ path }/webpage/mypage/receivegifthistory/seldate',
	            dataType: 'text',
	            data: {
	                date1,
	                date2
	            }
	
	        // ajax 끝
	        }).done(function(result) {
	
	        	let html = jQuery('<div>').html(result).find('div#historydiv').html();
	        	
	        	$('#historydiv').html(html);
	        })
        }
    });
    
// window.onload 끝
}    
    
    
    function paging(str) {
    	let page = str;
    	console.log('클릭된 페이지 : ' + page)
    	
    	let date1 = document.getElementById('date1').value;
        let date2 = document.getElementById('date2').value;
    	
        console.log(date1)
        console.log(date2)
        
    	if(date1 == '' && date2 == '') {
	    	// 날짜가 아예 없으면 전체기간의 리스트 조회
    		$.ajax({
    			type: 'post',
    			url : '${ path }/webpage/mypage/receivegifthistory/list',
    			dataType: 'text',
    			data: {
    				page,
    				date1,
    				date2
    			},
    			success: function(result) {
    				let html = jQuery('<div>').html(result).find('div#historydiv').html();
    				$('#historydiv').html(html);
    			}
    		});
    		
    		// 날짜가 선택돼있으면 그 날짜에 대한 페이징 + 날짜 input값(val() = '..' 등) 그 기간으로 써있도록하기(ajax 성공시)
    	} else {
    		
    		$.ajax({
    			type: 'post',
    			url : '${ path }/webpage/mypage/receivegifthistory/list',
    			dataType: 'text',
    			data: {
    				page,
    				date1,
    				date2
    			},
    			success: function(result) {
    				let html = jQuery('<div>').html(result).find('div#historydiv').html();
    				$('#historydiv').html(html);
    			}
    		});
    		
    		
    	}
    	
    	
    }



</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>