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
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
    #wrapdiv {
        width: 400px;
        height: 100%;
        border: 1px solid lightgray;
        margin: 0 auto;
    }

    #gifthead{            
        padding: 2px;
        background-color: rgb(243, 156, 18);
        color: white;
        display: flex;
        justify-content: center;
    }

    #gifthead>div {
        float: right;
    }

    form {
        width: 100%;
        height: 100%;
        padding: 0px 10px;
        margin-top: 10px;
        box-sizing: border-box;
    }

    #giftcontentdiv {
        height: 140px;
        padding: 10px 5px;
        box-sizing: border-box;
        /* width: 100%; */
        /* border: 1px solid red; */
    }

    #giftcontentdiv>div {
        float: left;
        box-sizing: border-box;
    }

    #giftcontentdiv>.itemdiv {
        /* border: 1px solid blue; */
        /* background-color: lightgray; */
        height: 100%;
        /* margin: 10px 0px; */
        width: 80%;
    }
    
    #giftcontentdiv>.giftbtndiv {
        width: 20%;
        height: 100%;
        /* margin: 10px 0px; */
        display: flex;
        justify-content: center;
        align-items: center;
        /* border: 1px solid red; */
    }

    table td {
        /* border: 1px solid black; */
        font-size: 14px;
    }

    .toptr>td {
        vertical-align: bottom;
    }

    #btmbtndiv {
        margin: 10px 0px;
        /* border: 1px solid black; */
        text-align: center;
    }

    .btnstyle {
        border-radius: 4px;
        border: 0;
        margin-left: 5px;
        font-size: 12px;
        box-shadow: 0 0 3px 3px rgb(243, 156, 18);
        background-color: white;
        color: rgb(243, 156, 18);
        font-weight: bold;
        cursor: pointer;
    }

    #closebtn {
        background-color: rgb(243, 156, 18);
        color: white;
        border-radius: 4px;
        border: 0;
        vertical-align: middle;
        cursor: pointer;
        font-size: 12px;
        padding: 3px 5px;
    }
    
    #pagingdiv {
        height: 20px;
        margin-bottom: 8px;
    }

    #pagingdiv>div {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #pagingUl {
        list-style-type: none;
        padding: 0;
        margin: 0;
        height: 11px;
    }

    #pagingUl>li {
        float: left;
        height: 100%;
        padding: 2px;
    }

    .pagingbtn {
        display: block;
        border-radius: 50%;
        height: 100%;
        width: 11px;
        border: 1px solid lightgray;
        color: lightgray;
        background-color: transparent;
        cursor: pointer;
        padding: 0;
        margin: 0;
    }
    
    .pagingbtn:disabled {
        border: 1px solid rgb(243, 156, 18);
        color: rgb(243, 156, 18);
        background-color: snow;
        cursor: default;
    }

    .prevbtn {
        background-color: transparent;
        border: 1px solid rgb(243, 156, 18);
        height: 100%;
        width: 9px;
        display: block;
        font-size: 12px;
        color: rgb(243, 156, 18);
        cursor: pointer;
        padding: 0;
        border-bottom: 6px solid transparent;
        border-top: 6px solid transparent;
        border-left: 8px solid transparent;
        border-right: 8px solid rgb(243, 156, 18);

    }

    .nextbtn {
        background-color: transparent;
        border: 1px solid rgb(243, 156, 18);
        height: 100%;
        width: 9px;
        display: block;
        font-size: 12px;
        color: rgb(243, 156, 18);
        cursor: pointer;
        padding: 0;
        border-bottom: 6px solid transparent;
        border-top: 6px solid transparent;
        border-left: 8px solid rgb(243, 156, 18);
        border-right: 8px solid transparent;
    }

</style>
</head>
<body>
    <div id="wrapdiv">
        <div id="gifthead">
            ${ loginMember.name }님께 선물이 도착했습니다.
        </div>
        <div id="formdiv">
        <form action="${ path }/gift/receive" method="get">
        	<c:if test="${ not empty giftList }">
        	<c:forEach var="list" items="${ giftList }">
	            <div id="giftcontentdiv">
	                <div class="itemdiv">
	                    <table>
	                        <tr class="toptr">
	                            <td rowspan="2"><img src="${path}/resources/image/shop/${list.product.url}" width="130px" height="110px"></td>
	                            <td><span><b>[보내신분]</b></span>&nbsp;<span><b>${ list.sender.name }</b>
	                            </span></td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 10px; vertical-align: top; color: brown; padding-top: 5px;">선물을 거절하실 경우 <br>상대방에게 도토리가 환불됩니다.</td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="giftbtndiv">
	                    <button type="submit" name="inputGiftNo" value="${ list.giftNo }" class="btnstyle">선물내용 확인하기</button>
	                </div>
	            <!-- giftcontentdiv 끝 -->
	            </div>
	            <hr style="border: 0; height: 1px; background-color: lightgray;">
        	</c:forEach>
            </c:if>
        </form>
        </div>
        <div id="pagingdiv">
             <div>    
                <ul id="pagingUl">
                    <li><button onclick="location.href='${ path }/gift/giftList?page=${ pageInfo.prevPage }'" class="prevbtn"></button></li>
                	<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
	                	<c:choose>
	                		<c:when test="${ status.current == pageInfo.currentPage}">
<%-- 			                    <li><input class="pagingbtn" type="button" value="${ status.current }" disabled></li> --%>
			                    <li><button class="pagingbtn" type="button" value="${ status.current }" disabled></button></li>
	                		</c:when>
							<c:otherwise>
<%-- 			                    <li><input onclick="location.href='${ path }/gift/giftList?page=${ status.current }'" class="pagingbtn" type="button" value="${ status.current }"></li> --%>
			                    <li><button onclick="location.href='${ path }/gift/giftList?page=${ status.current }'" class="pagingbtn" type="button" value="${ status.current }" class="pagingbtn"></button></li>
							</c:otherwise>	                		
	                	</c:choose>
                	</c:forEach>
                    <li><button onclick="location.href='${ path }/gift/giftList?page=${ pageInfo.nextPage }'" class="nextbtn"></button></li>
                </ul>
            </div>
        </div>
        <div id="btmbtndiv">
            <button id="closebtn" type="button" onclick="window.close()">취소</button>
        </div>
	</div>
</body>
</html>