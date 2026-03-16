<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.pb {
	font-size: 120%;
	font-weight: bold;
}

.lblFriendName {
	float: left;
	font-size: 150%;
	font-weight: bold;
	margin: 25px 25px;
	margin-right: 10px;
}

.dropdownMenuWrapper {
	width: 80px;
	height: 100px;
	position: absolute;
}

.btnMenu {
	width: 160px;
	height: 60px;
	margin-top: 10px;
	border-style: none;
	background: white;
	font-size: 140%;
}

#mainpageMain {
	width: 500px;
	height: 100%;
	margin: 30px auto;
	text-align: center;
}

#headerWrapper {
	width: 60%;
	margin: 0px auto;
}

#FriendBtnWrapper {
	width: 280px;
	height: 70px;
	float: left;
}

#btnLogout {
	font-size: 150%;
	background-color: #ff6f6b;
	color: white;
	float: right;
	margin: 30px;
	border: 2px solid white;
	border-radius: 10px;
}

#btnOpenMenu {
	border-style: none;
	background-color: #ff6f6b;
	position: absolute;
	margin: 15px 15px;
}

#btnSearch {
	border-style: none;
	position: relative;
	float: right;
	margin: 5px 5px;
	background-color: white;
}

#btnApplyFrd {
	font-size: 110%;
	background-color: white;
	width: 100px;
	color: #ff6f6b;
	float: right;
	margin-top: 5px;
	margin-right: 20px;
	border: 2px solid #ff6f6b;
	border-radius: 10px;
}

#btnUpdateFrd {
	font-size: 110%;
	background-color: #ff6f6b;
	width: 75px;
	height: 50px;
	color: white;
	float: left;
	margin-top: 15px;
	margin-left: 30px;
	margin-right: 10px;
	border: 2px solid #ff6f6b;
	border-radius: 10px;
}

#btntest {
	font-size: 100%;
	background-color: #ff6f6b;
	width: 75px;
	height: 50px;
	color: white;
	float: left;
	margin-top: 15px;
	margin-right: 10px;
	border: 2px solid #ff6f6b;
	border-radius: 10px;
}

#btnDeleteFrd {
	font-size: 110%;
	background-color: #ff6f6b;
	width: 75px;
	height: 50px;
	color: white;
	float: left;
	margin-top: 15px;
	border: 2px solid #ff6f6b;
	border-radius: 10px;
}

#menuBarWrapper {
	width: 200px;
	height: 360px;
	margin: 90px 0px;
	background-color: white;
	position: absolute;
	border-radius: 10px;
	box-shadow: 2px 2px 2px grey;
	padding: 10px;
	text-align: center;
	display: none;
}

#seachMainWrapper {
	width: 520px;
	padding: 8px;
}

#searchInputWrapper {
	width: 500px;
	height: 45px;
	background-color: white;
	border: 3px solid #ff6f6b;
	border-radius: 10px;
	padding: 5px;
}

#FriendWrapper {
	width: 510px;
	height: 80px;
	border-radius: 15px;
	background-color: white;
	margin: 20px 4px;
	box-shadow: 3px 3px 3px grey;
}

#pInfoWrapper {
	width: 120px;
	height: 60px;
	margin: 20px 5px;
	float: left;
}

#pWelecomeMsg {
	font-size: 150%;
	color: white;
	margin-top: 30px;
	padding: 30px;
}

#logoInHeader {
	float: left;
}

#searchInput {
	width: 430px;
	height: 35px;
	border-style: none;
	position: relative;
	margin: 5px 5px;
	float: left;
}

#imgmemberProfile {
	float: left;
	margin: 4px 15px;
}

p {
	margin: 8px 0px 5px;
	color: grey;
	font-size: 120%;
	font-family: Batang;
}

body {
	height: 100%;
	background-color: #fafafa;
}

button:hover {
	cursor: pointer;
}

.dropdownMenuWrapper:hover #menuBarWrapper {
	display: block;
}

.btnMenu:hover {
	color: red;
	border-bottom: 2px solid red;
}

#menuBarWrapper:hover {
	display: block;
}

#imgheaderlogo:hover {
	cursor: pointer;
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<%@ include file="/resources/import/subheader.jspf"%>

<body>
	<!-- 친구 찾기 페이지 -->

	<div id="mainpageMain">
		<div id="logoWrapper">
			<img id="imgheaderlogo"
				src="${pageContext.request.contextPath}/resources/images/logo2.png">
		</div>
		<h1>일촌 관리</h1>

		<div id="seachMainWrapper">
			<div id="searchInputWrapper">
				<input type="text" id="searchInput" placeholder="이름 입력">
				<button id="btnSearch">
					<img id="imgMagnifier"
						src="${pageContext.request.contextPath}/resources/images/magnifier.png">
				</button>
			</div>

			<c:forEach var="vo" items="${frList }">
				<div id="FriendWrapper">
					<label class="lblFriendName">${vo.fr_user_name }</label>
					<div id="pInfoWrapper">
						<p>(${vo.nickname })</p>
					</div>
					<div id="FriendBtnWrapper">
						<button id="btnUpdateFrd"
							onclick="goToChangeNickFrd('${vo.fr_id}','${vo.fr_user_name }')">일촌명
							변경</button>

					
			
						
						<button id="btntest"
							onclick="goHompie('${vo.fr_id}')">
							미니홈피
						</button>
						<button id="btnDeleteFrd"
							onclick="deleteFriend('${vo.userid }','${vo.fr_id}', '${vo.fr_user_name }')">
							일촌<br> 삭제
						</button>
					</div>


				</div>
				<!-- end memberWrapper -->
			</c:forEach>




			<form id="frmRequestFrd" style="display: none">
				<input name="get_userid"> <input name="get_user_name">
			</form>

		</div>
		<!-- end SearchMainWrap -->

	</div>

	<form id="frmGoHompie" action="/helloworld/world/mini-home-page" method="get">
		<input type="text" name="homeId" value="${loginId }" hidden="hidden">
	</form>


	<script type="text/javascript">
		
	
		function goHompie(userid) {
			console.log(userid);
			window.open('/helloworld/world/mini-home-page?homeId=' + userid, 'title',
			'width=1200, height=720');
					
		};

		function goToChangeNickFrd(getId, getName) {
			console.log(getName);
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

		function deleteFriend(userid, fr_id, fr_name) {

			var cResult = confirm('정말로 ' + fr_name + '님과 일촌을 끊으시겠습니까?');

			if (cResult) {

				var obj = {
					'userid' : userid,
					'fr_id' : fr_id
				}

				$.ajax({
					type : 'delete',
					url : '/helloworld/friend/deleteFriend',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					data : JSON.stringify(obj), // 자바스크립트의 값을 JSON 문자열로 변환
					success : function(result) {
						if (result == 1) {
							alert('이제 더 이상 ' + fr_name + '님과 일촌이 아닙니다');
							window.location.reload();
						}

					}
				});//end ajax
				window.location.reload();

			}

		}//end delteFriend
	</script>




</body>
</html>