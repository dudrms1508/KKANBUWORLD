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
      <div id = "left_side_down">
         <div class = "left_side_down" id = "glBoardFolderList" ><!-- board-folderList -->
          <label class = "lblBoard">PHOTO ALBUM</label>
         <hr>
          <c:forEach var = "folder" items="${glFolderList }">
            <ol>
             <li><a href = "${folder }">${folder }</a>
            </ol>
          </c:forEach>
          <form id = "selectByFolder" style="display: none;">
             <input type = "text" name = "userid" value = "test">
             <input type = "text" name = "folder">
          </form>   
    
          <c:if test="${loginId == homeId }">
          <button class = "btnMngFolder" onclick = "GLFmanager('${homeId}')">폴더 관리하기</button>
          </c:if>
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
      <iframe id = "minihome_content" src = "${path}/board/list">
      </iframe>
     </div>   
      <div id = "btnWrapper">
            <button class = "tap_button" id = "home">홈</button>
            <button class = "tap_button" id = "dr">다이어리</button>
            <button class = "tap_button" id = "nt">게시판</button>
            <button class = "tap_button on" id = "gl">사진첩</button>
            <button class = "tap_button" id = "gb">방명록</button>
            <button class = "tap_button" id = "mn">관리</button>
      </div>
   </div>

<script type="text/javascript">
$(document).ready(function(){

      $('#gl').click(function(){
         $('.tap_button.on').removeClass('on');
         $(this).addClass('on');
         $('.left_side_down.on').removeClass('on');
         $('#glBoardFolderList').addClass('on');
         $('#minihome_content').attr('src', "/helloworld/gallery/list");
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
      
      
         
      $('left_sideleft_side_down.btnMngFolder').click(function(){
         $('.left_side_down.on').removeClass('on');
         $('#MngFolderList').addClass('on');
         
      });
      
      
      $('#glBoardFolderList a').click(function(){
           event.preventDefault();
           var folder = $(this).attr("href");
           $('#minihome_content').attr('src', "/helloworld/gallery/list?folder_name="+folder);
           
        });
      
      
      
      
      $('#btnTitleUpdate').click(function(){
         window.open('titleUpdate', 'child', 'width=429px, height=230px');
      });
      
      $('#btnEdit').click(function(){
         window.open('profileUpdate', 'child', 'width=330px, height=390px');      
      });
      
      $('#btnImg').click(function(){
         window.open('photoUpdate', 'child', 'width=330px, height=390px');      
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

});



</script>


</body>
</html>