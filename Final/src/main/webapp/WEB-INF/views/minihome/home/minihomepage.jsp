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
	<c:if test="${minihomeVo.theme == '겨울바람' }">
	<body style="background-image: url('${path}/resources/image/shop/겨울바람.jpg');">
	</c:if>
	<c:if test="${minihomeVo.theme == '봄비' }">
	<body style="background-image: url('${path}/resources/image/shop/봄비.PNG');">
	</c:if>
	<c:if test="${minihomeVo.theme == '소나무' }">
	<body style="background-image: url('${path}/resources/image/shop/소나무.png');">
	</c:if>
	<c:if test="${minihomeVo.theme == '연분홍' }">
	<body style="background-image: url('${path}/resources/image/shop/연분홍.jpg');">
	</c:if>
	<c:if test="${minihomeVo.theme == '폼폼푸린' }">
	<body style="background-image: url('${path}/resources/image/shop/폼폼푸린.jpg');">
	</c:if>
<body>
	<div id = "left_side">
		<div id = "left_side_upper">
			<div id = "visitWrapper">
                <label class = "lblVisitCnt">TODAY <span style="color: red">10</span></label><a id = "todayCnt">&nbsp;${ Member.no }&nbsp;</a> 
                <label class = "lblVisitCnt">|&nbsp;&nbsp;TOTAL <span style="color: red">1004</span></label><a>&nbsp;${ Member.no }</a>
			</div>
		</div>
		<!-- 홈 & 방명록 기본틀 -->
		<div id = "left_side_down">
            <div class = "left_side_down on" id = "main_left_side">
                <div id = "profilePhotoWrapper">
                        <img id = "mainImg" src="${ path }/${ minihomeVo.profile }" style = "width :180px; height: 200px;" >
                </div>
				
				<form id="introduce" action="">
                
                <!-- <div id = "profileWrapper" style = "overflow-y: auto; white-space: normal;"> -->
                <div id = "profileWrapper">
<%-- 	                    <pre >${mainformVO.profile_content }</pre> --%>
	                    <textarea id="intro" readonly>
	                    	${ minihomeVo.intro }
	                    </textarea>          
	                </div>
	                
	                
	                <!-- 자기소개 수정 버튼 -->
	                <c:if test="${homeId == loginId }">
                      <!-- <button id="btnEdit">▶ EDIT</button> <button id="btnImg">▶ DONE</button> -->
                      <!-- <a id = "btnEdit">▶ EDIT</a> <a id = "btnImg">▶ PHOTO</a> -->
                      <div>
                         <input type="button" value="▶ DONE" id="btnDone" onclick="toggleBtnEdit();">
                      </div>
                      <div>
                         <input type="button" value="▶ EDIT" id="btnEdit" onclick="toggleBtnDone();">
                      </div>
                   </c:if>
	                
                </form>
                
                <div id = "wavingWrapper">

                    <label id = "lblHomeName">${homeName }</label> 
                    <c:if test = "${memberVO.user_gender == 'W' }">
                    (<img src = "${pageContext.request.contextPath}/resources/images/woman.PNG" width = "15px;"height="15px;">)
                    </c:if>
                    <c:if test = "${memberVO.user_gender == 'M' }">
                    (<img src = "${pageContext.request.contextPath}/resources/images/man.PNG" width = "15px;"height="15px;">)
                    </c:if>
                    <label style = "font-size: 12px; color: black"> ${memberVO.user_birth } </label>
                    <strong style="color:skyblue">나의 MBTI는? </strong><span style="color: rgb(243, 156, 18);">${minihomeVo.mbti}</span>
                    
                    <select id = "selectFrd">
                        <option value="">파도타기</option>
                        <c:forEach var="ilchon" items="${ ilchonList }">
                           <option value ="${ ilchon.minihomeAdd.minihomeNo }" >${ ilchon.member.name }(${ ilchon.ilchonNick })</option>
                        </c:forEach>
                    </select>
                </div>
            <!-- left_side_down on 끝 -->
            </div>
            
            <!-- 다이어리 left_side -->
            <div class = "left_side_down" id = "drBoardFolderList" >
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
         
         <div class = "left_side_down" id = "ntBoardFolderList" ><!-- board-folderList -->
                <label class = "lblBoard">FREE BOARD</label>
                    <hr>
                    
			</div>
            
            <div class = "left_side_down" id = "glBoardFolderList" ><!-- board-folderList -->
		 			<label class = "lblBoard">PHOTO ALBUM</label>
				<hr>
	 			<%-- <c:forEach var = "folder" items="${glFolderList }">
	 		 	 <ol>
	 				<li><a href ="${ path }/minihome/photo/${minihomeNo}/folder?folderNo=0">${folder }</a>
	 		 	 </ol>
	 			</c:forEach> --%>
 		 	 <ol>
				<li><a href ="javascript:void(0);" onclick="folder();">전체 폴더</a>
 		 	 </ol>
 			<form id = "selectByFolder" style="display: none;">
 				<input type = "text" name = "userid" value = "test">
 				<input type = "text" name = "folder">
 			</form>	
 	
 			<button class = "btnMngFolder" onclick = "GLFmanager('${homeId}')">폴더 관리하기</button>
 		 </div>
 		 
 		 <!-- 방명록 -->
 		 <div class = "left_side_down" id = "visitorList" >
		 			<label class = "lblBoard">방명록</label>
				<hr>	 			
 		 </div>
     	
     		<!-- 관리쪽 left 메뉴 -->
		<div class = "left_side_down" id = "mnlist">
            	<!-- left_side_down on 끝 -->
                <div id="modify">
					<span>정보수정</span>
				</div>
				<div id="modifyMenu">
                    	<table>
                        	<tr>
                            	<td>
                                	<a id="show">기본 설정</a>
                            	</td>
                        	</tr>
                    	</table>
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
		</div>
		</div>
		
		
		
            
    <!-- left_side 끝 -->
	</div>
        <!-- left_side_down 끝 -->
		</div>
		

	</div>
	

	<!-- right_side -->
	<div id = "right_side"> 
        <div id = "right_side_upper">
        <div id = "titleWrapper">
        	<input id="minihomeTitleText" type="text" value="${ minihomeVo.title }" style="border: 0; background-color: transparent;" readonly>
			<c:if test="${homeId == loginId }">
					<button id = "btnTitleUpdate" onclick="editTitle();">수정</button>
					<button id = "btnTitleUpdateDone" onclick="editTitleDone();" style="display: none;">수정완료</button>
            </c:if>
        </div>
        <audio src="${path}/resources/image/shop/Stray kids - Back Door.mp3" controls autoplay ></audio>
        </div>
        <!-- iframe -->
        <div id = "right_side_down">
            <iframe id = "minihome_content" src = "${path}/minihome/minihomeMain/${minihomeNo}">

            </iframe>
        </div>	
		<div id = "btnWrapper">
            <button class = "tap_button on" id = "home">홈</button>
            <button class = "tap_button" id = "dr">다이어리</button>
            <button class = "tap_button" id = "nt">게시판</button>
            <button class = "tap_button" id = "gl">사진첩</button>
            <button class = "tap_button" id = "gb">방명록</button>
			<c:if test="${integer == loginMember.no}">
            <button class = "tap_button" id = "mn">관리</button>
            </c:if>
		</div>
	</div>

<script type="text/javascript">

$(document).ready(function(){
	
	var theme = '${minihomeVo.theme}';
	console.log(theme);
	if(theme == 'NONE'){
		   $(".tap_button").css('background-color', '#4582b4');
	   }else if(theme == "봄"){
		   $(".tap_button").css('background-color', '#ff9999');
	   }else if(theme == "여름"){
		   $(".tap_button").css('background-color', '#1034a6');
	   }else if(theme == "가을"){
		   $(".tap_button").css('background-color', '#ff7f00');
	   }else if(theme == "겨울"){
		   $(".tap_button").css('background-color', '#5f5f5f');
	   }else if(theme == "겨울바람"){
		   $(".tap_button").css('background-color', '#5f5f5f');
	   }else if(theme == "봄비"){
		   $(".tap_button").css('background-color', '#749000');
	   }else if(theme == "소나무"){
 		   $(".tap_button").css('background-color', '#A0D6DF');
 	   }else if(theme == "연분홍"){
		   $(".tap_button").css('background-color', '#dad4dd');
	   }else if(theme == "폼폼푸린"){
		   $(".tap_button").css('background-color', '#E1D881');
	   }
	   $(".tap_button.on").css('background-color', 'white');	
	
	   
    $('#home').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#main_left_side').addClass('on');
        $('#minihome_content').attr('src', "${path}/minihome/minihomeMain/${minihomeNo}");
        if(theme == 'NONE'){
            $(".tap_button").css('background-color', '#4582b4');
        }else if(theme == "봄"){
            $(".tap_button").css('background-color', '#ff9999');
        }else if(theme == "여름"){
            $(".tap_button").css('background-color', '#1034a6');
        }else if(theme == "가을"){
            $(".tap_button").css('background-color', '#ff7f00');
        }else if(theme == "겨울"){
            $(".tap_button").css('background-color', '#5f5f5f');
        }else if(theme == "겨울바람"){
 		   $(".tap_button").css('background-color', '#5f5f5f');
 	   }else if(theme == "소나무"){
 		   $(".tap_button").css('background-color', '#A0D6DF');
 	   }else if(theme == "봄비"){
		   $(".tap_button").css('background-color', '#749000');
	   }else if(theme == "연분홍"){
		   $(".tap_button").css('background-color', '#dad4dd');
	   }else if(theme == "폼폼푸린"){
		   $(".tap_button").css('background-color', '#E1D881');
	   }
        $(".tap_button.on").css('background-color', 'white');	
    });   
    
    $('#dr').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#drBoardFolderList').addClass('on');
        $('#minihome_content').attr('src', "${path}/minihome/diaryView/${minihomeNo}");
        if(theme == 'NONE'){
            $(".tap_button").css('background-color', '#4582b4');
        }else if(theme == "봄"){
            $(".tap_button").css('background-color', '#ff9999');
        }else if(theme == "여름"){
            $(".tap_button").css('background-color', '#1034a6');
        }else if(theme == "가을"){
            $(".tap_button").css('background-color', '#ff7f00');
        }else if(theme == "겨울"){
            $(".tap_button").css('background-color', '#5f5f5f');
        }else if(theme == "겨울바람"){
 		   $(".tap_button").css('background-color', '#5f5f5f');
 	   	}else if(theme == "소나무"){
 		   $(".tap_button").css('background-color', '#A0D6DF');
 	   }else if(theme == "봄비"){
		   $(".tap_button").css('background-color', '#749000');
	   }else if(theme == "연분홍"){
		   $(".tap_button").css('background-color', '#dad4dd');
	   }else if(theme == "폼폼푸린"){
		   $(".tap_button").css('background-color', '#E1D881');
	   }
        $(".tap_button.on").css('background-color', 'white');	
    });
    
    $('#nt').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#ntBoardFolderList').addClass('on');
        $('#minihome_content').attr('src', "${path}/board/list");
        if(theme == 'NONE'){
            $(".tap_button").css('background-color', '#4582b4');
        }else if(theme == "봄"){
            $(".tap_button").css('background-color', '#ff9999');
        }else if(theme == "여름"){
            $(".tap_button").css('background-color', '#1034a6');
        }else if(theme == "가을"){
            $(".tap_button").css('background-color', '#ff7f00');
        }else if(theme == "겨울"){
            $(".tap_button").css('background-color', '#5f5f5f');
        }else if(theme == "겨울바람"){
 		   $(".tap_button").css('background-color', '#5f5f5f');
 	   	}else if(theme == "소나무"){
  		   $(".tap_button").css('background-color', '#A0D6DF');
  	   }else if(theme == "봄비"){
 		   $(".tap_button").css('background-color', '#749000');
 	   }else if(theme == "연분홍"){
		   $(".tap_button").css('background-color', '#dad4dd');
	   }else if(theme == "폼폼푸린"){
		   $(".tap_button").css('background-color', '#E1D881');
	   }
        $(".tap_button.on").css('background-color', 'white');
                    
    });
    
    
    
    $('#gl').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#glBoardFolderList').addClass('on');
        $('#minihome_content').attr('src', "${path}/minihome/photo/home/${minihomeNo}");
        if(theme == 'NONE'){
            $(".tap_button").css('background-color', '#4582b4');
        }else if(theme == "봄"){
            $(".tap_button").css('background-color', '#ff9999');
        }else if(theme == "여름"){
            $(".tap_button").css('background-color', '#1034a6');
        }else if(theme == "가을"){
            $(".tap_button").css('background-color', '#ff7f00');
        }else if(theme == "겨울"){
            $(".tap_button").css('background-color', '#5f5f5f');
        }else if(theme == "겨울바람"){
 		   $(".tap_button").css('background-color', '#5f5f5f');
 	   	}else if(theme == "소나무"){
  		   $(".tap_button").css('background-color', '#A0D6DF');
  	   	}else if(theme == "봄비"){
 		   $(".tap_button").css('background-color', '#749000');
 	   	}else if(theme == "연분홍"){
 		   $(".tap_button").css('background-color', '#dad4dd');
 	    }else if(theme == "폼폼푸린"){
		   $(".tap_button").css('background-color', '#E1D881');
	    }        
        $(".tap_button.on").css('background-color', 'white');
    });
    
    $('#gb').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#main_left_side').addClass('on');
        $('#minihome_content').attr('src', "${path}/minihome/visitor/write/${ minihomeNo }");
        if(theme == 'NONE'){
            $(".tap_button").css('background-color', '#4582b4');
        }else if(theme == "봄"){
            $(".tap_button").css('background-color', '#ff9999');
        }else if(theme == "여름"){
            $(".tap_button").css('background-color', '#1034a6');
        }else if(theme == "가을"){
            $(".tap_button").css('background-color', '#ff7f00');
        }else if(theme == "겨울"){
            $(".tap_button").css('background-color', '#5f5f5f');
        }else if(theme == "겨울바람"){
 		   $(".tap_button").css('background-color', '#5f5f5f');
 	   	}else if(theme == "소나무"){
  		   $(".tap_button").css('background-color', '#A0D6DF');
  	   	}else if(theme == "봄비"){
 		   $(".tap_button").css('background-color', '#749000');
 	   	}else if(theme == "연분홍"){
 		   $(".tap_button").css('background-color', '#dad4dd');
 	   	}else if(theme == "폼폼푸린"){
 		   $(".tap_button").css('background-color', '#E1D881');
 	    }
        $(".tap_button.on").css('background-color', 'white');	
                    
    });
    
    
    
    $('#mn').click(function(){
        $('.tap_button.on').removeClass('on');
        $(this).addClass('on');
        $('.left_side_down.on').removeClass('on');
        $('#mnlist').addClass('on');
        $('#minihome_content').attr('src', "${path}/minihome/settingTab2View/${minihomeNo}");
        if(theme == 'NONE'){
            $(".tap_button").css('background-color', '#4582b4');
        }else if(theme == "봄"){
            $(".tap_button").css('background-color', '#ff9999');
        }else if(theme == "여름"){
            $(".tap_button").css('background-color', '#1034a6');
        }else if(theme == "가을"){
            $(".tap_button").css('background-color', '#ff7f00');
        }else if(theme == "겨울"){
            $(".tap_button").css('background-color', '#5f5f5f');
        }else if(theme == "겨울바람"){
 		   $(".tap_button").css('background-color', '#5f5f5f');
 	   	}else if(theme == "소나무"){
  		   $(".tap_button").css('background-color', '#A0D6DF');
  	    }else if(theme == "봄비"){
 		   $(".tap_button").css('background-color', '#749000');
 	   	}else if(theme == "연분홍"){
  		   $(".tap_button").css('background-color', '#dad4dd');
  	   	}else if(theme == "폼폼푸린"){
 		   $(".tap_button").css('background-color', '#E1D881');
 	    }
        $(".tap_button.on").css('background-color', 'white');
                    
    });
    
    $('#show').click(function(){
    	$('#minihome_content').attr('src', "${path}/minihome/settingTab2View/${minihomeNo}");
    });
	
    $('#bgm').click(function(){
    	$('#minihome_content').attr('src', "${path}/minihome/settingTab3View/${minihomeNo}");
    });
    
    
    
    
    

    
    /* 미니 홈페이지이동 */
    $("#selectFrd").change(function(){
        var minihomeNo = $(this).val();
        console.log('셀렉트 :' + minihomeNo);
        if(minihomeNo == ''){
            return ;
        }   
    location.href = "${ path }/minihome/minihomepage/" + minihomeNo;
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

    
/* 여기서부터 intro 수정 작업 */

//수정하기 버튼
function toggleBtnDone() {
 	
	const btnDone = document.getElementById("btnDone");
	const btnEdit = document.getElementById("btnEdit");
// 	document.getElementById("intro").readOnly=true;

 document.getElementById("intro").style.border = "1px solid";
 document.getElementById("intro").readOnly=false;

	btnDone.style.display = "block";
	btnEdit.style.display = "none";
 
}

//수정완료버튼
function toggleBtnEdit() {
	const btnDone = document.getElementById("btnDone");
 const btnEdit = document.getElementById("btnEdit");
	
 let content = $('#intro').val();
	
 // 버튼이랑 다 사라지게하기
 // 아래는 ajax 시작
//	btnDone.style.display = "none";
//	btnEdit.style.display = "block";
	$.ajax({
		url: '${ path }/minihome/profileUpdate/${minihomeNo}',
		type: 'get',
		dataType: 'json',
		data: {
			content
		},
		success: function(data) {
			console.log('성공')
			console.log(data)
			
			document.location.reload();
		 	document.getElementById("intro").readOnly=true;
			
		},
		error: (error) => {
			alert('다시 시도해주세요.');
			console.log(error)
		}
		
		
	});
	
 
}

function editTitle() {
	const btnTitleUpdate = document.getElementById("btnTitleUpdate");
 const btnTitleUpdateDone = document.getElementById("btnTitleUpdateDone");
 document.getElementById('minihomeTitleText').style.border = "1px solid";
 document.getElementById('minihomeTitleText').readOnly = false;
 
 btnTitleUpdate.style.display = "none";
 btnTitleUpdateDone.style.display = "inline";
 
 
 
}

function editTitleDone() {
	const btnTitleUpdate = document.getElementById("btnTitleUpdate");
 const btnTitleUpdateDone = document.getElementById("btnTitleUpdateDone");
 
 let title = $('#minihomeTitleText').val();
	    
	$.ajax({
		url: '${ path }/minihome/titleUpdate/${minihomeNo}',
		type: 'get',
		dataType: 'json',
		data: {
			title
		},
		success: function(data) {
			console.log('성공')
			console.log(data)
			
			document.location.reload();
			
		},
		error: (error) => {
			alert('다시 시도해주세요.');
			console.log(error)
		}
		
		
	});
 
}

function folder() {
    $('#minihome_content').attr('src', "${path}/minihome/photo/${minihomeNo}/folder");
}




</script>

</body>

</html>