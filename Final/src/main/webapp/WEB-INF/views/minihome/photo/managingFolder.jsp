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
<style type="text/css">
ul {
  list-style : none;
  padding-inline-start: 10px;
  
}
ul li{
	background: url("${pageContext.request.contextPath}/resources/img/folder2.png" ) left center no-repeat;
	list-style-position : inside;
	padding-left: 20px;
	
}
</style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="${ path }/resources/js/GGAN.js"></script>
</head>
<body>
		<div style="width: 500px; height: 300px">
			<div id = "sub_main" style="width: 500px; height: 250px">

				<div style="float: left; ">
					<p style="font-weight: bold; color: red">폴더 편집 중에는 메뉴 탭을 이용할 수 없습니다.</p>	
						<select id = "testUl" size = "15" style="width: 200px">
	 
						</select>
							<div id = folderAdd style="float: right; padding: 0px 30px 30px 30px">
								<input type = "text" id = "inputFolder">
								<button id = "btnConfirm" style="float: right">저장</button>
							</div>
								<br>	
									<button id = "btnAdd">추가</button>
									<button id = "btnDelete">삭제</button>
									<button id = "goUp">^</button>
				</div>
					<br>
					<br>
	
	
	
	
			</div>
				<br>	
		</div>
	
			<form id = "updateFolder" style="display: none">
				<input type = "text" name = "beforeChangeF" >
				<input type = "text" name = "afterChangeF">
				<input type = "text" name = "changedFolder">
				<input type = "text" name = "deletedFolder">
			</form>
</body>
</html>