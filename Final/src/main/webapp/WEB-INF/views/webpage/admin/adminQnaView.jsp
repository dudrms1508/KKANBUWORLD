<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>


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
	    width: 700px;
	    height: auto;
	    margin: auto;
	}
	#header{
	    height: 20%;
	}
	#contents{
	    height: 80%;
	}
	table,tr,th,td{
	    border: 1px solid;
	    border-collapse: collapse;
	}
	table{
	    border-radius:10px; 
	    }
	.th{
	    height: 50px;
	    width: 100px;
	    background-color: lightgray;
	}
	.td{
	    width: 500px;
	    padding: 0px;
	}
	#content1{
	    height: 400px;
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
	#content{
		margin: 0 5px;
	    resize: none;
	    border: none;
	    outline: none;
	    width: 98%;
	    height: 400px;
	    box-sizing: border-box;
	}
	#category{
		margin: 0 5px;
		width: 150px;
		height: 30px;
		
	}
	.input_text{
	    margin: 0 5px;
	    border: none;
	    outline: none;
	    box-sizing: border-box;
	    width: 98%;
	    height: 30px;
	    font-size: large;
	}
	
	.btn{
        font-weight: 600;
        color: white;
        background-color: orange;
        border: 0px;
        border-radius: 4px;
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div id="wrap">
        <div id="header">
            <h2>문의하기</h2>
            <hr>
        </div>
        <div id="contents">
            <table >
                <tr>
                    <th class="th">제목</th>
                    <td class="td">
                   		
                        ${ qna.title }
                    </td>
                </tr>
                <tr>
                    <th class="th">작성자</th>
                    <td class="td">
                        ${ qna.userId }
                    </td>
                </tr>
                <tr>
                    <th class="th">이메일</th>
                    <td class="td">
                        ${ qna.email }
                    </td>
                </tr>
                <tr>
                    <th  class="th">문의 유형</th>
                    <td class="td">
                        ${ qna.category }
                    </td>
                </tr>
                <tr>
                    <th id="th_content" class="th">문의내용</th>
                    <td class="td">
                        ${ qna.content }
                    </td>
                </tr>
            </table>
            <input id="btn2" class="btn" type="button" value="돌아가기" onclick="location.href='${ path }/admin/adminQnA?table=QNA'">
            
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>