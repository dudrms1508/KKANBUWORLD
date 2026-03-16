<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="${ path }/resources/js/jquery-3.6.3.js"></script>
	<title>일촌 신청 - 받은 편지함</title>
	
	<link rel="stylesheet" href="${ path }/resources/css/header.css">
	<link rel="stylesheet" href="${ path }/resources/css/footer.css">

<style>
		div,ul,li{margin:0; padding:0;}
        ul,li {list-style:none;}
        .tab{float:left; width:1100px; height:auto;}
        .tabnav{font-size:0; width:1100px; border:1px solid #ddd;}
        .tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
        .tabnav li div:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
        .tabnav li div.active:before{background:rgb(243, 156, 18);}
        .tabnav li div.active{border-bottom:1px solid #fff;}
        .tabnav li div{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
        .tabnav li div:hover,
        .tabnav li div.active{background:#fff; color:rgb(243, 156, 18); }
        
        
        .tabcontent{padding: 20px; border:1px solid #ddd; border-top:none;}
        .searchContent{display: flex; width: 1000px; padding: 0px; border:1px solid #ddd; margin-left: auto; margin-right: auto;}
	
	.tab{
	    width: 1100px;
        margin-left: auto;
        margin-right: auto;
       justify-content: center;
	}
	
	
	/* 버튼 스타일 */
	.modal-btn-box{
	  width:100%;
	  text-align:center;
	  margin-top: 10px;
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
	
	.modal-btn-box input #already-ilchon {
	  display:inline-block;
	  width:100px;
	  height:30px;
	  background-color: red;
	  border:1px solid #e1e1e1;
	  cursor:pointer;
	  padding:1px;
	}
	



        /* skin */
        .ilchon-list{
        width: 1000px;
        margin-left: auto;
        margin-right: auto;

        }
        
        .ilchons h3{
        font-size: 24px;
        color: #545454;
        margin-top:60px;
        margin-bottom: 60px;
        text-align: center;
        }

        .ilchon{
        display: block;
        width: 200px;
        text-align: center;
        text-decoration:none;
        color: black;
        float:left;
        margin-left: 30px;
        margin-right: 10px;
        margin-bottom: 30px;
        }

        .ilchon-name{
        margin-top: 20px;
        margin-bottom: 4px;
        }

        .ilchon-nick{
        color: #545454;
        font-size: 10px;
        }
        
        .clearfix{
        clear: both;
        }
        
        /* 서치 영역 */
        .searchList{
        width: 1000px;
        margin-left: auto;
        margin-right: auto;
    }

    .search-box {
    	width: 400px;
        padding: 10px;
       
	}

    .search-btn {
        color: #EDEDED;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgb(243, 156, 18);
        /* display: flex; */
        align-items: center;
        justify-content: center;
    }


	/* 팝업 */
	.popup-wrap{
	  background-color:rgba(0,0,0,.3); 
	  justify-content:center; 
	  align-items:center;  
	  position:fixed;  
	  top:0;
	  left:0;
	  right:0;
	  bottom:0;      
	  display:none; 
	  padding:15px; 
	}
	
	.popup{
	  width:100%;              
	  max-width:400px;         
	  border-radius:10px;      
	  overflow:hidden;        
	  background-color:#264db5;
	  box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3); 
	}
	
	.popup-head{
	  width:100%;
	  height:50px;
	  display:flex;
	  align-items:center;
	  justify-content:center;
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
	  word-break:break-word;    
	  overflow-y:auto;         
	  min-height:100px;        
	  max-height:200px;       
	}
	
	.popup-foot{                 
	  width:100%;
	  height:50px;
	}
	.pop-btn{
	  display:inline-flex;         
	  width:50%;                   
	  height:100%;                 
	  justify-content:center;      
	  align-items:center;         
	  float:left;                 
	  color:#ffffff;              
	  cursor:pointer;              
	}
	.pop-btn.confirm{                
	  border-right:1px solid #3b5fbf;
	}
	
	
	
	table.tabletype {
	  border-collapse: collapse;
	  text-align: left;
	  line-height: 1.5;
	
	}
	table.tabletype thead th {
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 3px solid #036;
	  background: #ffdab9;
	}
	
	table.tabletype tbody tr {
	  width: 150px;
	  padding: 10px;
	  /* font-weight: bold; */
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  
	}
	
	table.tabletype td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	border-bottom: 1px solid #ccc;
	}
	
	#wrapboxMother {
		display: flex;
		width: 1100px;
        margin-left: auto;
        margin-right: auto;
       justify-content: center;
	}
	
	#wrapbox {
	    margin-left: auto;
        margin-right: auto;
		justify-content: center;
	}
	
	#modal-open {
    /* position: relative; */
    bottom: 81px;
    right: 20px;
    font-size: 12px;
    padding: 3px;
    border: 1px solid rgb(245, 124, 77);
    background-color: transparent;
    color: #333;
    border-radius: 4px;
    cursor: pointer;
	}

</style>

</head>

<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<div id="wrapboxMother">
<h2>일촌 신청함</h2>
</div>


<br><br>

	<div id="wrapboxMother">
		<div id="wrapbox">
	    <div class="tab">
	        <ul class="tabnav">
	            <li><div onclick="location.href='${ path }/webpage/ilchon/inbox'" button style="border-bottom: 2px solid rgb(243, 156, 18); color: rgb(243, 156, 18); cursor: default;" disabled>받은 신청</div></li>
	            <li><div onclick="location.href='${ path }/webpage/ilchon/sent'">보낸 신청</div></li>
	        </ul>
	
				<div class="tabcontent">
					<div id="fromRequest">
					<form action="${ path }/webpage/ilchon/ilchonList" method="POST">
						<table class="tabletype" width="1050px">
						<thead>
							<tr>
								<th>No.</th>
								<th>보낸이</th>
								<th>받는이</th>
								<th>보낸 일촌명</th>
								<th>신청 제목</th>
								<th>보낸 날짜</th>
								<th>내용 보기</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="request" items="${request}">
							<tr>
								<td>${request.requestNo}</td>
								<td>${request.member.name}</td>
								<td>${loginMember.name}</td>
								<td>${request.ilchonNick}</td>
								<td>${request.requestTitle}</td>
								<td> <fmt:formatDate value="${request.requestDate}" pattern="yyyy-MM-dd hh:mm"/></td>
								<td>
									<c:forEach var="ilchon" items="${ilchons}">
										<c:if test="${ request.sender eq ilchon.ilchonNo }">
											<input value="이미 일촌" type="button" id="modal-open-already-ilchon" class="modal-open already-ilchon" disabled>
										</c:if>
									</c:forEach>
									<c:forEach var="requestExceptIlchons" items="${requestExceptIlchons}">
										<c:if test="${ request.sender eq requestExceptIlchons.sender }">
											<input value="내용" type="button" id="modal-open" class="modal-open" onclick="javascrit:window.open('${ path }/webpage/ilchon/acceptModal?no=${ request.requestNo }','popup_1','width=400px,height=500px,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,left=300px,top=100px')">
										</c:if>
									</c:forEach>
								</td>
							</tr>
						</c:forEach>
						</tbody>
						</table>
					</form>
					</div>
				</div>
			</div>
	    </div>
    </div>

    <script>
    $(function(){
		  $("#confirm").click(function(){
		      modalClose(); //모달 닫기 함수 호출
		      //컨펌 이벤트 처리 (나의 일촌으로 변경)
		      Success();
		  });
		  $("#cancle").click(function(){
		      modalClose(); //모달 닫기 함수 호출
		      //취소 이벤트 처리
		      
		  });
		  $(".modal-open").click(function(){        
		      $("#popup").css('display','flex').hide().fadeIn();
		      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
		  });
		  $("#close").click(function(){
		      modalClose(); //모달 닫기 함수 호출
		  });
		  
		  function modalClose(){
		      $("#popup").fadeOut(); //페이드아웃 효과
		  }
		  
		  function Success(){
		      $(".modal-open").css('background-color','rgb(243, 156, 18)');
		      $('.modal-open').html('<div class="icon-ok"></div> 나의 일촌');
		  }
		});
    </script>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	

</body>
</html>