<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\\n"); %>

<!DOCTYPE html>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>게시판 업데이트</title>
</head>
<body>
<div style = "width : 600px; background-color: #E2E2E2">
<form class = writeForm action = "afterUpdate" method = "post">
	<input type = "text" name = "nt_bno" value = "${ntBoardVo.nt_bno }" style="display: none">
	<input type = "text" name = "userid" value = "${ntBoardVo.userid }" style="display: none">
	<input type = "text" name = "user_name" value = "${ntBoardVo.user_name }" style="display: none">
	<input type = "text" name = "nt_title" style = "width : 440px" value="${ntBoardVo.nt_title }" required>  
	<select style = "width : 149px" name = "nt_folder">
		<c:forEach var = "folder" items="${ntFolderList }">
			<option value = "${folder }">${folder }</option>		
		</c:forEach>
	</select>
	<br>
	<br>
	
	
	
	<textarea id = "textarea" style = "width : 595px; height: 300px"  name = "nt_content"><c:out value = "${ntBoardVo.nt_content }"/></textarea>
	
		
	<br>
	
</form>
	
	<a href = "ntList"><button id = "goToList">목록</button></a>
	<button style= " float : right; " id = "submit_form">등록</button>
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		console.log($('#textarea').val());
		
		
		
		$('#submit_form').click(function(){
			var frm = $('.writeForm');
			frm.submit();
			
		});
		
	
		
	});

</script>

</body>
</html>