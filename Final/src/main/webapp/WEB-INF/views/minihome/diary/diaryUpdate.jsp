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
</head>
<style>

#tbl-board {
	/* border: 1px solid red; */
}

     #content {
        width: 800px;
        height: auto;
    }

    #board-write-container {
        border: 3px dotted rgba(243, 156, 18, 0.3);
        width: 750px;
        height: auto;
        margin: auto;
    }
    
  #tbl-board{
  	width:auto;
    display: block;
    margin: auto;
    border: 1px solid #eeeeee;
    border-radius: 5px;
    margin: 15px 0 10px 0;
  }
</style>
<body>
	<section id="content">
	  <div id='board-write-container'>
	  <form action="${ path }/minihome/diaryUpdate/${ minihomeNo }/${dNo}" method="POST"> 
	      <table id='tbl-board'>
	        <tr>
	          <th>제목</th>
	          <td>
	            <input type="text" name="title" id="title" value="${ diary.title }" style="resize: none; border: 1px solid #eeeeee; border-radius: 5px;">
	            
	            <select name="" id="" style="resize: none; border: 1px solid #eeeeee; border-radius: 5px;">
	              <option value="">-- 폴더 선택 --</option>
	              <option value="">오늘의 일기</option>
	              <option value="">우리들 이야기</option>
	            </select>
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td><textarea name="content" cols="50" rows="15" style="resize: none; border: 1px solid #eeeeee; border-radius: 5px;" required>${ diary.content }</textarea></td>
	        </tr>
	        <tr>
	          <th colspan="2">
	          	<input type="submit" value="수정" onclick="location.href='${ path }/minihome/diaryView/${ minihomeNo }'">
				<input type="reset" value="취소">
	          </th>
	        </tr>
	      </table>
	    </form>
	  </div>
	</section>
</body>
</html>