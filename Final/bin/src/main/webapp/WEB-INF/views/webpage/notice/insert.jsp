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
    #notice_title{
        border: none;
        outline: none;
        box-sizing: border-box; 
        width: 92%;
        position: relative;
        top: 25px;
        left: 20px;
        color: gray;
        font-size: larger;
        font-weight: 900;
    }
    #notice_content{
        border: none;
        outline: none;
        resize: none;
        margin: 2% 2%;
        width: 96%;
        height: 96%;
        box-sizing: border-box;
        font-size: large;
        
    }
    .btn{
        font-weight: 600;
        color: white;
        background-color: orange;
        border: 0px;
        border-radius: 4px;
    }
    #btn1{
        position: relative;
        top: 30px;
        left: 25%;
        width: 100px;
        height: 40px;
    }
    #btn2{
        position: relative;
        top: 30px;
        left: 40%;
        width: 100px;
        height: 40px;
    }
</style>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <h2>공지사항 등록</h2>
            <hr>
        </div>
        <div id="content">
            <div id="content_top">
                <span></span>
                <input type="text" id="notice_title" placeholder="공지사항 제목">
            </div>
            <div id="content_middle">
                <div id="content_middle1"></div>
                <div id="content_middle2">
                    <textarea name="" id="notice_content" cols="30" rows="10" placeholder="공지사항 내용"></textarea>
                </div>
            </div>
        </div>
        <div id="menu">
        	<button id="btn1" class="btn">등록하기</button>
        	<button id="btn2" class="btn">목록으로</button>
        </div>
    </div>
</body>
</html>