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

폴더 선택

<hr>

<select style = "width : 149px" id="nt_folder" name = "nt_folder">
		<c:forEach var = "folder" items="${ntFolderList }">
			<option id = "test" value = "${folder }">${folder }</option>		
		</c:forEach>	
	</select>
	
	
<c:forEach var = "bno" items="${nt_bnos }">
	<input type="checkbox" name = "nt_bnos" checked="checked" value="${bno }" style="display: none;">
</c:forEach>
    
	
	
	

<button id = "btn_upFolder">폴더변경</button>
<script type="text/javascript">
  $(document).ready(function(){
	
	  $('#btn_upFolder').click(function(){
		 
		  var nt_folder = $("#nt_folder option:selected").val();
	
		 	var nt_bnos = [];
		 	
		 	console.log(nt_folder);
		 	
		 	$("input[name='nt_bnos']:checked").each(function(i) {
		 		console.log($(this).val());
		 		nt_bnos.push($(this).val());
		 		
		 	});
		    
		 	for(var x in nt_bnos){
		 		console.log(x);
		 		
		 	}
		 	
	  	  	 
	  	  	
	  	  	var obj = {
	  	  	    'nt_bnos' : nt_bnos,
	  	  		'nt_folder' : nt_folder
	  	  	};
		 
	  	  $.ajax({
	  		url:"update_folder",
	  		type:"GET",
	  		data: obj,
	  		success: function(data){
	  			if(data == 1){
	  				alert("폴더 이동이 완료 되었습니다.")
	  				window.opener.location.reload();
	  				window.close();
	  				

	  			};
	  			
	  		},
	  		error : function(){
	  			alert("fail")
	  		}
	  		});
	  		
		 
		 
		
		 
		 
		  
		  
		  
	  });
	
	
	
	
  });

	

</script>
</body>
</html>