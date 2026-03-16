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
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
<style>
    #wrap{
        height: 600px;
        width: 700px;
        margin: auto;
    }
    #header{
        /* border: 1px solid; */
        height: 20%;
    }
    .btn_admin{
        position: relative;
        left: 62%;
        margin-left: 20px;
        width: 70px;
        height: 30px;
    }
    #content{
        width: 100%;
        height: 100%;
    }
    #content_top{
        position:relative;
        top: 42px;
        margin: auto;
        border-top: 3px solid orange;
        border-left: 3px solid orange;
        border-right: 3px solid orange;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        background-color: white;
        box-sizing: border-box;
        height: 13%;
        width: 90%;

    }
    #content_middle{
        border-right: 5px solid lightgray;
        border-left: 5px solid lightgray;
        border-top: 5px solid lightgray;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        box-sizing: border-box;
        height: 80%;
        /* border-bottom: 2px dashed blue; */
    }
    #content_middle1{
        box-sizing: border-box;
        height: 8%;
    }
    #content_middle2{
        box-sizing: border-box;
        border-top: 2px dashed lightgray;
        /* border-bottom: 2px dashed red; */

        height: 92%;
    }

    #menu{
        margin-top: 10px;
        height: 20%;
    }
    .btn_view{
        width: 70px;
        height: 30px;
        border-radius: 15px;
    }
    #notice_title{
        position: relative;
        top: 25px;
        left: 20px;
        color: orange;
        font-size: larger;
        font-weight: 900;
    }
</style>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <h2>공지사항</h2>
            <span>조회수 : </span>
            <c:if test="${loginMember.role eq 'Y'}">
            <input type="button" class="btn_admin" value="수정" onclick="location.replace('${path}/webpage/notice/update')">
            </c:if>
            <input type="button" class="btn_admin" value="삭제">
            <hr>
        </div>
        <div id="content">
            <div id="content_top">
                <span></span>
                <span id="notice_title">공지사항</span>
            </div>
            <div id="content_middle">
                <div id="content_middle1">

                </div>
                <div id="content_middle2">

                </div>
            </div>
        </div>
        <div id="menu">
            <input type="button" class="btn_view" value="PRE">
            <label>이전글 제목</label>
            <hr>
            <input type="button" class="btn_view" value="NEXT">
            <label>다음글 제목</label>
        </div>
    </div>
</body>
</html>