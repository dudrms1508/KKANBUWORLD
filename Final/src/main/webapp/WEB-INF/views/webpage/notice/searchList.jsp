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
        height: auto;
        width: 800px;
        margin: auto;
    }
    #header{
        /* border: 1px solid;  */
        height: 20%;
        line-height: 115px;
        text-align: center;
    }
    #content{
        /* border: 1px solid; */
        width: 100%;
        height: 30%;
        
        text-align: center;
    }
    table,tr,th,td{
        border: 1px solid;
        border-collapse: collapse;
    }
    table{
        table-layout: fixed;
    }
    tr{
        height: 40px;
    }
    #tr_notice{
        background-color: bisque;
    }
    #th_notice_no{
        width: 40px;
    }
    .td_notice_title a {
        text-decoration: none;
        color: black;
    }
    #th_notice_title{
        width: 520px;
    }
    #th_notice_user{
        width: 100px;
    }
    #th_notice_date{
        width: 100px;
    }
    #th_notice_view{
        width: 80px;
    }
    a{
        text-decoration: none;
        color: black;
    }
    .td_notice_title{
        font-weight: 900;
    }
    

    
    
    #input_select{
        width: 200px;
        height: 19px;
        
        
    }
    #btn_select{
        width: 80px;
        height: 26px;
        position: relative;
        top: 1px;
        margin: 0px 30px 0px 10px ;
    }
    #btn_insert{
        width: 80px;
        height: 26px;
        position: relative;
        top: 1px;
    }

    .viewCount{
        width: 35px;
        height: 25px;
        margin: 0px auto;
        display: inline-block;
        margin: 0px 4px;
    }
    select {
		height: 25px;
	}
	#search{
	
	}
</style>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <h1>공지사항</h1>
        </div>
        <div id="content">
            <table>
                <tr id="tr_notice">
                    <th id="th_notice_no">번호</th>
                    <th id="th_notice_title">제목</th>
                    <th id="th_notice_user">작성자</th>
                    <th id="th_notice_date">작성일자</th>
                    <!-- <th id="th_notice_view">조회수</th> -->
                </tr>
                <c:forEach var="notice" items="${list}">
                <tr>
                    <td>${notice.no} </td>
                    <td class="td_notice_title"><a href="${ path }/webpage/notice/view?no=${ notice.no }">${notice.title}</a></td>
                    <td>
                    	관리자
                    	
                    </td>
                    <td> <fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd" /> </td>
                    	<input type="hidden" name="rownum" value="${notice.rownum}">
                    <%-- <td>${notice.view} </td> --%>
                </tr>
                </c:forEach>
            </table>

            <br><br><br>
            	<form action="${path}/webpage/notice/searchList" method="get">
            	<select name="type" >
	                <option value="T" selected>제목</option>
	                <option value="C">내용</option>
	                <option value="B">제목 + 내용</option>
            	</select>
            	
                <input type="text" id="input_select" name="keyword"  value="${keyword}">
                <input type="submit" id="btn_select" value="검색" >
                
                <input type="button" id="btn_insert" value="작성하기" onclick="location.href='${path}/webpage/notice/insert'">
            	</form>
                
            <br><br><br><br>
			
            <input type="button" class="viewCount" value="<<" onclick="location.href='${ path }/webpage/notice/searchList?page=1'">
            <input type="button" class="viewCount" value="<" onclick="location.href='${ path }/webpage/notice/searchList?page=${ pageInfo.prevPage }'">
            
            
            <c:forEach  begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
            	<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage}">
						<input type="button" class="viewCount" value="${ status.current }" disabled>
					</c:when>
					<c:otherwise>						
						<input type="button" class="viewCount" onclick="location.href='${ path }/webpage/notice/searchList?type=${type}&keyword=${keyword}&page=${ status.current }'" value="${ status.current }" />
					</c:otherwise>
				</c:choose>
            </c:forEach>
            
             
            <input type="button" class="viewCount" value=">" onclick="location.href='${ path }/webpage/notice/searchList?page=${ pageInfo.nextPage }'">
            <input type="button" class="viewCount" value=">>" onclick="location.href='${ path }/webpage/notice/searchList?page=${ pageInfo.maxPage }'">
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>