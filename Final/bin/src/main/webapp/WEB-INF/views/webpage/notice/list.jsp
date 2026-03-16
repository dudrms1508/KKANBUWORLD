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
        height: 800px;
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
        margin: 0px 50px 0px 10px ;
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
                    <th id="th_notice_view">조회수</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td class="td_notice_title"><a href="">공지사항1</a></td>
                    <td>관리자</td>
                    <td>2023.01.01</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="">공지사항1</a></td>
                    <td>관리자</td>
                    <td>2023.01.01</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><a href="">공지사항1</a></td>
                    <td>관리자</td>
                    <td>2023.01.01</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><a href="">공지사항1</a></td>
                    <td>관리자</td>
                    <td>2023.01.01</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><a href="">공지사항1</a></td>
                    <td>관리자</td>
                    <td>2023.01.01</td>
                    <td>1</td>
                </tr>
            </table>

            <br><br><br>
            	<select>
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="30">30</option>
            	</select>
            	
                <input type="text" id="input_select" >
                <input type="button" id="btn_select" value="검색">
                
                <input type="button" id="btn_insert" value="작성하기" onclick="location.replace('${path}/webpage/notice/insert')">
                
            <br><br><br><br>

            <input type="button" class="viewCount" value="<<">
            <input type="button" class="viewCount" value="<">
            <input type="button" class="viewCount" value="1">
            <input type="button" class="viewCount" value="2">
            <input type="button" class="viewCount" value="3">
            <input type="button" class="viewCount" value="4">
            <input type="button" class="viewCount" value="5">
            <input type="button" class="viewCount" value=">">
            <input type="button" class="viewCount" value=">>">
        </div>
    </div>
</body>
</html>