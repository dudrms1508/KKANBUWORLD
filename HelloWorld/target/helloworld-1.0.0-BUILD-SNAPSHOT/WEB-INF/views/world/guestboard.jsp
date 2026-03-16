<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
ul {
	list-style-type: none;
}

ul li {
	display: inline-block;
}

ol {
	list-style: none;
	padding-inline-start: 10px;
}

ol li {
	background:
		url("${pageContext.request.contextPath}/resources/images/folder2.png")
		left center no-repeat;
	list-style-position: inside;
	padding-left: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">

</style>

<title>방명록</title>


</head>
<body>
	<h1>세션 로그인 아이디 ${loginId }</h1>
	<a>여기앞에</a>

	<div id="scroll">
		<div class="guestboard">
			<div style="padding-top: 30px ; padding-left: 10px;">
				<div class="img_wrap">
					<img id="img" src="displayFile?fileName=/${vo.user_photo}">
				${member.user_photo}
				</div>
				<div>
					<input type="text" id="g_content" placeholder="글쓰기">
				</div>
			</div>
			
			<button type="button"  id="btn_add">작성</button>
		</div>









		<div>
			<div id="guest"></div>
		</div>
		<hr>

		<a>${maker}</a>
		<div id="paging">
			<ul class="pager">
				<c:if test="${maker.hasPrev }">
					<li value=""><a class="pagebtn"
						href="${maker.startPageNo - 1 }">◀</a></li>
				</c:if>
				<c:forEach begin="${maker.startPageNo }" end="${maker.endPageNo }"
					var="num">
					<li><a class="pagebtn">${num }</a></li>
				</c:forEach>
				<c:if test="${maker.hasNext }">
					<li><a class="pagebtn" href="${maker.endPageNo + 1 }">▶</a></li>
				</c:if>
			</ul>
		</div>

	</div>
	<!-- end ntBoardList -->









	<!-- scroll  -->
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ script! ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->

	<script type="text/javascript">
	
	
	
	$(document).ready(function(){
		 $("#paging").on("click", ".pagebtn", function() {
			var page = $(this).text();
			console.log(page);	
			 getAllReplies(page);
		 });
		
	
	  var loginId = "${loginId}"; // 내 DB테이블 게시판 번호 값
	  var g_content = $('#g_content').val();
	 
	  var home_id = "test";
	  
	
	  
	  $('#btn_add').click(function(){
		  
		  var g_secret ; 
		  var g_content = $('#g_content').val();
		  if($("#g_secret").is(":checked") == true){
			  g_secret = "Y";
		  }else{
			  g_secret = "N";
		  }
		
		 console.log("check여부 "+g_secret);
		 console.log("content"+g_content);
	  	  	// 댓글 아이디, 댓글 내용의 값을 가져와서
	  	  	// get 방식으로 전송
	  	  	// url : 'localhost:8080/Web10_MVC/replies/add'
	  	  	// data : 게시판 번호, 댓글 내용, 댓글 아이디
	  	  	var content = $('#g_content').val(); // 댓글 내용 값
	  	  /*  var secret =$('#g_secret').val(); */
	  	   
	  	   var obj = {
	  			  'userid' :loginId,
	  	  	  	'g_secret':g_secret,
	  	  		'g_content' : g_content,
	  	  		'loginId' : loginId
	  	  		
	  	  		// 홈아이디 추가 
	  	  	}; // end var obj
	  	  	
	  	  	// $.ajax로 송신
	  	  	$.ajax({
	  	  	  type : 'post',
	  	  	  url : '/helloworld/world',
	  	  	  headers : {
	  	  	    'Content-Type' : 'application/json',
	  	  	    'X-HTTP-Method-Override' : 'POST'
	  	  	  },
	  	  	  data : JSON.stringify(obj),
	  	  	  success : function(result){
	  	  	    console.log(result);
	  	  	    if (result == 1){
	  	  	      alert('방명록 작성 성공 ');
	  	  	      $('#g_content').val(''); // 성공메시지 이후 삽입했던 content 데이터 삭제
	  	  	  
	  	  	      getAllReplies(); // 메소드 호출
	  	  	    } // end if()
	  	  	  } // end success
	  	  	}); // end ajax()
	  	  }); // end btn_add.click()
	  
	  	 getAllReplies(); // 메소드 호출
	  	 //TODO
	  	 function getAllReplies(page) {
	  		
	  		 console.log(loginId);
	  		console.log("getAllReplies"+page);
			 if (page == undefined){
				 page = 1;
			 }
	  		 var url = '/helloworld/world/all/'+home_id+'/'+page; // 절대경로사용할때 이렇게!
	   	  	$.getJSON(
	   	  		url,
	   	  		function(jsonData){
	   	  		  console.log(jsonData);
	   	  		  var list = ''; // JSON 데이터에서 테이터를 꺼내 태그 + 데이터 형식으로 저장할 변수
	   	  		  $(jsonData).each( // jsonData를 사용하는 each 반복문
	   	  		    function(){
	   	  		  	var date = new Date(this.g_date); //this : jsonData
	   	  		  	var photourl = this.user_photo;
 	   	  		  	console.log("댓글 번호 : " + this.g_bno); 
	   	  		  	list += '<div class="guestboard">'
	   	  		  		+'<pre>'
	   	  		  		+'<div style="float: left;">'
						+'NO.<a id="g_bno">'+this.g_bno  +'</a>' +'&nbsp;&nbsp;'
						
						
						+this.userid +'&nbsp;&nbsp;'+date+'&nbsp;&nbsp;'
						if(loginId == this.userid){
							list +='<button id="delect">삭제</button>'
						}// end if
						
							console.log("저장 경로"+this.user_photo);
						
						list +='<div class="contentandphoto">'
						
						if (this.user_photo != null ){ 
							list += '<div class="img_wrap" ><img id="img" src="displayFile?fileName=/'+photourl+'"/> </div>'
						}else {
							list += '<div class="img_wrap"> <img id="img" src="displayFile?fileName=/notphoto.png"> </div>'
						}
						
					
						
						if(this.g_secret == "Y"){
							if (this.userid == loginId){
								list +='<br><input class="content1" style="width: 400px; height: 100px;" placeholder="'+ this.g_content+'" readonly /><br>'								
								
							}else{
								
								list +='<br><input class="content1" style="width: 400px; height: 100px;" placeholder="비밀글 입니다" readonly /><br>'
							}
								
						}else if (this.g_secret == "N"){
							list +='<br><input class="content1" style="width: 400px; height: 100px;" placeholder="'+ this.g_content+'" readonly /><br>'
						}
					
				
						
						if(loginId == this.userid){
						list +='<button class="btnupdate" style="float: right;" type="button">수정하기</button>'
						}
					
						list+='<br><br><hr>'
						
						+'<input type="text" style="width:400px ; height:22px;" class = "guestreply">'         // 게시글이 있을때 숨기기 
						+'<button class="reply" >확인 </button><br>'	
						+'</div>'
						if(this.g_reply != null){
							list +=this.g_reply 
						}		
						list +='</div>'             //+this.g_bno +this.userid+'<br>'
						+ '</pre>' 
	   	  		  		+ '</div>';
	   	  		  		
	   	  		  	
	   	  		  	console.log(this.TotalCount);
	   	  		  }); // end each()
	   	  		  $('#guest').html(list);
	   	  		} // end callback()
	   	  	); // end getJSON()
	   	  } // end getAllReplies()
	  	  
	   	  
	   	$("#guest").on("click", ".guestboard .btnupdate ", function() {

			$(this).html('저장하기');
			$(this).attr("class", "saveupdate");
			$(this).prevAll(".content1").removeAttr('readonly');
			console.log("${vo.userid }");

		});

		$("#guest").on("click", ".guestboard #delect", function() {
			console.log(this);
			var g_bno = $('#g_bno').text();

			console.log(g_bno);
			$.ajax({
				 type : 'delete',
				 url : '/helloworld/world/'+g_bno,
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				data : JSON.stringify({
		  	  	    'g_bno' : g_bno
		  	  	  }), 
		  	      success : function(result){
		  	        if(result == 'success'){
		  	          alert('댓글 삭제성공')
		  	          getAllReplies();
		  	        } // end if()
		  	      }// end success()
		  	      
		  	    }); // end ajax()
		  	  }); // end btn_delte.click()

		$("#guest").on("click", ".guestboard .saveupdate", function() {
			console.log("세이브 체크");
			var g_bno = $('#g_bno').text();
			var g_content = $('.content1').val();
			 
			console.log(this);
			console.log(g_bno);
			console.log(g_content);
			//ajax
			$.ajax({
				url : '/helloworld/world/'+g_bno,
				type : 'put',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
				data : JSON.stringify({
						'g_content' : g_content
				}),
				success : function(result){
		  	        if(result == 'success'){
		  	          alert('댓글 수정성공')
		  	          
		  	          getAllReplies();
		  	        } // end if()
		  	      }// end success()

			});
			var target = encodeURI('/helloworld/world/guestboard');
			/* console.log(target);
			location = target; */
		}); //saveupdate click end
		$("#guest").on("click", ".guestboard .reply", function() {
			var g_reply =$(".guestreply").val();
			var g_bno = $('#g_bno').text();
			console.log(g_reply);
			console.log(g_bno);
			$.ajax({
				url : '/helloworld/world/reply/'+g_bno,
				type : 'put',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
				data : JSON.stringify({
						'g_reply' : g_reply,
						'g_bno' : g_bno
				}),
				success : function(result){
		  	        if(result == 'success'){
		  	          alert('댓글 수정성공')		  	          
		  	          getAllReplies();
		  	        } // end if()
		  	      }// end success()
			});	
		});
	});// (document).ready end 
	
	</script>



</body>
</html> --%>