<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.pp{
	margin : 5px 0px;
}

.pb{
	font-size: 120%;
	font-weight: bold;
}


.lblmemberName{
	float: left;
	font-size: 150%;
	font-weight: bold;
	margin: 25px 20px;
}



.imgBtn{
	margin-right: 10px;
}

#mainpageMain{
	width: 500px;
	height: 100%;
	margin: 30px auto;
	
	text-align: center;
}



#btnSearch{
	border-style: none;
	position: relative;
	float: right;
	margin : 5px 5px;
}
#btnApplyFrd{
	font-size: 110%;
	background-color: white;
	width : 100px;
	color :#ff6f6b;
	float : left;
	margin-top:5px;
	margin-right : 20px;
	border : 2px solid #ff6f6b;
	border-radius: 10px;
}
#btnUpdateFrd{
	font-size: 110%;
	background-color: white;
	width : 100px;
	color :#ff6f6b;
	float : left;
	margin-top:5px;
	margin-right : 20px;
	border : 2px solid #ff6f6b;
	border-radius: 10px;
}
#btntest{
	font-size: 110%;
	background-color: white;
	width : 100px;
	color :#ff6f6b;
	float:left;
	margin-top:5px;
	border : 2px solid #ff6f6b;
	border-radius: 10px;
}




#seachMainWrapper{
	width: 520px;
	padding: 8px;

}
#searchInputWrapper{
	width: 500px;
	height: 45px;
	background-color: white;
	border: 3px solid #ff6f6b;
	border-radius:10px;
	padding: 5px;
 	
}
#memberWrapper{
	width: 510px;
	height: 80px;
	border-radius: 40px;
	background-color: white;
	margin: 20px 4px;
	box-shadow: 3px 3px 3px grey;	
}
#memberBtnWrapper{
	width :120px;
	margin-top:4px;
	margin-right: 20px;
	float: right;
	
}
#pInfoWrapper{
	width: 100px;
	height: 60px;
	margin : 20px 5px;
	float: left;
}


#searchInput{
	width: 430px;
	height: 35px;
	border-style: none;
	position: relative;
	margin : 5px 5px;
	float: left;
}
#imgmemberProfile{
	float : left;
	margin: 4px 15px;
}


p{
	margin: 2px 20px 5px;
	color: grey;
	font-family: Batang;
}

body{
	height: 100%;
	background-color: #fafafa;
}
header{
  background-color: #ff6f6b;
  height: 90px;
  
}

button:hover {
	cursor: pointer;
}




#imgheaderlogo:hover{
	cursor: pointer;
}


</style>
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<%@ include file="/resources/import/subheader.jspf" %>

<body>
<!-- 친구 찾기 페이지 -->

<div id = "mainpageMain">
  <div id = "logoWrapper">
  	<img id = "imgheaderlogo" src="${pageContext.request.contextPath}/resources/images/logo2.png">
  </div>
  <h1>사람 찾기</h1>
  
  <div id = "seachMainWrapper">
  	<div id = "searchInputWrapper">
  		<input type = "text" id = "searchInput" placeholder="이름 또는 휴대전화 입력">
  		<button id = "btnSearch"><img  id = "imgMagnifier" src="${pageContext.request.contextPath}/resources/images/magnifier.png"></button>
  	</div>
  	
  	<c:forEach var="vo" items= "${memberList }">
  	<div id = "memberWrapper">
  		<img id = "imgmemberProfile" src="${pageContext.request.contextPath}/resources/images/tempProfile.png">
  		<label class = "lblmemberName">${vo.user_name }</label>
  	  <div id = "pInfoWrapper">
  		<p>${vo.user_birth }</p>
  		<p>${vo.user_state }</p>
  	  </div>	
  	  <div id = "memberBtnWrapper">
  	  <c:set var = "contain" value = "false"></c:set>
  	  <c:forEach var = "idList" items="${frIdList }">
  	  		<c:if test = "${idList == vo.userid }"><c:set var = "contain" value = "true"></c:set></c:if>
  	  </c:forEach>
  	  	<c:if test="${contain eq 'true' }">
  	  	<button id = "btnUpdateFrd" onclick="goToChangeNickFrd('${vo.userid}','${vo.user_name }')">일촌명 변경</button><Br>
  	  	</c:if>
  	  	<c:if test="${contain eq 'false' }">
  	    <button id = "btnApplyFrd" onclick="goToRequestFrd('${vo.userid}','${vo.user_name }')">일촌신청</button><Br>
  	    </c:if>
  	  	
  	  	<button id = "btntest" onclick="goHompie('${vo.userid}')">미니홈피</button>
  	  	
  	  </div>
  	  
  	  
  	</div><!-- end memberWrapper -->
  	</c:forEach>
  	
  	<form id = "frmRequestFrd" style="display: none">
  		<input name = "get_userid" >
  		<input name = "get_user_name" >  		
  	</form>
  	
  </div><!-- end SearchMainWrap -->	
  	
  </div>
  
  <form id = "frmGoHompie" action = "/helloworld/ntBoard/ntList" method="get">
	<input type = "text" name = "homeId" value="${loginId }" hidden="hidden">
</form>


<script type="text/javascript">

function goHompie(userid){
	window.open('/helloworld/world/mini-home-page?homeId=' + userid, 'title',
	'width=1200, height=720');
	
};

function goToRequestFrd(getId, getName){
	
	var child = "child";	
	var frm = $('#frmRequestFrd');
	frm.attr('target', child);	
	window.open("", child, "width=550px, height=480px");
	frm.find('[name="get_userid"]').val(getId);
	frm.find('[name="get_user_name"]').val(getName);
	frm.attr('action', "requestPage");
	frm.attr('method', 'get');		
	frm.submit();
	
};

function goToChangeNickFrd(getId, getName){
	
	var child = "child";	
	var frm = $('#frmRequestFrd');
	frm.attr('target', child);	
	window.open("", child, "width=550px, height=480px");
	frm.find('[name="get_userid"]').val(getId);
	frm.find('[name="get_user_name"]').val(getName);
	frm.attr('action', "requestChangePage");
	frm.attr('method', 'get');		
	frm.submit();
	
};


	$(document).ready(function(){
		
		
		$('#imgheaderlogo').click(function(){
			location.href = "/helloworld";
		});
		
		$('#btnRcmFrd').click(function(){
			location.href = "/helloworld/main/appliedFrd";
			
		});  
		
		$('#btnFriends').click(function(){
			location.href = "/helloworld/main/managingFrd";
			
		});
	
		
		
	});
	
</script>




</body>
</html>