<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
ul {
  list-style : none;
  padding-inline-start: 10px;
  
}
ul li{
	background: url("${pageContext.request.contextPath}/resources/images/folder2.png") left center no-repeat;
	list-style-position : inside;
	padding-left: 20px;
	
}
</style>
</head>
<body>

<div style="width: 500px; height: 300px">
<div id = "sub_main" style="width: 500px; height: 250px">

	<div style="float: left; ">
	게시판 폴더설정<br>
	<select id = "testUl" size = "15" style="width: 200px">
	 
	</select>
	<br>
	
	<button id = "btnAdd">추가</button>
	<button id = "btnDelete">삭제</button>
	<button id = "goUp">^</button>
	</div>
	
	
	
	<br>
	
	
	<div id = folderAdd style="float: left; padding: 0px 30px 30px 30px">
	<input type = "text" id = "inputFolder">
	
	
	</div>
	
</div>
	<br>
	<hr>
	
	<a href = "ntList"><button id = "btnAddCancel" style="float: right;">취소</button></a>
	<button id = "btnConfirm" style="float: right">저장</button>
</div>
	
	<form id = "updateFolder" style="display: none">
		<input type = "text" name = "beforeChangeF">
		<input type = "text" name = "afterChangeF">
		<input type = "text" name = "changedFolder">
		<input type = "text" name = "deletedFolder">
	</form>
	
<script type="text/javascript">



	$(document).ready(function(){
		
		var fList = [];
		var deleteList = [];
		<c:forEach var = "folder" items="${ntFolderList }">
	 	fList.push("${folder }");
		</c:forEach>
				
		reloadList();
		
		
		// 추가버튼 클릭 시 
		$('#btnAdd').click(function(){
			if(fList.includes("새 폴더")){
				alert('이전에 추가된 새 폴더의 이름을 바꾼 후 진행해주세요');
				return;
			}
			fList.push("새 폴더");
			reloadList();

		});
		
		// 삭제버튼 
		$('#btnDelete').click(function(){
			if($('#testUl option:selected').val()==null){
				alert('삭제할 항목을 선택해주세요');
				return;
			}
			if($('#testUl option:selected').val()==""){
				alert('삭제할 항목을 선택해주세요')
				return;
			}
			
			if(fList.length == 1){
				alert('폴더는 최소 1개 이상 있어야합니다.');
				return;
			}
			
			deleteList.push($('#testUl option:selected').val());
			console.log(deleteList);
			var test = $('#testUl option:selected').attr('id');
			console.log(test);
			
			fList.splice(test, 1);
			$('#inputFolder').val('');
			reloadList();
			
		});
		
		$('#goUp').click(function(){
			
			
			if($('#testUl option:selected').val()==null){
				alert('이동할 항목을 선택해주세요');
				return;
			}
			if($('#testUl option:selected').val()==""){
				alert('이동할 항목을 선택해주세요')
				return;
			}
			var selected = $('#testUl option:selected').val();
			
			var test = $('#testUl option:selected').attr('id');
			console.log(test);
			if(test-1 < 0){
				alert('가장 상위에 있는 폴더입니다.');
				return;
			}
			
			var tmp = fList[test-1];
			fList[test-1] = fList[test]
			fList[test] = tmp;
			$('#inputFolder').val('');
			reloadList();
			selected.focus();
			
		});	// 게시판으로
		
		
		
		
		// 기능수행을 위한 기본동작 메소드
		$('#testUl option').click(function(){
			var selected = $(this).val();
			$('#inputFolder').val(selected);	
		});
		
		// DB 저장버튼 
		$('#btnConfirm').click(function(){
			
			var selected = $('#testUl option:selected').val();
			console.log(selected);
			var inputFolder = $('#inputFolder').val();
			console.log(inputFolder);
			if(inputFolder.includes(",")){
				alert("\",\" 는 쓸 수 없습니다.");
				return;
			}
			
			if(deleteList.length > 0){
				var result = confirm('삭제하려는 폴더가 있습니다. 이대로 진행하시면 폴더 안의 모든 데이터가 사라집니다 진행하시겠습니까?');
				
				if(result){
					var frm = $('#updateFolder');
					frm.attr('action', 'MngFolderdelete');
					frm.attr('method', 'post');
					frm.find('[name = "beforeChangeF"]').val(selected);
					frm.find('[name = "afterChangeF"]').val(inputFolder);
					frm.find('[name = "changedFolder"]').val(fList);
					frm.find('[name = "deletedFolder"]').val(deleteList);
					frm.submit();
					
					return;
				}
				

			}
			
			
			
			if(fList.includes(inputFolder)){
				alert('이미 존재하는 폴더입니다.');
				return;
			};
			
 			
			if(fList.includes(selected)){
				updateFolder(selected, inputFolder);
				console.log('업데이트 메소드 수행');
				return;
			};
			
			updateFolder2();
			
		});
		
		function updateFolder(selected, inputFolder) {
			
			var frm = $('#updateFolder');
			frm.attr('action', 'managingFolder');
			frm.attr('method', 'post');
			frm.find('[name = "beforeChangeF"]').val(selected);
			frm.find('[name = "afterChangeF"]').val(inputFolder);
			frm.find('[name = "changedFolder"]').val(fList);
			frm.submit();
	
		}
		
		function updateFolder2(){
			var frm = $('#updateFolder');
			frm.attr('action', 'managingFolder');
			frm.attr('method', 'post');
			frm.find('[name = "changedFolder"]').val(fList);
			frm.submit();
		}
		
		function reloadList(){
			$("#testUl").empty();
			
			for(var list in fList){
				$("#testUl").append("<option id = '" +list + "'>"+ fList[list] + "</option>");  

				
			};
			
			$('#testUl option').click(function(){
				var selected = $(this).val();
				$('#inputFolder').val(selected);	
			});
			
		}
		
		$('#btnAddUnderline').click(function(){
			
			console.log(deleteList);
			
		});
		
		
	});



</script>

</body>
</html>