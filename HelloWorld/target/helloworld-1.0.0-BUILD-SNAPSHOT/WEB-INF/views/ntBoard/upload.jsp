<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="upload" method="post" enctype="multipart/form-data">
	<input type = "file" name = "files" multiple><br>
	
	<input type = "submit" value = "업로드">
	</form>


<script type="text/javascript">
	$(document).ready(function(){
		if(${not empty savedFile}){
			alert('${savedFile} 저장 성공');
		}
		
		
	});
</script>
</body>
</html>