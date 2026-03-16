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
<title>장바구니</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${ path }/resources/css/header.css">
<link rel="stylesheet" href="${ path }/resources/css/footer.css">
<style>
    #wrapdiv {
        width: 1100px;
        margin: 0 auto;
        /* border: 1px solid blue; */
        height: 100%;
        padding: 0px 50px;
    }

    #wrapdiv>div{
        float: left;
    }

    #wholediv{
        width: 650px;
        border: 1px solid ;
        /* margin: auto; */
    }    
    
    #cartdiv{
        border: 1px solid lightgray;
        padding: 10px;
        /* width: 630px; */
        /* margin: auto; */
    }
    
    #twodiv {
        width: 100%;
        /* border: 1px solid lightblue; */
        height: 50px;
    }
    
    #twodiv>#cartleftdiv, #cartrightdiv {
        display: inline-block;
        /* border: 1px solid red; */
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    #cartleftdiv span {
        font-size: 20px;
        font-weight: bold;
    }

    #cartrightdiv {
        float: right;
        border: 0px;
        margin: 0px;
        padding: 0px;
    }
    
    #delbutton {
        background-color: rgb(243, 156, 18);
        border: 0px;
        border-radius: 5px;
        height: 28px;
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 14px;
        margin: 0px;
        padding: 3px 5px;
    }

    #innerdiv{
/*         margin: 0px 5px; */
    }

    .itemdiv {
        display: inline-block;
        /* border: 1px solid blueviolet; */
        width: 130px;
        height: auto;
        padding: 10px;
        margin: 5px 0px;
    }    

    .itemdiv>div {
        float: left;
    }

    .checkboxdiv{
        /* border: 1px solid lightseagreen; */
        margin: 0px 3px;
    }

    .cartimg{
        height: 80px;
        width: 80px;
    }


    .detaildiv>p{
        display: flex;
        justify-content: center;
        margin: 3px;
    }

    .pricePtag{
        color: rgb(243, 156, 18);
    }
    
    .acornimg{
        height: 20px;
        width: 15px;
        margin-right: 3px;
    }

    #paymentdiv{
        /* border: 1px solid salmon; */
        width: 100%;
        margin-top: 10px;
    }

    #paymentinput {
        background-color: rgb(243, 156, 18);
        border: 0px;
        border-radius: 5px;
        height: 28px;
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 14px;
        margin: 0px;
        padding: 3px 5px;  
    }

    .bottomdiv {
        /* border: 1px solid deeppink; */
        height: 30px;
    }
    
    .bottomdiv>div{
        /* border: 1px solid blue; */
        box-sizing: border-box;
        float: left;
    }

    .bottomdiv>.paymentleftdiv{
        display: flex;
        justify-content: end;
        align-items: center;
        width: 90%;
        height: 100%;
        text-align: end;
        padding-right: 10px;
    }

    .bottomdiv>.paymentrightdiv {
        display: flex;
        align-items: center;
        width: 10%;
        height: 100%;
        color: rgb(243, 156, 18);
    }

    /* enddiv 필요 없어짐 */
    .bottomdiv>.enddiv {
        /* border: 1px solid; */
        /* width: 5%; */
        height: 100%;
    }

    .paymentrightdiv>p {
        /* display: flex 하니까 도토리이미지랑 가격이랑 정렬됨 */
        display: flex;
        margin: 3px;
        /* padding: 0px; */
    }

    .hrbottomdiv {
        /* border: 1px solid deeppink; */
        height: 10px;
    }
    
    .hrbottomdiv>div{
        /* border: 1px solid blue; */
        box-sizing: border-box;
        float: left;
    }

    .hrbottomdiv>.hrleftdiv{
        width: 60%;
        height: 100%;
        text-align: end;
        padding-right: 10px;
    }

    .hrbottomdiv>.hrrightdiv{
        width: 40%;
        height: 100%;
        margin: 0px;
        padding: 0px;
        text-align: end;
        padding-right: 10px;
    }

    .hrrightdiv>#paymenthr {
        /* border: 1px solid red; */
        margin: 4px 0px 0px 0px;
        padding: 0px;
    }

    .bottombuttondiv {
        /* border: 1px solid deeppink; */
        height: 65px;
    }
    
    .bottombuttondiv>div{
        /* border: 1px solid blue; */
        box-sizing: border-box;
        float: left;
    }

    .bottombuttondiv>.paymentbuttonleftdiv{
        display: flex;
        justify-content: end;
        align-items: center;
        width: 89%;
        height: 100%;
        text-align: end;
        /* padding-right: 10px; */
    }

    .bottombuttondiv>.paymentbuttonrightdiv {
        display: flex;
        align-items: center;
        width: 11%;
        height: 100%;
        color: rgb(243, 156, 18);
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

    #mPtodayfeeling {
        /* font-size: 16px; */
    }

    #mPrecbttm2 {
        width: 30%;
    }

    #mPrecbttm2>div{
        display: flex;
        align-items: center;
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
    <div id="formdiv">
    <form action="${ path }/webpage/mypage/cart/buy" method="post">
        <div id="wholediv">
        <div id="cartdiv">
            <div id="twodiv">
                <div id="cartleftdiv"><span style="color: rgb(243, 156, 18);">·</span> 장바구니</div>
                <div id="cartrightdiv"><button type="button" id="delbutton">선택삭제</button></div>
            </div>
            <div id="innerdiv">
            <c:if test="${ not empty cart }">
<!--             c:forEach 시작 -->
			<c:forEach var="product" items="${ cart.product }" >

                <div class="itemdiv">
                    <div class="checkboxdiv">
                        <input type="checkbox" class="chk" name="${ product.code }" id="${ product.code }" value="${ product.code }">
                        <input type="hidden" name="productCode" value="${ product.code }" >
<%--                         <input type="text" name="" value="${ list.product.categoryCode }" id="tem" > --%>
<%--                         <input type="text" name="" value="${ list.product.name }" id="tem" > --%>
<%--                         <input type="text" name="" value="${ list.product.price }" id="tem" > --%>
                    </div>
                    <div class="imgdiv">
                        <label for="${ product.code }">
                            <img class="cartimg" src="${path}/resources/image/shop/${product.url}">                    
                        </label>
                        <div class="detaildiv">
                            <p><b>${ product.categoryCode }</b></p>
                            <p>${ product.name }</p>
                            <p class="pricePtag"><img class="acornimg" src="${ path }/resources/image/mypage/acornone.png"><b>${ product.price }</b></p>
                        </div>
                    </div>
                <!-- itemdiv 끝 -->
                </div>
                
            <!-- c:forEach 끝 -->
			</c:forEach>
			</c:if>
			<c:if test="${ empty cart }">
				<div style="text-align: center; margin: 40px 0">
                    	조회된 내역이 없습니다.
				</div>
			</c:if>
            <!-- innerdiv 끝 -->
            </div>
        <!-- cartdiv 끝 -->
        </div>

        <div id="paymentdiv">
            <div class="bottomdiv">
                <div class="paymentleftdiv">장바구니 총 합계</div>
                <div class="paymentrightdiv"><p><img src="${ path }/resources/image/mypage/acornone.png" class="acornimg"><b><span id="allCartAcorn"></span></b></p></div>
                <input type="hidden" name="allCartPrice" id="allCartPrice" value="">
            </div>
            <div class="bottomdiv">
                <div class="paymentleftdiv">나의 도토리</div>
                <div class="paymentrightdiv"><p><img src="${ path }/resources/image/mypage/acornone.png" class="acornimg"><b><span id="myAcorn">${ loginMember.acorn }</span></b></p></div>
            </div>
            <div class="hrbottomdiv">
                <div class="hrleftdiv"></div>
                <div class="hrrightdiv"><hr id="paymenthr"></div>
            </div>
            <div class="bottomdiv">
                <div class="paymentleftdiv">구매 후 나의 예상 도토리</div>
                <div class="paymentrightdiv"><p><img src="${ path }/resources/image/mypage/acornone.png" class="acornimg"><b><span id="afterAcorn"></span></b></p></div>
            </div>

            <div class="bottombuttondiv">
                <div class="paymentbuttonleftdiv"></div>
                <div class="paymentbuttonrightdiv" id="paymentbutton"><input type="submit" value="결제하기" id="paymentinput"></div>
            </div>
        </div>

    <!-- form 안에 wholediv 끝 -->
    </div>
    </form>

    <!-- formdiv 끝 -->
    </div>

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
    </div>

<!-- wrapdiv 끝 -->
</div>


<script>
$(document).ready(() => {
    // 배열 선언
    
    $('#delbutton').on('click', (e) => {
        
    	if(confirm('정말 삭제하시겠습니까?')) {
    		
    	
		
//         location.href = '${path}/mypage/cart/delete';
        var tems = [];
        
        // CheckBox 검사
        if ($('input:checkbox[class="chk"]').is(":checked")){
            
            // tems.push(this.id); //Check된 Check박스의 "Id"태그 얻기.
            $('input:checked[class=chk]').each(function() {
                // val()값 얻기
                tems.push($(this).val());
                console.log($(this).val());
            
            });
            console.log(tems)
        };
    
        console.log(tems);
    
        var objItems = {
            "items" : tems
        };

            $.ajax({
				type: 'get',
                url: '${ path }/webpage/mypage/cart/delete',
				data: objItems,
				success: function(data) {
					document.location.reload();
// 					document.location.href = document.location.href;
					console.log(data);
					console.log('data는 ' + data)
// 					location.href = '${ path }/mypage/cart/delete';
				},
				error: function(error) {
					console.log(error);
					console.log('에러남');
				}

				
			// ajax 끝
            });

	// if 구문		
    	}

            
    })

    
	let result = 0;
	let afterAcorn = 0;    
    let nowAcorn = ${ loginMember.acorn };

    <c:forEach var="product" items="${ cart.product }">
    	result += ${ product.price }
    </c:forEach> 
	
    afterAcorn = nowAcorn - result;
	    
	$('#allCartAcorn').html(result);
	$('#allCartPrice').val(result)
	
 	if(afterAcorn < 0) {
		$('#afterAcorn').html('0')
 	} else {
		$('#afterAcorn').html(afterAcorn)
 	}

	
	
})
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>