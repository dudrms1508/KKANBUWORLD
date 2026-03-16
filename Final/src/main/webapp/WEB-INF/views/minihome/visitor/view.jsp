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
<title>미니홈피</title>
</head>
<body>
	<div id = "left_side">
		<div id = "left_side_upper">
			<div id = "visitWrapper">
                <label class = "lblVisitCnt">TODAY </label><a id = "todayCnt">&nbsp;투데이 나오기&nbsp;</a> 
                <label class = "lblVisitCnt">|&nbsp;&nbsp;TOTAL </label><a>&nbsp;토탈 나오기</a>
			</div>
		</div>
		<!-- 홈 & 방명록 기본틀 -->
		<div id = "left_side_down">
            <div class = "left_side_down on" id = "main_left_side">
                <div id = "profilePhotoWrapper">
                    <c:if test = "${mainformVO.profile_photo != null }"> 
                        <img id = "mainImg" src = "display?fileName=${mainformVO.profile_photo}" style = "width :180px; height: 200px;" >
                    </c:if>
                </div>
                <div id = "profileWrapper" style = "overflow-y: auto; white-space: normal;">
                    <pre >${mainformVO.profile_content }</pre>
                    <div style="position: absolute; bottom: 0px;"></div>
                </div>
                <c:if test="${homeId == loginId }">
                <a id = "btnEdit">▶EDIT</a> <a id = "btnImg">▶PHOTO</a> 
                </c:if>
                <div id = "wavingWrapper">
                    <label id = "lblHomeName">${homeName }</label> 
                    <c:if test = "${memberVO.user_gender == 'W' }">
                    (<img src = "${pageContext.request.contextPath}/resources/images/woman.PNG" width = "15px;"height="15px;">)
                    </c:if>
                    <c:if test = "${memberVO.user_gender == 'M' }">
                    (<img src = "${pageContext.request.contextPath}/resources/images/man.PNG" width = "15px;"height="15px;">)
                    </c:if>
                    <label style = "font-size: 12px; color: black"> ${memberVO.user_birth } </label>
                    <br><br>
                    <select id = "selectFrd">
                        <option>파도타기</option>
                        <c:forEach var="frVO" items="${frList }">
                                <option value = ${frVO.fr_id }>${frVO.fr_user_name }(${frVO.nickname })</option>
                        </c:forEach>
                    </select>
                </div>
            <!-- left_side_down on 끝 -->
            </div>
        <!-- left_side_down 끝 -->
		</div>
    <!-- left_side 끝 -->
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
        <!-- iframe -->
        <div id = "right_side_down">
            <iframe id = "minihome_content" src = "${path}/minihome/visitor/write/${ minihomeNo }">
            </iframe>
        </div>	
		<div id = "btnWrapper">
            <button class = "tap_button" id = "home">홈</button>
            <button class = "tap_button" id = "dr">다이어리</button>
            <button class = "tap_button" id = "nt">게시판</button>
            <button class = "tap_button" id = "gl">사진첩</button>
            <button class = "tap_button on" id = "gb">방명록</button>
            <button class = "tap_button" id = "mn">관리</button>
        </div>
	</div>

<script type="text/javascript">


$(document).ready(function(){
        
    $('#gb').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#main_left_side').addClass('on');
/*         $('#minihome_content').attr('src', "/helloworld/frcboard/frcList"); */
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

});
</script>



</body>
</html>