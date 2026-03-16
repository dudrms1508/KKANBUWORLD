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
<title>보낸선물</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
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

</style>
</head>
<body>

            <div id="historydiv">
	            <div id="periodtextdiv">
                     <c:set var="date1" value="${ date1 }" />
	                 <c:set var="date2" value="${ date2 }" />
	                 
	                 <c:set var="year1" value="${ fn:substring(date1, 0, 4) }" />
	                 <c:set var="month1" value="${ fn:substring(date1, 5, 7) }" />
	                 <c:set var="day1" value="${ fn:substring(date1, 8, 10) }" />
	                 
	                 <c:set var="year2" value="${ fn:substring(date2, 0, 4) }" />
	                 <c:set var="month2" value="${ fn:substring(date2, 5, 7) }" />
	                 <c:set var="day2" value="${ fn:substring(date2, 8, 10) }" />
	                 <c:if test="${ not empty date1 || not empty date2 }">
		                <span id="dateSpan"><b>${ year1 }년${ month1 }월${ day1 }일 ~ ${ year2 }년${ month2 }월${ day2 }일까지의 주문내역입니다.</b></span>
	                 </c:if>
	                 <c:if test="${ empty date1 && empty date2 }">
		                <span id="dateSpan"><b>최근 ${ loginMember.name }님의 받은 선물내역입니다.</b></span>
	                 </c:if>                 
	                <span id="countSpan" style="color: rgb(243, 156, 18);"><b>(총 ${ listCount } 건)</b></span>
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
<script>

</script>
</body>
</html>