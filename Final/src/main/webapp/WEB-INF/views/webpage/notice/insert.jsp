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
<link rel="stylesheet" href="${ path }/resources/css/header.css">
<link rel="stylesheet" href="${ path }/resources/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
<style>
    #wrap{  	
        height: 600px;
        width: 700px;
        margin: 150px auto;
    }
    #header>h2{
        /* border: 1px solid; */
        margin-top:300px;
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
        cursor:pointer; 
    }
    #btn1{
        position: relative;
        top: 30px;
        left: 40%;
        width: 100px;
        height: 40px;
    }
    #btn2{
        position: relative;
        top: 30px;
        left: 25%;
        width: 100px;
        height: 40px;
    }
</style>
</head>
<body>
    <form action="${path}/webpage/notice/insert" method="post">
    <div id="wrap">
        <div id="header">
            <h2>공지사항 등록</h2>
            <hr>
        </div>
        <div id="content">
            <div id="content_top">
                <span></span>	
                <input type="text" id="notice_title" name="title" placeholder="공지사항 제목">
            </div>
            <div id="content_middle">
                <div id="content_middle1"></div>
                <div id="content_middle2">
                    <textarea id="notice_content" name="content" placeholder="공지사항 내용"></textarea>
                </div>
            </div>
        </div>
        <div id="insertBtn">
        	<button id="btn2" class="btn" onclick="location.href='${path}/webpage/notice/list'">목록으로</button>
        	<button id="btn1" class="btn" type="submit">등록하기</button>
        </div>
    </form>
    </div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
