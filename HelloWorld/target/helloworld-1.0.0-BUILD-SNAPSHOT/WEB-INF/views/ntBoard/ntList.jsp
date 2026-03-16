<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
td{
  border-width : 1px;  
  margin-top : 10px;
}

table{
	margin-top:20px;
	margin-bottom:30px;
	width: 100%;
	
}

th{
	border-top : 1px solid grey;
	border-bottom: 1px solid grey;
	margin: 10px, 10px, 10px, 10px;
	text-align : center;
	background-color: #f1f3f5;
}

 

a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration: underline; color: black;}

ul{
  list-style-type: none;
}

ul li{
  display: inline-block;
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

#paging{
	width:200px;
	height:10px;
	margin: 0px auto;
}

.ntBoardFolderList{
	float : left;
 	width : 205px; 
 	height: 1000px; 
 	
 	margin:0px 0px;
 	margin-right: 25px;
 	background-color: white;
}
.pager li a{
	font-size: 110%;
	
}

button{
	
}


</style>
<meta charset="UTF-8">
<title>게시판 메인 페이지</title>
</head>
<body>

<div class = "main_list" style="width : 100%;">


  
  
  
  <div id = "noticeBoardList" style="float : left; width : 100%; height : 700px; background-color: white;"> <!-- board-list -->
  <form id = "delete_board">
  <input type = "text" name = "ntFolderList" value = "${ntFolderList }" style = "display : none">
  <table>
    <thead>
      <tr>
        <th style = "width : 70px;"></th>
        <th style = "width : 420px;"><b>제목</b></th>
        <th style = "width : 70px">작성자</th>
        <th style = "width : 100px">작성일</th>
        <th style = "width : 60px;">조회수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var = "vo" items = "${ntList }">
        <tr>
          <td style = "text-align: center;"><input type="checkbox" name = "nt_bnos" value = ${vo.nt_bno }></td>
          
          <td><a class = "goToDetail" href = "${vo.nt_bno }">${vo.nt_title }</a></td>
          <td style = "text-align : center;">${vo.user_name }</td>
          <fmt:formatDate value="${vo.nt_date }" pattern="yyyy-MM-dd" var="nt_date"/>
          <td style = "text-align : center;">${nt_date }</td>
          <td style = "text-align : center;">${vo.nt_cnt }</td>
        </tr>      
      </c:forEach>
    </tbody>  
  </table>
 
  <c:if test="${loginId == homeId }">
  <a href = "regist"><input type = "button" value = "글작성" style="float: right;"></a>
  <button id = "delete" style="float: right;">삭제</button>
  <button id = "moving_folder" style="float: right;">이동</button>
  </c:if>
  </form>
  
  
  
  <div id = "paging">

  	<ul class = "pager">
  	
  	 <c:if test = "${maker.hasPrev }">
  	 	<li><a href = "${maker.startPageNo - 1 }">◀</a> </li> 
  	 </c:if>
  	 
  	 <c:forEach begin = "${maker.startPageNo }" end = "${maker.endPageNo }" var = "num">
  	 	<li><a href = "${num }"> ${num } | </a></li>
  	 </c:forEach>
  	 <c:if test = "${maker.hasNext }">
  	 	<li><a href = "${maker.endPageNo + 1 }">▶</a></li>
  	 </c:if>	
  	</ul> 
  </div>
  
  </div><!-- end ntBoardList -->
  
  <div id = "pagerForm">
  	<form id = "pagingForm" style="display: none">
  	 <input type = "text" name = "page" value = "${maker.criteria.page }">
  	 <input type = "text" name = "perPage" value = "${maker.criteria.numsPerPage }">
  	
  	 <input type = "text" name = "folder" value = "${folder_pager }">
  	
  	 <input type = "text" name = "bno">
  	</form> 
  </div>
  
  
</div> <!-- end main-list -->   
  
  <script type="text/javascript">
  	$(document).ready(function(){
  		
  		
  		
  		
  		$('.pager li a').click(function(){
  			event.preventDefault();
  			var targetPage = $(this).attr('href');
  			
  			var frm = $('#pagingForm');
  			frm.find('[name = "page"]').val(targetPage);
  			frm.attr('method', 'post');
  			frm.attr('action','ntList');
  			frm.submit();
  		}); // end pager clicked
  		
  		$('.goToDetail').click(function(){
  			event.preventDefault();
  			var bno = $(this).attr('href');
  			var frm = $('#pagingForm');
  			frm.attr('action', 'detail');
  	        frm.attr('method', 'get');
  	        frm.find('[name="bno"]').val(bno);
  	        frm.submit();
  			
  		}); // end detail clicked
  		
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
  		
		$('#delete').click(function(){
  			
  			var frm = $('#delete_board');
  			
  			if($('input:checkbox[name="nt_bnos"]').is(":checked")){
  				frm.attr('action', "delete");
  				frm.attr('method', 'post');
  				frm.submit;
  				
  			}else{
  				alert('삭제할 글을 체크해 주세요');
  			}
  		});
		
		$('#moving_folder').click(function(){
			
			if($('input:checkbox[name="nt_bnos"]').is(":checked")){
				var child = "child";
				var frm = $('#delete_board');
				frm.attr('target', child);
				
				window.open("", child, "width=350, height=400");
				
				frm.attr('action', "moving_folder");
				frm.attr('method', 'get');		
				frm.submit();
  			}else{
  				alert('이동할 글을 체크해 주세요');
  			}
			
			
			
			
			
			
			
			
		});
  		
  		
  		
  	});// document.ready
  
  </script>
  
  
  </body>
  </html>