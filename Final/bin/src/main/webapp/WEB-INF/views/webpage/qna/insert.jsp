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
	    resize: none;
	    border: none;
	    outline: none;
	    width: 100%;
	    height: 400px;
	    box-sizing: border-box;
	    font-size: x-large;
	}
	
	.input_text{
	    
	    border: none;
	    outline: none;
	    box-sizing: border-box;
	    width: 100%;
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
    <div id="wrap">
        <div id="header">
            <h2>문의하기</h2>
            <hr>
        </div>
        <div id="contents">
        <form action="${path}/webpage/qna/insert" method="post" >
            <table >
                <tr>
                    <th class="th">제목</th>
                    <td class="td">
                        <input type="text" name="title" id="title" class="input_text" required>
                    </td>
                </tr>
                <tr>
                    <th class="th">작성자</th>
                    <td class="td">
                        <input type="text" name="" id="id" class="input_text" value="${loginMember.id }" readonly required>
                    </td>
                </tr>
                <tr>
                    <th class="th">이메일</th>
                    <td class="td">
                        <input type="text" name="email" id="email"class="input_text" value="${loginMember.email }" required>
                    </td>
                </tr>
                <tr>
                    <th  class="th">문의 유형</th>
                    <td class="td">
                        <input type="text" name="category" id="category" class="input_text">
                    </td>
                </tr>
                <tr>
                    <th id="th_content" class="th">문의내용</th>
                    <td class="td">
                        <textarea name="content" id="content" required></textarea>
                    </td>
                </tr>
            </table>
            <input id="btn1" class="btn" type="submit" value="문의하기">
            <input id="btn2" class="btn" type="reset" value="취소">
        </form>
        </div>
    </div>
</body>
</html>