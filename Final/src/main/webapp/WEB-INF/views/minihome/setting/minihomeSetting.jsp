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
<c:if test="${minihomeVo.theme == 'NONE' }">
	<body style="background-image: url('${path}/resources/image/shop/defaultbackground.jpg');">
	</c:if>
	<c:if test="${minihomeVo.theme == '봄' }">
	<body style="background-image: url('${path}/resources/image/shop/springbackground.jpg');">
	</c:if>
	<c:if test="${minihomeVo.theme == '여름' }">
	<body style="background-image: url('${path}/resources/image/shop/summerbackground.jpg');">
	</c:if>
	<c:if test="${minihomeVo.theme == '가을' }">
	<body style="background-image: url('${path}/resources/image/shop/fallbackground.jpg');">
	</c:if>
	<c:if test="${minihomeVo.theme == '겨울' }">
	<body style="background-image: url('${path}/resources/image/shop/winterbackground.jpg');">
	</c:if>

<body>
	<div id = "left_side">
		<div id = "left_side_upper">
			<div id = "visitWrapper">
                <label class = "lblVisitCnt">TODAY </label><a id = "todayCnt">&nbsp;투데이&nbsp;</a> 
                <label class = "lblVisitCnt">|&nbsp;&nbsp;TOTAL </label><a>&nbsp;토탈</a>
			</div>
		</div>
		<!-- 홈 & 방명록 기본틀 -->
		<div id = "left_side_down">
            <div class = "left_side_down on" id = "main_left_side">
            <!-- left_side_down on 끝 -->
                <div id="modify">
                    <span>정보수정</span>
                </div>
                <div id="modifyMenu">
                    <table>
                        <tr>
                            <td>
                                <a id="mbti">MBTI 설정</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a id="show">기본 설정</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="myBgm">
                <span>BGM 설정</span>
            </div>
            <div id="myBgmMenu">
                <table>
                    <tr>
                        <td>
                            <a id="bgm">내가 가진 음악</a>
                        </td>
                    </tr>
                </table>
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
            <iframe id = "minihome_content" src = "${path}/minihome/settingTabView/${minihomeNo}">
            </iframe>
        </div>	
		<div id = "btnWrapper">
            <button class = "tap_button on" id = "home">홈</button>
            <button class = "tap_button" id = "dr">다이어리</button>
            <button class = "tap_button" id = "nt">게시판</button>
            <button class = "tap_button" id = "gl">사진첩</button>
            <button class = "tap_button" id = "gb">방명록</button>
            <button class = "tap_button" id = "mn" onclick="location.href='${ path }/minihomeSetting/${ minihomeNo }'">관리</button>
        </div>
	</div>

<script type="text/javascript">

$(document).ready(function(){
        
    $('#home').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#main_left_side').addClass('on');
        $('#minihome_content').attr('src', "${path}/minihome/minihomeMain/${minihomeNo}");
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
    
    $('#mbti').click(function(){
    	$('#minihome_content').attr('src', "${path}/minihome/settingTabView/${minihomeNo}");
    });
    
    $('#show').click(function(){
    	$('#minihome_content').attr('src', "${path}/minihome/settingTab2View/${minihomeNo}");
    });
	
    $('#bgm').click(function(){
    	$('#minihome_content').attr('src', "${path}/minihome/settingTab3View/${minihomeNo}");
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