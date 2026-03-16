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
<title>내정보</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
    

    #privatetextdiv {
        height: 30px;
    }

    #rectanglediv {
        border: 2px solid skyblue;
        height: 80px;
        padding: 20px;
    }

    #rectanglediv>div {
        /* border: 1px solid black; */
        display: flex;
        align-items: center;
        height: 100%;
    }

    table {
        border-collapse: separate;
        border-spacing: 0px 20px;
    }

    table td {
        font-size: 16px;
    }
    
    table td input {
        width: 200px;
        border: 1px solid lightgray;
        border-radius: 4px;
        height: 25px;
        padding: 2px 3px 0px 3px;
        margin: 0px;
    }

    .idInput {
        border: 0px solid black;
        outline: none;
        background-color: white;
        font-size: 14px;
        /* font-weight: bold; */
    }

    .idInput:focus {
        outline: none;
    }

    .idInput:hover{
        cursor: default;
    }

    .pwdInput::placeholder {
        color: lightgray;
    }

    .pwdInput:focus {
        outline: 1px solid rgb(245, 124, 77);
        border: 1px solid white;
    }

    #btmbtndiv {
        display: flex;
        justify-content: center;
    }

    #btmbtndiv>input {
        margin: 15px 20px;
        border: 0px;
        /* border: 1px solid lightgray; */
        border-radius: 4px;
        font-size: 14px;
        font-weight: bold;
        background-color: rgb(243, 156, 18);
        color: white;
        height: 30px;
        width: 80px;
        cursor: pointer;
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
                    <li id="myInformation"><button style="border-bottom: 2px solid rgb(243, 156, 18); color: rgb(243, 156, 18); cursor: default;" disabled>내정보</button></li>
                    <li id="passwordchg"><button onclick="location.href='${ path }/webpage/mypage/changePwd'">비밀번호변경</button></li>
                    <li id="deleteAccount"><button onclick="location.href='${ path }/webpage/mypage/accountdel'">회원탈퇴</button></li>
                </ul>
            </div>
            <div id="privatetextdiv">
                <span><b>개인정보 보호를 위해 회원님의 비밀번호를 입력해주세요.</b></span>
                <span style="color: rgb(243, 156, 18);"></span>

            </div>
            <form action="${ path }/webpage/mypage/myInfo" method="post" id="tableformdiv" >
                <div id="rectanglediv">
                    <div id="tablediv">
                        <table>
                            <tr>
                                <td style="width: 150px;"><b>아이디</b></td>
                                <!-- <td style="width: 200px;"><input type="text" value="nijey" class="idInput" disabled readonly></td> -->
                                <td style="width: 200px;">${ loginMember.id }</td>
                            </tr>
                            <tr>
                                <td><b>비밀번호</b></td>
                                <td><input type="password" name="password" class="pwdInput" placeholder="비밀번호를 입력하세요." required></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="btmbtndiv">
                    <input type="reset" value="취소하기"></input>
                    <input type="submit" value="입력하기"></input>
                </div>
            </form>
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
            </div>
            
            
        </div>
    </div>	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>