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
<title>선물받기</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
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

    #giftcontentdiv {
        margin: 15px 15px;
        /* border: 1px solid red; */
    }

    .itemdiv {
        padding: 5px;
        background-color: lightgray;
        /* border: 1px solid red; */
        margin: 10px 0px;

    }
    
    table td {
        /* border: 1px solid black; */
        font-size: 14px;
    }

    .toptr>td {
        vertical-align: bottom;
    }
    
    #textspandiv {
        width: 100%;
        /* border: 1px solid blue; */
        margin-bottom: 20px;
    }

    #msgboxdiv {
        width: 100%;
        height: 80px;
        margin-bottom: 20px;
    }

    #msgboxdiv>textarea {
        width: 100%;
        height: 100%;
        resize: none;
        overflow-y: scroll;
        overflow-x: hidden;
        padding: 0;
        outline: none;
        border: 1px solid rgb(243, 156, 18);
        /* white-space: pre-line; */
    }

    #msgboxdiv>textarea::-webkit-scrollbar {
        width: 7px;
    }

    #msgboxdiv>textarea::-webkit-scrollbar-thumb {
        background-color: rgb(243, 156, 18);
        border-radius: 10px;
        height: 1px;
    }

    #msgboxdiv>textarea::-webkit-scrollbar-track {
        background-color: rgba(0,0,0,0);
    }


    #btmbtndiv {
        margin: 20px 0px;
        /* border: 1px solid black; */
    }

    #btmbtndiv>.btnClassdiv {
        /* border: 1px solid blue; */
        display: flex;
        justify-content: center;
    }

    .btnClassdiv>input {
        margin: 0 10px;
    }

    .btnstyle {
        border-radius: 4px;
        border: 0;
        height: 25px;
        box-shadow: 0 0 3px 3px rgb(243, 156, 18);
        background-color: white;
        color: rgb(243, 156, 18);
        font-weight: bold;
        cursor: pointer;
    }

</style>
</head>
<body>

    <div id="wrapdiv">
        <div id="gifthead">
            선물이 도착했습니다.
        </div>
        <form action="${ path }/gift/receive" method="post">
            <div id="giftcontentdiv">
                <div class="itemdiv">
                    <table>
                        <tr class="toptr">
                            <td rowspan="2"><img src="${path}/resources/image/shop/${ giftList.product.url }" width="200px" height="110px"></td>
                            <td><span><b>[${ giftList.product.categoryCode }]</b></span>&nbsp;<span><b>${ giftList.product.name }</b></span></td>
                        </tr>
                        <tr>
                            <td style="font-size: 10px; vertical-align: top; color: brown; padding-top: 5px;">선물을 거절하실 경우 상대방에게 도토리가 환불됩니다.</td>
                        </tr>
                    </table>
                </div>
                <div id="textspandiv">
                    <span style="color: rgb(243, 156, 18);"><strong>·</strong></span>&nbsp;<span><b>선물 메시지</b></span>
                </div>
                <div>
                    <div id="msgboxdiv">
                        <textarea id="content" readonly>${ giftList.content }</textarea>
                    </div>
                </div>
                <div id="btmbtndiv">
                    <div class="btnClassdiv">
	                    <input type="hidden" name="giftNo" value="${ giftList.giftNo }">
	                    <input type="hidden" name="productCode" value="${ giftList.product.code }">
                        <input type="button" value="목록으로" id="historyback" class="btnstyle"  onclick="history.back(-1)">
                        <input type="submit" value="선물받기" id="giftbtn" class="btnstyle">
                        <input type="button" value="거절하기" id="cancelbtn" class="btnstyle" onclick="location.href='${ path }/gift/reject?giftNo=${ giftList.giftNo }&no=${ giftList.sender.no }&price=${ giftList.product.price }'">
                    </div>
                </div>
            <!-- giftcontentdiv 끝 -->
            </div>
        </form>
    </div>

<script>
$(document).ready(() => {
    // enter로 submit 안되게 전체 다 적용되어 주석으로 막음
    $(document).keypress(function(e) { 
        if (e.keyCode == 13) e.preventDefault(); 
    });
    
    // let contents = document.getElementById('content');
    // content = content.value.replace("\r\n", '<br>');


})

</script>
</body>
</html>