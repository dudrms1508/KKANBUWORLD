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
<title>일촌 신청 팝업</title>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

<style>
	*{
	  margin:0;
	  padding:0;
	  box-sizing: border-box;
	}
	
	p{
	  margin-top:10px;
	}
	.container{
	  width:100%;
	}
	.modal-btn-box{
	  width:100%;
	  text-align:center;
	  margin-top: 10px;
	}
	.modal-btn-box button{
	  display:inline-block;
	  width:100px;
	  height:30px;
	  background-color:#ffffff;
	  border:1px solid #e1e1e1;
	  cursor:pointer;
	  padding:1px;
	}
	.popup{
	  width:100%;
	  max-width:400px;
	  background-color:#ffffff;
	  border-radius:10px;
	  overflow:hidden;
	  background-color:rgb(243, 156, 18);
	  box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
	}
	.popup-head{
	  width:100%;
	  height:50px;
	  display:flex;
	  align-items:center;
	  justify-content:center;
	    padding:15px;
	}
	
	.head-title {
	    font-size: 20px;
	    font-style: italic;
	    font-weight: 700;
	    letter-spacing: -3px;
	    text-align: center;
	}
	.popup-body{
	  width:100%;
	  background-color:#ffffff;
	}
	.body-content{
	  width:100%;
	  padding:30px;
	}
	.body-titlebox{
	  text-align:center;
	  width:100%;
	  height:40px;
	  margin-bottom:10px;
	}
	
	.body-contentbox{
	  border:0.5px solid #ddd;
	  word-break:break-word;
	  overflow-y:auto;
	  min-height:100px;
	  max-height:300px;
	}
	
	.popup-foot{
	  width:100%;
	  height:50px;
	  background-color:rgb(243, 156, 18);
	}
	.pop-btn{
	  display:inline-flex;
	  width:50%;
	  height:100%;
	  float:left;
	  justify-content:center;
	  align-items:center;
	  color:#ffffff;
	  cursor:pointer;
	  background-color:rgb(243, 156, 18);
	  border:0.5px solid #ddd;
	}
	.pop-btn.confirm{
	  order-right:1px solid rgb(243, 156, 18);
	}
	
	.modal-btn-box input{
	  display:inline-block;
	  width:100px;
	  height:30px;
	  background-color:#ffffff;
	  border:1px solid #e1e1e1;
	  cursor:pointer;
	  padding:1px;
	}
	
	.popup-wrap{
	  width:400px;
	}
	.popup-wrap{
	  justify-content:center;
	  align-items:center;
	  position:fixed;
	  top:0;
	  left:0;
	  right:0;
	  bottom:0;        
	 }
	
</style>

</head>
<body>
<!-- 신청 팝업 -->
	
<div class="popup-wrap">
	<div id="requestIlchon-container">
		<form id="my-form" action="${ path }/webpage/message/sendMessage" method="POST">
		<%-- <input type="hidden" name="receiver" value="${ member.no }"> --%>
		<input type="hidden" name="ilchonNo" value="${ ilchon.ilchonNo }">
		
		<div class="popup">
		    <div class="popup-head">
		        <span class="head-title"><h2>다정한 쪽지</h2></span>
		    </div>
		    
		    <div class="popup-body">
				<div class="body-content">
				<section>
					<label for="userNo">
					<h3>보낸이 
				    	<input type="text" name="userNo" id="userNo" value="${loginMember.name}" style="font-size:15px; width:255px; min-height:30px; border:0px #ddd; background-color:white;" disabled/>
					</h3>
					</label>
					<label for="ilchonNo">
					<h3>받는이 
				    	<input type="text" name="ilchonNo" id="ilchonNo" value="${ilchon.member.name}" style="font-size:15px; width:255px; min-height:30px; border:0px #ddd; background-color:white;" disabled/>
					</h3>
					</label>
				    <br>
				
				    <label for="messageTitle">제목</label>
				    <input type="text" name="messageTitle" id="messageTitle" style="width:340px; min-height:30px; border:0.5px solid #ddd;" placeholder="쪽지 제목을 입력하세요." required/>
				   	<br><br>
				    
				    <label for="messageContnet">내용</label>
				    <input type="text" name="messageContnet" id="messageContnet" class="body-contentbox" style="width:340px; min-height:100px; resize: none; border:0.5px solid #ddd;" maxlength="200" name="content" id="replyContent" placeholder="쪽지 내용을 입력하세요." required>
				</section>
				</div>
			</div>
			
			<div class="popup-foot">
				<input onclick="closePopup(event);" id="confirm" class="pop-btn confirm" type="submit"  value="전송">
				<!-- <input onclick="closePopup();" id="confirm" class="pop-btn confirm" type="submit"  value="전송"> -->
		      <!-- 	<input onclick="self.close();" id="confirm" class="pop-btn confirm" type="submit"  value="전송"> -->
		     	<input id="close" class="pop-btn close" type="button" value="취소" onclick="self.close();">
		     </div>
		</div>
		</form>
	</div>
</div>


<!-- <script>
	function closePopup() {
	  window.opener.location.href = "${ path }/webpage/message/sent";
	  window.close();
	  alert('보낸 편지함으로 이동하겠습니다.');
	}
</script> -->

<script>
  function closePopup(event) {
    event.preventDefault(); // 폼 전송을 막음
    var form = document.getElementById('my-form');
    /* var url = "${path}/webpage/message/sent"; */
    form.submit(); // 폼 데이터 전송
    
    popup.onload = function() {
      /* popup.opener.location.href = url; */
      window.close();
    }
  }
</script>


</body>
</html>