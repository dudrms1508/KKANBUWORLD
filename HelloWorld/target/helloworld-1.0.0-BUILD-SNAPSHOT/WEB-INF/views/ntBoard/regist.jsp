<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>게시판 입력</title>
<style type="text/css">
	
</style>
</head>
<body>
<div style = "width : 600px; background-color: #E2E2E2">



<form class = writeForm action = "regist" method = "post" enctype="multipart/form-data">
	<input type = "text" name = "nt_title" style = "width : 440px" placeholder="제목 입력" required="required">  
	
	<select style = "width : 149px" name = "nt_folder">
		<c:forEach var = "folder" items="${ntFolderList }">
			<option value = "${folder }">${folder }</option>		
		</c:forEach>
	</select>
	<br>
	<button id = "uploaderOpen">파일</button> 파일 업로드는 3개로 제한됩니다.
	<div id = "file_menu" style="display: none">
	
	<input type = "file" name="files" multiple> <a id = "reload" href = "#"><button>x</button></a>
	</div>
	<textarea id = "textarea" style = "width : 595px; height: 300px;"  name = "nt_content"  placeholder = "내용 입력" required></textarea>
	
	<br>
	
</form>
	
	<a href = "ntList"><button id = "goToList">목록</button></a>
	<button style= " float : right; " id = "submit_form">등록</button>
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$('#submit_form').click(function(){
			
			var frm = $('.writeForm');
			frm.submit();
			
		});
		
		$('#uploaderOpen').click(function(){
			
			event.preventDefault();
			
			if($("#file_menu").css("display") == "none"){   
		       $('#file_menu').css("display", "block");   
		    } else {  
		        $('#file_menu').css("display", "none");   
		    } 

		});
		
		$('#reload').click(function(){
			event.preventDefault();
			var check = confirm('파일을 삭제하시면 여태까지 입력된 정보가 초기화 됩니다. 진행하시겠습니까?');
			if(check){
				location.reload();
			}
			
		});
		
	
		
	});
	
	

</script>

</body>
</html>