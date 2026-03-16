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
 	width : 205px; 
 	height: 100%;
 	
 	margin:0px 0px;
 	margin-right: 25px;
 	background-color: white;
}
.board-detail{
	background: white;
	width: 790px;
	height: 100%;
	padding-left: 1px;
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
html{
 height: 100%;
} 

body{
	
	height: 100%;
}

</style>
</head>
<body>
<div class = "main_form" style="width: 100%; height: 100%; margin-bottom: 0% "> <!-- mainform -->
	
	<div class = "board-detail" style="float: left; height: 100%; ">
	<h3>${ntBoardVO.nt_title }</h3>
	<hr>
  		<span style="margin-right: 80px">
		<a>${ntBoardVO.user_name }</a>
  		</span>     
		<fmt:formatDate value="${ntBoardVO.nt_date }" pattern="yyyy.MM.dd HH:mm E" var = "nt_date"/>
		<span style="margin-left: 10px; float: right;">	
			조회수 <a style="color: red">${ntBoardVO.nt_cnt }</a>
		</span>
		<span style="float: right;">
			${nt_date }
		</span>	
		
	
	<hr>
	
		
		<div style="margin-bottom: 100px; ">
		
		<c:if test="${nt_file != null}">
			<ul>
			<c:forEach var = "file" items="${nt_file }">
				<li id = "fileUp" style="color: blue;"><a href = "${file }">${fn:split(file,'__')[1] }</a>
			</c:forEach>
			</ul>
		</c:if>
		
		<pre style="font-size: 120%; height: 100%;">${ntBoardVO.nt_content }</pre>
	
		
		</div>
		<div class = "menu_tool">
		
		<form id = "update_form" style="display: none;"> 
			<input id = "nt_bno" name = "nt_bno" value = "${ntBoardVO.nt_bno }">
			<input name = "userid" value = "${ntBoardVO.userid }">
			<input name = "user_name" value = "${ntBoardVO.user_name }">
			<input name = "nt_title" value = "${ntBoardVO.nt_title }">
			<input name = "nt_content" value = "${ntBoardVO.nt_content }">
			
		</form>
		<c:if test="${loginId == homeId }">
		 <a href = "#" id = "btn_update" style= "float : right;"> 수정 </a> 
		 <a style= "float : right;"> &nbsp;|&nbsp;</a>
		 </c:if>
		 <a href = "${ntBoardVO.nt_folder }" id = "toList" style="float: right"> 목록 </a>
		 
		<br>
		</div>
		
		
		<hr style="margin-bottom: 0px">
	    
	    <div class = "reply_form" style="background-color: #f1f3f5 "><!-- 댓글 부분 -->
	    
	    	
	    	<br>
	    	
	    	
	    	<div id = "replyInsert"><!-- 댓글 입력 부분 -->
	    		<div style="float: left; height: 30px; padding: 5px 15px 5px 15px;">
	    		<span style="">댓글</span>
	    		</div>
	    		
	    		<form style="float: left;">    		
	    		<textarea id = "content" style="width: 520px; height: 30px;  resize: none; overflow-y: auto;"></textarea>
	    		
	    		
	    		</form>	   
	    		<button id = btnAddReply style = "width: 35px; height: 35px; margin-left: 5px" > 확인 </button> 	
	    	</div><!-- end replyInsert -->
	    	<br>
	    	<hr>
	    	<div id = "replyList">
	    	
	    	</div>
	    	
	    </div><!-- end reply_form -->
		
		
	</div><!-- end boardDetail -->
	
	
</div><!-- end main form -->


<script type="text/javascript">
	function updateReplyReady(rno){
		var nt_rno = rno;
		var inputBox = '';
		inputBox += '<textarea id = "nt_Ucontent"></textarea>'
				  + '<button onclick = "updateReply('+ rno +')">수정</button>'
				  + '<button onclick = "cancelUpdate('+ rno +')">취소</button>'
		; 
		
		$('#updateForm'+rno).html(inputBox);
	};
	
	function cancelUpdate(rno){
		cancel = '';
		$('#updateForm'+rno).html(cancel);
	}
	
	function updateReply(rno){
		var nt_reply_content = $('#nt_Ucontent').val();
		var nt_rno = rno;
		
		$.ajax({
	  	      type : 'put',
	  	      url : '/helloworld/ntReply/' + nt_rno,
	  	      headers : {
	  	  	    'Content-Type' : 'application/json',
	  	  	    'X-HTTP-Method-Override' : 'PUT'
	  	  	  },
	  	  	  data : JSON.stringify({
	  	        'nt_reply_content' : nt_reply_content
	  	      }),
	  	      success : function(result){
	  	        if(result == 'success'){
	  	          alert('댓글 수정성공')
	  	          
	  	          location.reload();
	  	        
	  	        } // end if()
	  	      }// end success()
	  	      
	  	    }); // end ajax()
	}
	
	function deleteReply(rno){
		console.log(rno);
		
		var result = confirm('정말 삭제하시겠습니까 ?')
	
		if(result){
			$.ajax({
		  	      type : 'delete',
		  	      url : '/helloworld/ntReply/' + rno,
		  	      headers : {
		  	  	    'Content-Type' : 'application/json',
		  	  	    'X-HTTP-Method-Override' : 'DELETE'
		  	  	  },
		  	  	  data : JSON.stringify({
		  	  	    'nt_rno' : rno
		  	  	  }),
		  	      success : function(result){
		  	        if(result == 'success'){
		  	          alert('댓글 삭제성공')
		  	          location.reload();
		  	        } // end if()
		  	      }// end success()
		  	      
		  	    });

		}
		
			
	}

	$(document).ready(function(){
		
		var bno = '${ntBoardVO.nt_bno}';
		var loginId = '${loginId}';
		console.log(bno);
		getAllReplies();
		
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
		
		$('#toList').click(function(){
			event.preventDefault();
			var folder = $(this).attr("href");
			console.log(folder);
			var url = "/helloworld/ntBoard/ntList?folder=" +folder;
			location.href = url;
		});
		
		$('#btn_update').click(function(){
			var frm = $('#update_form');
			frm.attr('action', "update");
			frm.attr('method', 'post');
			frm.submit();
		});
		
		
		
		$('#fileUp a').click(function(){
			event.preventDefault();
			var nt_bno = $('#nt_bno').val();
			var fileName = $(this).attr("href");
			console.log(fileName);
			console.log(nt_bno);
			
			location.href = "http://localhost:8085/helloworld/ntBoard/fileDown?nt_bno=" + nt_bno + "&filecol="+encodeURI(fileName);	
		});
		
		// 댓글 입력
		$('#btnAddReply').click(function(){
	  	  	
	  	  	var content = $('#content').val(); // 댓글 내용 
	  	  	var obj = {
	  	  	    'nt_bno' : bno,
	  	  		'nt_reply_content' : content,
	  	  		
	  	  	}; // end var obj
	  	  	
	  	  	// $.ajax로 송신
	  	  	$.ajax({
	  	  	  type : 'post',
	  	  	  url : '/helloworld/ntReply',
	  	  	  headers : {
	  	  	    'Content-Type' : 'application/json',
	  	  	    'X-HTTP-Method-Override' : 'POST'
	  	  	  },
	  	  	  data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
	  	  	  success : function(result){
	  	  	    console.log(result);
	  	  	    if (result == 1){
	  	  	      alert('댓글 입력 성공');
	  	  	      $('#content').val('');
	  	  	      getAllReplies(); 
	  	  	    } // end if()
	  	  	  } // end success
	  	  	  
	  	  	}); // end ajax()
	  	  	
	  	  }); // end btn_add.click()
		
		
		
		
		
		// 전체댓글 불러오기 
		function getAllReplies(){
			var url = '/helloworld/ntReply/all?bno=' + bno;
			$.getJSON(
				url,
				function(jsonData){
				
				var list = '';
				
				
				
				
				$(jsonData).each(function(){
					var test = '';
					var date = getFormatDate(new Date(this.nt_reply_date));
		  	  		var userid = this.userid; 
		  	  		if(loginId == userid){
		  	  			test = '';
		  	  			test += '<button onclick = "updateReplyReady('+this.nt_rno+')" id = "btn_replyU"></button>'
			  	     	   + '<button onclick = "deleteReply(' + this.nt_rno + ')" id = "btn_replyD"></button><br>';
		  	  				  
		  	  		}
		  	  		 console.log(date);
		  	     list += '<div class = "reply_item">'
  	  		  		   + '<pre class="listStyle">'
  	  		  		   + '<input type="hidden" id="rno" value="' + this.rno + '" />'
  	  		  		   + '<input type="hidden" id="reply_id" value="' + this.replyid + '" />'
		  	     	   + '<a>' + this.user_name + '&nbsp;:&nbsp;' + this.nt_reply_content + '&nbsp;'
		  	     	   + '(' + date + ')</a>&nbsp;'  
		  	     	   + test
		  	     	   + '<div id = "updateForm'+ this.nt_rno +'"></div>'
		  	     	   + '</pre>'
		  	     	   + '<hr>'
		  	     	   + '</div>';
				
			 	  });// end each
				 $('#replyList').html(list);
				
					 
					 
				}//end callback

			); //end getJson
			
		};// end getAllreply
		
		
		
		
		
		
		
		function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    var hour = date.getHours();
		    hour = hour >= 10 ? hour : '0' + hour;
		    var sec = date.getSeconds();
		    sec = sec >= 10 ? sec : '0' + sec;
		    return  year + '-' + month + '-' + day + ' ' + hour + ':' + sec;
		}
		



		

	});

	

</script>
</body>
</html>