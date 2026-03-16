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
		<form action="${ path }/webpage/ilchon/acceptModal" method="POST">
			<input type="hidden" name="requestNo" value="${ request.requestNo }">
			<input type="hidden" name="sender" value="${ request.sender }">
			<input type="hidden" name="receiver" value="${ request.receiver }">
		<div class="popup">
		    <div class="popup-head">
		        <span class="head-title"><h2>일촌 신청 해요!</h2></span>
		    </div>
		    
		    <div class="popup-body">
				<div class="body-content">
				<section>
					<label for="sender">
					<h3>From.</label>
				    	<input type="text" name="sender" id="sender" value="${request.member.name}" style="width:255px; min-height:30px; border:0px #ddd; background-color:white;" disabled/>
				    </h3>
				    <br>
				    <label for="requestTitle">친구가 정한 일촌명</label>
				    <input type="text" name="ilchonNick" id="ilchonNick" value="${request.ilchonNick}" style="width:340px; min-height:30px; border:0.5px solid #ddd;" disabled/>
				   	<br><br>
				
				    <label for="requestTitle">신청 제목</label>
				    <input type="text" name="requestTitle" id="requestTitle" value="${request.requestTitle}" style="width:340px; min-height:30px; border:0.5px solid #ddd;" placeholder="제목을 입력하세요." disabled/>
				   	<br><br>
				    
				    <label for="requestContent">신청 내용</label>
				    <input type="text" name="requestContent" id="messageContent" value="${request.requestContent}" class="body-contentbox" style="width:340px; min-height:100px; resize: none; border:0.5px solid #ddd;" maxlength="200" name="content" id="replyContent" placeholder="신청 내용을 입력하세요." disabled>
				</section>
				</div>
			</div>
			
			<div class="popup-foot">
		      	<input onclick="location.href='${ path }/webpage/ilchon/ilchonList'" id="confirm" class="pop-btn confirm" type="submit" value="수락">
		     	<input id="close" class="pop-btn close" type="button" value="나중에" onclick="self.close();">
		     	<input type="hidden" name="requestNo" value="${ request.requestNo }">
		     </div>
		</div>
		</form>
	</div>
</div>

<script>
	function updateRequestStatus() {
	    $.ajax({
	        url: '${path}/webpage/ilchon/updateRequestStatus',
	        type: 'POST',
	        data: {
	            requestNo: ${request.requestNo}
	        },
	        success: function(result) {
	            console.log(result);
	        },
	        error: function(error) {
	            console.log(error);
	        }
	    });
	}
	
	$(document).ready(function() {
	    $('#confirm').click(function() {
	        updateRequestStatus();
	    });
	});
</script>



</body>
</html>