<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ path }/resources/css/minihome.css">
<link rel="stylesheet"
  href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${mainformVO.theme == 'default' }">
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/defaultbackground.jpg');">
</c:if>
<c:if test="${mainformVO.theme == 'spring' }">
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/springbackground.jpg');">
</c:if>
<c:if test="${mainformVO.theme == 'summer' }">
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/summerbackground.jpg');">
</c:if>
<c:if test="${mainformVO.theme == 'fall' }">
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/fallbackground.jpg');">
</c:if>
<c:if test="${mainformVO.theme == 'winter' }">
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/winterbackground.jpg');">
</c:if>

<div id = "left_side">
		<div id = "left_side_upper">
			<div id = "visitWrapper">
			<label class = "lblVisitCnt">TODAY </label><a id = "todayCnt">&nbsp;${mainformVO.today_cnt }&nbsp;</a> 
			<label class = "lblVisitCnt">|&nbsp;&nbsp;TOTAL </label><a>&nbsp;${mainformVO.total_cnt }</a>
			</div>
		</div>
		
		<!-- 홈 & 방명록 기본틀 -->
		<div id = "left_side_down">
     	<!-- ====================다이어리========================== -->
          <div class = "left_side_down on" id = "drBoardFolderList" >
             <label class = "lblBoard">DIARY</label>
             
             <hr>
                <div id="datepicker"></div>
                <form id="pickDate" style="display: none">
                  <input type="hidden" id="sendDate" name="d_date">
                </form>
             
               <a href = "">전체보기</a><br>
               <c:forEach var = "folder" items="${drFolderList}">
                 <ol>
                  <li><a href = "${folder }">${folder }</a>
                  </ol>
                </c:forEach>
            <form id = "selectByFolder" style="display: none;">
              <input type = "text" name = "userid" value = "test">
              <input type = "text" name = "folder">
            </form>  
            
         </div>
     
 		 <div class = "left_side_down" id = "MngFolderList" ><!-- board-folderList -->
		 	<label class = "lblBoard">폴더 편집하기</label>
			<hr>		
 		 	 <ol>
 				<li><a href = "#" onclick="DRFmanager('${homeId}')">다이어리</a>
 				<li><a href = "#" onclick="NTFmanager('${homeId}')">게시판</a>
 				<li><a href = "#" onclick="GLFmanager('${homeId}')">사진첩</a>		
 		 	 </ol>	
 		 	 
 		 	 <button id = "homepageReload">홈으로</button>
 		 </div>
		</div>
	</div>
	

	<!-- right_side -->
	<div id = "right_side"> 
	  <div id = "right_side_upper">
	  	<div id = "titleWrapper">
	  		<a id = "aTitle">${mainformVO.main_title }</a>
	  		<c:if test="${homeId == loginId }">
	  		 <button id = "btnTitleUpdate">수정</button>
	  		 </c:if>
	  	</div>
	  	
	  </div>
	  <div id = "right_side_down">
		<iframe id = "minihome_content" src = "${path}/minihome/diaryView/${minihomeNo}">
		</iframe>
	  </div>	
		<div id = "btnWrapper">
         	<button class = "tap_button" id = "home">홈</button>
         	<button class = "tap_button on" id = "dr">다이어리</button>
         	<button class = "tap_button" id = "nt">게시판</button>
         	<button class = "tap_button" id = "gl">사진첩</button>
         	<button class = "tap_button" id = "gb">방명록</button>
         	<button class = "tap_button" id = "mn">관리</button>
      </div>
	</div>
	


<script type="text/javascript">
$(document).ready(function(){
	
	
	 $('#dr').click(function(){
	        $('.tap_button.on').removeClass('on');
	        $(this).addClass('on');
	        $('.left_side_down.on').removeClass('on');
	        $('#main_left_side').addClass('on');
	        if(theme == 'default'){
	            $(".tap_button").css('background-color', '#4582b4');
	        }else if(theme == "spring"){
	            $(".tap_button").css('background-color', '#ff9999');
	        }else if(theme == "summer"){
	            $(".tap_button").css('background-color', '#1034a6');
	        }else if(theme == "fall"){
	            $(".tap_button").css('background-color', '#ff7f00');
	        }else if(theme == "winter"){
	            $(".tap_button").css('background-color', '#5f5f5f');
	        }
	        $(".tap_button.on").css('background-color', 'white');	
	    });
	    
	    $("#selectFrd").change(function(){
	        var userid = $(this).val();
	        console.log('ets' + userid);
	        if(userid == ''){
	            return;
	        }   
	    location.href = "mini-home-page?homeId=" + userid;
	    });
	
	
	    // datepicker 동작 부분
		$("#datepicker").datepicker({
		  firstDay : 0,
		  showMonthAfterYear: true,
		  yearSuffix: "년",
		  monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showOn: 'button',
				  dateFormat: 'yy-mm-dd',
		  onSelect : function(dateText, inst){
		  var pickDate = dateText; // 현재 선택한 날짜
		  console.log(pickDate);
		
	      	  var pd = $('#pickDate'); // form의 정보를 pd에 저장
	    	      var sendDate = $('#sendDate'); // 값을 보내줄 input 의 id (sendDate) 로 변수 만들어줌
	    	     
	    	      $('#minihome_content').attr('src', "/minihome/diary/diaryView?d_date="+pickDate);
	
		} // end onSelect
		}); // end $("#datepicker") 
		
		$("#datepicker").css({"font-size":"11px","width":"200px"});
	});

</script>


</body>
</html>