<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h2 {
	font-size: 25px;
	color: blue;
}
/* .img_weap img {
	max-width: 100%;
} */
.img_wrap img {
	width: 100px;
	height: 120px;
	border: 1px solid grey;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>File Upload</title>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/resources/import/subheader.jspf" %>

<body>
	<div>
		<h2>이미지 미리보기</h2>
		<div class="img_wrap">
			<img id="img">

		</div>
		
		
		

	</div>
	<form action="profileupload" method="post" enctype="multipart/form-data">
	<input type="file" name ="file" id="input_img" multiple>
	<input type="submit" value="저장 ">
	</form>
	
	<c:choose>
			 	<c:when test="${empty userImage }">
				<div>
					<img id ="profileImg" src = "/displayFile?fileName=/do0610.jpg" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:when>
				<c:otherwise>
				<div>
					<img id ="profileImg" src = "/displayFile?fileName=/do0610.jpg" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:otherwise>
</c:choose>
	
	
	
	
	<script type="text/javascript">
		var sel_file;
		$(document).ready(function() {
			$("#input_img").on("change", handleImgFileSelect);
		
			if(${not empty savedFile}){
		  	    alert('${savedFile} 저장 성공')
		  	  }
			
			
			  $("#input_img").on("change", fileChange);
		
		});// document.ready end
		
		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result);

				}
				reader.readAsDataURL(f);
			});
		} // handleImgFileSelect end
		
		// -------------------------------------------------------------------2번쨰 
		


		function fileChange(e) {
			e.preventDefault();


			var files = e.target.files;
		    var filesArr = Array.prototype.slice.call(files);

		    filesArr.forEach(function(f) {
		        if(!f.type.match("image.*")) {
		            alert("확장자는 이미지 확장자만 가능합니다.");
		            return;
		        }

		        sel_file = f;

		        var reader = new FileReader();
		        reader.onload = function(e) {
		            $("#profileImg").attr("src", e.target.result);
		        	$("#profileImg").css("height", "100px")
		        }
		        reader.readAsDataURL(f);
		    });

		    var file = files[0]
		    console.log(file)
		    var formData = new FormData();

		    formData.append("file", file);

				$.ajax({
		    	url: '/uploadAjax',
				  data: formData,
				  dataType:'text',
				  processData: false,
				  contentType: false,
				  type: 'POST',
				  success: function(data){

					alert("프로필 이미지가 변경 되었습니다.")

				  }
				})


		 		function checkImageType(fileName){
		 			var pattern = /jpg$|gif$|png$|jpeg$/i;
		 			return fileName.match(pattern);
		 		}


		 		function getOriginalName(fileName){
		 			if(checkImageType(fileName)){
		 				return;
		 			}

		 			var idx = fileName.indexOf("_") + 1 ;
		 			return fileName.substr(idx);

		 		}


		 		function getImageLink(fileName){

		 			if(!checkImageType(fileName)){
		 				return;
		 			}
		 			var front = fileName.substr(0,12);
		 			var end = fileName.substr(14);

		 			return front + end;

		 		}

		}
		
		
		
		
		
		
		
		
	</script>
</body>
</html>