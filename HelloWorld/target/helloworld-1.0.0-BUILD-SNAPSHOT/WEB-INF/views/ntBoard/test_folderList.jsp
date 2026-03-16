<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>${ntBoardVO.nt_title }</title>
<style type="text/css">
.ntBoardFolderList{
	float : left;
 	width : 200px; 
 	height: 550px; 
 	border: 1px solid grey;
 	margin-left:50px;
 	margin-right: 20px;
 	
}
.ntBoardFolderList a:link {text-decoration: none; color: #333333;}
.ntBoardFolderList a:visited {text-decoration: none; color: #333333;}
.ntBoardFolderList a:active {text-decoration: none; color: #333333;}
.ntBoardFolderList a:hover {text-decoration: underline; color: black;}


.reply_form a:link {text-decoration: none; color: #DE9920;}
.reply_form a:visited {text-decoration: none; color: #DE9920;}
.reply_form a:hover{text-decoration: none; color: #F4AE72;}

.menu_tool a:link {text-decoration: none; color: #DE9920;}
.menu_tool a:visited {text-decoration: none; color: #DE9920;}
.menu_tool a:hover{text-decoration: none; color: #F4AE72;}


.reply_item a:active {text-decoration: none; color: #333333;}
.reply_item a:hover {text-decoration: none; color: black;}

.listStyle{
	margin: 13px 13px 13px 13px;

}

ol {
  list-style : none;
  padding-inline-start: 10px;
  
}
ol li{
	background: url("${pageContext.request.contextPath}/resources/images/folder2.png") left center no-repeat;
	list-style-position : inside;
	padding-left: 20px;
	
}

ul {
  list-style : none;
  
}

ul li{
	background: url("${pageContext.request.contextPath}/resources/images/file.png") left center no-repeat;
	list-style-position : inside;
	padding-left: 20px;
	
}

#btn_replyU {
        background: url( "${pageContext.request.contextPath}/resources/images/replyU.png" ) no-repeat;
        border: none;
        width: 12px;
        height: 12px;
        cursor: pointer;
      }
      
#btn_replyD {
        background: url( "${pageContext.request.contextPath}/resources/images/replyD.png" ) no-repeat;
        border: none;
        width: 12px;
        height: 12px;
        cursor: pointer;
      }
      
#nt_Ucontent {
		width: 490px;
		height: 20px;
		resize: none;
		overflow-x: auto; 

}   

</style>
</head>
<body>
<div class = "main_form" style="width: 100%; height:550px;     "> <!-- mainform -->
	
	
	<div class = "ntBoardFolderList" ><!-- board-folderList -->
 	<a href = "ntList">전체보기</a><br>
 	<c:forEach var = "folder" items="${ntFolderList }">
 	  <ol class = "folders">
 		<li><a href = "${folder }">${folder }</a>
 	  </ol>
 	</c:forEach>
 	<form id = "selectByFolder" style="display: none;">
 		<input type = "text" name = "userid" value = "test">
 		<input type = "text" name = "folder">
 	</form>
 
 	</div>
 </div>

</body>
<script type="text/javascript">

$('.ntBoardFolderList li a').click(function(){
	event.preventDefault();
	var folder = $(this).attr("href");
	console.log(folder);
	var frm = $('#selectByFolder');
	frm.attr('action', "ntList");
	frm.attr('method', 'post');
	frm.find('[name="folder"]').val(folder);
	frm.submit();

});
</script>

</html>