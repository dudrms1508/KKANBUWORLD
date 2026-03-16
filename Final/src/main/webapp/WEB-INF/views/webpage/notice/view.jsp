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
       position: relative;
       top:30px;
        height: 600px;
        width: 700px;
        margin: 250px auto;
        
    }
    #header{
        /* border: 1px solid; */
        height: 20%;
    }
    .btn_admin{
        position: relative;
        right: -43%;
        margin-left: 20px;
        width: 70px;
        height: 30px;
        
    }
    .btn_list{
        position: relative;
        right: -85%;
        margin-left: 20px;
        width: 70px;
        height: 30px;
    }
    #content{
        width: 100%;
        height: 60%;
    }
    #content_top{
        position:relative;
        top: 30px;
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
       position:relative;
        top: 2px;
        box-sizing: border-box;
        border-top: 2px dashed lightgray;
        /* border-bottom: 2px dashed red; */

        height: 92%;
    }

    #menu_bottom{
        margin-top: 10px;
        height: 20%;
        width:
    }
    .btn_view{
        width: 70px;
        height: 30px;
        border-radius: 15px;
    }
    #notice_title{
        position: relative;
        top: 15px;
        left: 20px;
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
    
</style>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <h2>공지사항</h2>
            <input type="button" class="btn_list" value="목록으로" onclick="location.href='${path}/webpage/notice/list'">
            <c:if test="${loginMember.role eq 'Y'}">
            <input type="button"  class="btn_admin" value="수정" onclick="location.href='${path}/webpage/notice/update?no=${notice.no}'">
            <input type="button" id="btnDelete" class="btn_admin" value="삭제" >
            </c:if>
            <hr>
        </div>
        <div id="content">
            <div id="content_top">
                <span id="notice_title">${notice.title}</span>
            </div>
            <div id="content_middle">
                <div id="content_middle1">
               
                </div>
                <div id="content_middle2">
                   <textarea id="notice_content" name="content" placeholder="공지사항 내용" readonly>${notice.content}</textarea>
               
                </div>
            </div>
        </div>
        <div id="menu_bottom">
           <c:if test="${!empty noticePre}">
            <input type="button" class="btn_view" value="PRE" onclick="location.href='${path}/webpage/notice/view?no=${ noticePre.no }'" >
            </c:if>
            <c:if test="${empty noticePre}">
            <input type="button" class="btn_view" value="PRE" none>
            </c:if>
            <label>${noticePre.title }</label>
            
            <hr>
            
            <c:if test="${!empty noticeNext}">
            <input type="button" class="btn_view" value="NEXT" onclick="location.href='${path}/webpage/notice/view?no=${ noticeNext.no }'">
            </c:if>
            <c:if test="${empty noticeNext}">
            <input type="button" class="btn_view" value="NEXT" none>
            </c:if>
            <label>${noticeNext.title }</label>
        </div>
    </div>
<script>
    $(document).ready(function(){
        $('#btnDelete').on('click', function(event){
            if(confirm("삭제")){
               location.href='${path}/webpage/notice/delete?no=${notice.no}';
            }else{
               event.preventDefault();
            }
        });
    });
</script>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>