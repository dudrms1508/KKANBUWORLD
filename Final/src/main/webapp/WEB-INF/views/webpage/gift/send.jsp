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
<title>선물하기</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
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
    
    #relatedlist {
        width: 100%;
        /* border: 1px solid blue; */
        margin-bottom: 20px;
    }

    .detailListdiv {
        width: 140px;
        height: 100px;
    }

    #selrelateddiv {
        /* border: 1px solid blueviolet; */
        height: 80px;
        margin: 5px 0 0 0;
        box-sizing: border-box;
    }

    #selrelateddiv>div {
        float: left;
        box-sizing: border-box;
    }


    .detailListdiv {
        width: 43%;
        height: 100%;
        /* border: 1px solid red; */
    }

    .detailListdiv>select {
        width: 100%;
        height: 100%;
    }

    .selbtndiv {
        width: 14%;
        /* height: 100%; */
        position: relative;
        top: 50%;
        transform: translate(0, -50%);
        /* border: 1px solid red; */
    }

    .selbtndiv button {
        font-size: 8px;
        background-color: white;
        border: 1px solid lightgray;
        display: block;
        margin: auto;
    }

    .selbtndiv>div>button>span {
        font-size: 6px;
        display: block;
    }

    #searchrelateddiv {
        /* border: 1px solid blueviolet; */
        box-sizing: border-box;
        height: 20px;
    }

    #searchrelateddiv>div {
        float: left;
        height: 100%;
        /* border: 1px solid red; */
        box-sizing: border-box;
        
    }

    .searchclickdiv {
        width: 43%;
        height: 100%;
    }
    
    .searchclickdiv>a {
        vertical-align: top;
        color: dimgray;
        font-weight: bold;
        font-size: 12px;
        text-decoration: none;
    }

    .gapdiv {
        width: 14%;
    }

    #msgboxdiv {
        width: 100%;
        height: 50px;
        margin-bottom: 20px;
    }

    #msgboxdiv>textarea {
        width: 100%;
        height: 100%;
        resize: none;
        overflow-y: scroll;
        overflow-x: hidden;
        padding: 0;
    }

    #paydetaildiv {
        /* border: 1px solid red; */
        width: 100%;
        height: 40px;
    }

    #paydetaildiv>div{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        border: 1px solid lightgray ;
        border-radius: 4px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 13px;
        background-color: rgb(243, 156, 18);
        color: white;
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
            선물하기
            <div id="headright"><a href="#" style="color:white;">공지사항</a> | <a href="#" style="color:white;">고객센터</a></div>
        </div>
        <form action="${ path }/gift/send/done" method="post">
            <div id="giftcontentdiv">
                <div class="itemdiv">
                    <input type="hidden" name="productCode" value="${ product.code }" >
                    <table>
                        <tr class="toptr">
                            <td rowspan="2"><img src="${path}/resources/image/shop/${product.url}" width="200px" height="110px"></td>
                            <td><span><b>[${ product.categoryCode }]</b></span>&nbsp;<span><b>${ product.name }</b></span></td>
                        </tr>
                        <tr>
                            <!-- <td></td> -->
                            <td style="font-size: 10px; vertical-align: top; color: brown; padding-top: 5px;">상대방이 해당 상품을 보유하고 있는 경우 선물이 불가능합니다.</td>
                        </tr>
                    </table>
                </div>
                <div id="relatedlist">
                    <span style="color: rgb(243, 156, 18);"><strong>·</strong></span>&nbsp;<span><b>선물받는 사람</b></span>
                    <div id="selrelateddiv">
                        <div class="detailListdiv">
                            <select name="selectList" id="selectList" size="4">
                                <option value="" disabled>------------ 일촌 ------------</option>
								<c:if test="${ not empty list }">
									<c:forEach var="list" items="${ list }">
										<option value="${ list.ilchonMember.no }">${ list.ilchonMember.name }(${ list.ilchonNick })</option>
									</c:forEach>
								</c:if>
                            </select>
                        </div>
                        <div class="selbtndiv">
                            <div style="margin-bottom: 8px;">
                                <button type="button" id="addbtn"><span>추가<span style="color: rgb(243, 156, 18);">▶</span></span></button>
                            </div>
                            <div>
                                <button type="button" id="delbtn"><span><span style="color: rgb(243, 156, 18);">◀</span>삭제</span></button>
                            </div>
                        </div>
                        <div class="detailListdiv">
                            <select name="sendList" id="sendList" size="4">
                                <option value="" disabled>--------- 받는사람 ---------</option>
                            </select>
                        </div>
                    </div>
                    <div id="searchrelateddiv">
                        <div class="searchclickdiv">
                            <a href="">[일촌검색]</a>
                        </div>
                        <div class="gapdiv">&nbsp;</div>
                        <div class="searchclickdiv">
                            <a href="">[일촌 외 회원 추가]</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="msgboxdiv">
                        <textarea id="content" name="content" placeholder="메세지를 작성해주세요."></textarea>
                    </div>
                </div>
                <div id="paydetaildiv">
                    <div><strong>총 결제 가격 : 도토리 ${ product.price }개</strong></div>
                </div>
                <div id="btmbtndiv">
                    <div class="btnClassdiv">
                        <input type="submit" value="선물하기" id="giftbtn" class="btnstyle">
                        <input type="button" value="취소" id="cancelbtn" class="btnstyle">
                    </div>
                </div>
            <!-- giftcontentdiv 끝 -->
            </div>
        </form>
    </div>

<script>
$(document).ready(() => {
    // enter로 submit 안되게 전체 다 적용되어 주석으로 막음
    // $(document).keypress(function(e) { 
    //     if (e.keyCode == 13) e.preventDefault(); 
    // });

    // select enter 막기
    $('select').keydown(function() {
        if (event.keyCode === 13) {
            event.preventDefault();
        }
    });
    

    $('#addbtn').on('click', (event) => {
        if($('#sendList option').length > 1) {
            // console.log($('#sendList option').length);
            alert('선물하기는 한 명에게만 할 수 있습니다.')
            event.preventDefault;
        } else {
            $('#sendList').append($('#selectList > option:selected'));
            return true;
        }
    })

    $('#delbtn').on('click', () => {
        $('#selectList').append($('#sendList > option:selected'));
    })

    
    $('#selectList').on('dblclick', () => {

        console.log($('#selectList option:selected').val());
        
        if($('#sendList option').length > 1) {
            // console.log($('#sendList option').length);
            alert('선물하기는 한 명에게만 할 수 있습니다.')
            event.preventDefault;
        } else {
            $('#sendList').append($('#selectList > option:selected'));
            return true;
        }

    })

    $('#sendList').on('dblclick', () => {
        console.log($('#sendList option:selected').val());

        $('#selectList').append($('#sendList > option:selected'));

    });
    
    
    
    
    
})

</script>
</body>
</html>