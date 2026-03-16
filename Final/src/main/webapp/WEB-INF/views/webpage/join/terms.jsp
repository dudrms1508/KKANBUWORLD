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
<title>약관 동의</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
    #wrapdiv {
        width: 550px;
        margin: 0 auto;
    }

    #wrapdiv>h1 {
        width: 100%;
        text-align: center;
    }

    #rectanglediv {
        width: 100%;
        height: 100%;
        border: 1px solid rgba(0,0,0,.12);
    }

    #progressdiv {
        width: 60px;
        height: 4px;
        margin-bottom: 32px;
        border-radius: 4px;
        background: rgba(0,0,0,.08);
    }

    #progressdiv>div {
        border-radius: 4px;
        float: left;
        box-sizing: border-box;
    }

    #contentdiv {
        margin: 10px 20px 0px 20px;
        padding: 55px 30px 50px 30px;
        /* border: 1px solid black; */
    }

    #contentdiv>div {
        margin-bottom: 39px;
    }

    .nopaddingdiv+p {
        padding-top: 9px;
        margin: 0px;
        font-size: 13px;
        color: #999;
        font-weight: 400;
    }

    #allcheck+i+span {
        font-size: 17px;
    }

    .allcheckdiv {
        padding: 0px 0px 19px 28px;
        border-bottom: 1px solid rgba(0,0,0,.08);
    }

    .allcheckdiv>.nopaddingdiv {
        margin: 0px 0px 0px -28px;
    }

    .inputchoice[type="checkbox"] {
        cursor: pointer;
        /* appearance: none; */
        display: none;
    }
    
    .allchoice[type="checkbox"] {
        cursor: pointer;
        /* appearance: none; */
        display: none;    
    }

    .checklabel {
        cursor: pointer;
    }

    .circle{
        display: inline-block; /* 영역적용가능해짐 */
        width: 20px; 
        height: 20px;
        margin-right: 8px;
        border: 2px solid gray;
        box-sizing: border-box;
        border-radius: 10px; /* 모서리둥글게 처리 */
        position: relative; 
        top: 4px;
        cursor: pointer; /* 마우스 올렸을때 손모양 처리 */
        /* background-image: url(../images/check_gray.png); */
        background-size: 70%;
        background-repeat: no-repeat;
        background-position: center;
    }

    /* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
    #chk { 
        position: absolute; 
        left: -999em; 
    }

    .inputchoice:checked + .circle{
        background-color: rgb(243, 156, 18);
        border-color: rgb(243, 156, 18);
        background-image: url(${ path }/resources/image/join/check_white.png);
    }

    .allchoice:checked + .circle{
        background-color: rgb(243, 156, 18);
        border-color: rgb(243, 156, 18);
        background-image: url('${path}/resources/image/join/check_white.png');
    }

    .inputchoice{
        position: absolute;
        left: -999em; 
    }

    .allchoice {
        position: absolute;
        left: -999em; 
    }

    .checkul {
        list-style-type: none;
        padding: 0;
        margin-top: 2px;
    }

    .checkul>li {
        margin-top: 20px;
    }

    .checkspan {
        font-size: 15px;
        font-weight: 500;
    }

    .termsbtn {
        width: 30px;
        height: 30px;
        background: url(${path}/resources/image/join/chevron_right_FILL0_wght400_GRAD0_opsz48.png) no-repeat;
        background-size: contain;
        background-position: 0px 0px;
        position: absolute; 
        right: -10px;
        border: 0px;
    }

    #agreediv{
        width: 100%;
        height: 50px;
        padding-top: 38px;
    }
    
    /* 약관 동의 전 스타일 */
    #agreebtn:disabled {
        width: 100%;
        height: 100%;
        /* color: #333; */
        color: #b2b2b2;
        background-color: #fafafa;
        pointer-events: none;
        cursor: default;
        border: 0px;
    }

    /* 약관 동의 전 disabled */
    /* .btn_g:disabled {
        color: #b2b2b2;
        background-color: #fafafa;
        pointer-events: none;
        cursor: default;
    } */

    /* 약관동의 후 스타일 */
    #agreebtn {
        display: block;
        width: 100%;
        height: 50px;
        border: 0px;
        border-radius: 4px;
        font-weight: 400;
        font-size: 16px;
        line-height: 51px;
        color: white;
        cursor: pointer;
        background-color: rgb(243, 156, 18);
    }

</style>
</head>
<body>
    <div id="wrapdiv">
        <h1><a href="${ path }/" style="text-decoration: none; color: rgb(245, 124, 77);">KKANBU</a></h1>
        <div id="rectanglediv">
            <div id="contentdiv">
                <div>
                    <div id="progressdiv">
                        <div style="width: 50%; background-color: #4c4c4c; height: 4px;"></div>
                    </div>
                    <h2 style="font-weight: 500;">
                        깐부월드
                        <br>
                        서비스 약관에 동의해주세요
                    </h2>
                </div>
                <form action="${ path }/join/signIn" method="get">
                    <div class="allcheckdiv">
                        <div class="nopaddingdiv">
                            <label for="allcheck" class="checklabel">
                                <input type="checkbox" class="allchoice" id="allcheck">
                                <i class="circle"></i><span><strong>모두 동의합니다.</strong></span>
                            </label>
                        </div>
                        <p>
                            전체 동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며, 개별적으로도 동의를 선택하실 수 있습니다.
                            <br>
                            선택항목에 대한 동의를 거부하시는 경우에도 서비스는 이용이 가능합니다.
                        </p>
                    </div>
                    <div class="checkdiv">
                        <ul class="checkul">
                            <li>
                                <div class="nopaddingdiv">
                                    <label for="check14" class="checklabel">
                                        <input type="checkbox" class="inputchoice" name="check14" id="check14">
                                        <i class="circle"></i><span class="checkspan">만 14세 이상입니다.</span>
                                    </label>
                                </div>                               
                            </li>
                            <li>
                                <div class="nopaddingdiv" style="position: relative; display: block;">
                                    <label for="accountcheck" class="checklabel">
                                        <input type="checkbox" class="inputchoice" name="accountcheck" id="accountcheck">
                                        <i class="circle"></i><span class="checkspan">[필수] 깐부월드 이용약관</span>
                                    </label>
                                    <button class="termsbtn" type="button" onclick="window.open('${ path }/join/terms/useTerms', '이용약관', 'width=600, height=500, top=200, left=500');"></button>
                                </div>
                            </li>
                            <li>
                                <div class="nopaddingdiv" style="position: relative; display: block;">
                                    <label for="privatecheck" class="checklabel">
                                        <input type="checkbox" class="inputchoice" name="privatecheck" id="privatecheck">
                                        <i class="circle"></i><span class="checkspan">[필수] 개인정보 수집 및 이용 동의</span>
                                    </label>
                                    <button class="termsbtn" type="button"></button>
                                </div>
                            </li>
                            <li>
                                <div class="nopaddingdiv" style="position: relative; display: block;">
                                    <label for="promotioncheck" class="checklabel">
                                        <input type="checkbox" class="inputchoice" id="promotioncheck">
                                        <i class="circle"></i><span class="checkspan">[선택] 프로모션 정보 수신 동의</span>
                                    </label>
                                    <button class="termsbtn" type="button"></button>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="agreediv">
                        <button id="agreebtn" disabled>동의</button>
                    </div>

                </form>

            <!-- contentdiv 끝 -->
            </div>
        <!-- rectanglediv 끝 -->
        </div>
    </div>


<script>
window.onload = function () {
    let allcheck = document.getElementById('allcheck');
    let inputchoice = document.getElementsByClassName('inputchoice');
    let check14 = document.getElementById('check14');
    let accountcheck = document.getElementById('accountcheck');
    let privatecheck = document.getElementById('privatecheck');
    let agreebtn = document.getElementById('agreebtn');

    allcheck.addEventListener('change', (e) => {

        for(let i = 0; i < inputchoice.length; i++) {
            // console.log(inputchoice[i]);
            // console.log('e : ' + e);
            // console.log('e.target : ' + e.target);
            inputchoice[i].checked = e.target.checked;
        }

        if(check14.checked && accountcheck.checked && privatecheck.checked) {
            agreebtn.disabled = false;
        } else {
            agreebtn.disabled = true;
        }

    });
    
    check14.addEventListener('change', (e) => {
        
        if(check14.checked && accountcheck.checked && privatecheck.checked) {
            agreebtn.disabled = false;
        } else {
            agreebtn.disabled = true;
        }
        
    });
    
    accountcheck.addEventListener('change', (e) => {
        
        if(check14.checked && accountcheck.checked && privatecheck.checked) {
            agreebtn.disabled = false;
        } else {
            agreebtn.disabled = true;
        }

    })
    
    privatecheck.addEventListener('change', (e) => {
        
        if(check14.checked && accountcheck.checked && privatecheck.checked) {
            agreebtn.disabled = false;
        } else {
            agreebtn.disabled = true;
        }

    })

    



}
</script>
</body>
</html>