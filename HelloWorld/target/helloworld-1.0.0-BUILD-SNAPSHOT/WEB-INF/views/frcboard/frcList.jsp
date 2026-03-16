<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.lblInfo{
	font-weight: bold;
	 color: #50BCDF;
}

#main{	
	width: 100%;
	padding: 10px;
}

#friendsSay {
  width: 550px;
  height: 40px;  
  line-height: 38px;
}

#friendSayContent {
  width: 300px;
}

#up_content {
  width: 300px;
}

#miniRoom{
	width: 640px;
	height:210px;
	padding:30px 20px 0px 0px;
	margin: 5px auto;
	border: 1px solid grey;
	border-radius: 3px;
}

#frcBoardWrapper{
	width: 780px;
}

#miniroomWrapper{
	width:100%;
}

button{
  border-style: none;
  background-color: white;
}

button:hover{
  cursor: pointer;
}

#frcList {
  font-size: 13px;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<!--
                                                                                                        
                                                                                                        
    $$      $$   $$$$$$$$  $$        $$         $$$$       $$             $$    $$$$   $$$$$$$$  $$        $$$$$$$        $$
    $$      $$   $$        $$        $$        $$  $$      $$             $$   $$  $$  $$     $$ $$        $$     $$     $  $
    $$      $$   $$        $$        $$       $$    $$      $$   $$$$    $$   $$    $$ $$     $$ $$        $$      $$   $$  $$
    $$$$$$$$$$   $$$$$$$$  $$        $$       $$    $$      $$   $$ $$   $$   $$    $$ $$$$$$$$  $$        $$      $$    $  $
    $$      $$   $$        $$        $$       $$    $$       $$ $$   $$ $$    $$    $$ $$   $$   $$        $$      $$     $$
    $$      $$   $$        $$        $$        $$  $$        $$$$     $$$$     $$  $$  $$    $$  $$        $$     $$        
    $$      $$   $$$$$$$$  $$$$$$$$  $$$$$$$$   $$$$   $$     $$       $$       $$$$   $$     $$ $$$$$$$$  $$$$$$$        $$
     
                                                                                                         
 -->
<title>일촌평 메인 페이지</title>
</head>
<body>
  
<div id = "main">
 
 <div id = "miniroomWrapper">
 	<label class = "lblInfo">mini room</label>
 
 	<div id = "miniRoom">
 		<img src = "${pageContext.request.contextPath}/resources/images/miniRoomReady.png" width="600px">
 	</div>
 	
 </div>
<br>
  <!-- 스프링에서는 .do 안씀 -->
  <!-- register 는 무조건 get방식 -->
 <div id = "frcBoardWrapper">
  <form action="register" method="POST">
    <div id="friendsSay">
      <label class = "lblInfo">What friends say </label> <input type="text" id="friendSayContent" name="frc_content"
        placeholder="일촌에게 들려주고싶은 이야기를 작성해 주세요!">
      <!-- input부분 컨트롤러에서 vo로 받았기때문에 name를 vo 변수이름과 맞춰줘야함 -->
      <input type="text" hidden="hidden" value="${vo.frc_date }">
      <input type="submit" value="작성">
    </div>
  </form>
  <hr>
  <div id="frcList">
    <c:forEach var="vo" items="${frcBoardList }">
      <form id="ilChonPyeong${vo.frc_bno}">
        <input id="bno${vo.frc_bno }" name="frcList_bno" hidden="hidden" value="${vo.frc_bno }">
         · <a id="friendSayContent${vo.frc_bno}" >${vo.frc_content }</a>
        (<a id="nickname${vo.nickname }">${vo.nickname }</a> <a href="#" id="user_name${vo.user_name}">${vo.user_name}</a>)
        <fmt:formatDate value="${vo.frc_date }" pattern="yyyy-MM-dd"
          var="frc_date" />
        <a id="frc_date${vo.frc_bno }">${frc_date }</a>
        
        
        <!-- =====================================일촌평 수정/삭제/댓글 버튼 show ==================================================== -->
        
        <!-- -------------------------------------- 삭제 버튼 on -------------------------------------- -->
        <a id="btn_delete${vo.frc_bno}" style= "float : right;" onclick="btn_delete(${vo.frc_bno})">
        <button type="button"> 
        <img src="${pageContext.request.contextPath}/resources/image/delete.png"></button></a>
        <a style= "float : right;"></a>
        
        <!-- -------------------------------------- 수정 버튼 on -------------------------------------- -->
        <a id="btn_update${vo.frc_bno}" style= "float : right;" onclick="btn_update(${vo.frc_bno})">
        <button type="button">
        <img src="${pageContext.request.contextPath}/resources/image/update.png"></button></a>
        <a style= "float : right;"> &nbsp;&nbsp;</a>
        
        <!-- -------------------------------------- 댓글 버튼 -------------------------------------- -->
        <a href = "#" style="float : right;" id = "reply${vo.frc_bno}"  onclick="getFrcReply('${vo.frc_bno}')">댓글</a><!-- 댓글 모든것 되게  -->
        <!-- -------------------------------------- END 댓글 버튼 -------------------------------------- -->
        <br>
        
        <!-- ============================================== 수정/삭제 버튼 기능수행 ============================================== -->
        
        <!-- -------------------------------------- 수정버튼 기능수행 -------------------------------------- -->
        <div id="update_save${vo.frc_bno }" hidden="hidden">
            <input id="frc_bno${vo.frc_bno }" name="frc_bno" hidden="hidden" value="${vo.frc_bno }">
            수정 내용 : <input id="frc_content${vo.frc_bno }" type="text" name="frc_content" placeholder="일촌평 수정 내용 입력">
            <a id="save_update${vo.frc_bno }" onclick="save_update(${vo.frc_bno})">
            <button type="submit" >
            <img src="${pageContext.request.contextPath}/resources/image/check.png"></button></a>
            <a id="update_cancel${vo.frc_bno}" onclick="update_cancel(${vo.frc_bno})">
            <button  type=submit >
            <img src="${pageContext.request.contextPath}/resources/image/cancel.png"></button></a>
        </div>
        
        <!-- -------------------------------------- 삭제버튼 기능수행 -------------------------------------- -->
        <div id="delete${vo.frc_bno }" hidden="hidden">
            <input id="del_bno${vo.frc_bno }" name="del_bno" hidden="hidden" value="${vo.frc_bno }">
            [<a>${vo.frc_content }</a>] 해당 일촌평을 삭제할까요?
            <a id="del_hidden${vo.frc_bno}" onclick="del_hidden(${vo.frc_bno})">
            <button  type="submit" >
            <img src="${pageContext.request.contextPath}/resources/image/check.png"></button></a>
            <a id="delete_cancel${vo.frc_bno}" onclick="delete_cancel(${vo.frc_bno})">
            <button  type="submit" >
            <img src="${pageContext.request.contextPath}/resources/image/cancel.png"></button></a>
        </div>
        
        <!-- =================================== 댓글 입력 ============================================ -->
        <div id="${vo.frc_bno }" class="reply_show${vo.frc_bno }" style="display: none;">
          <div id="frc_reply${vo.frc_bno }"></div>
          <input type="text" hidden="hidden" id="replyid${vo.frc_bno}" value="${vo.userid }" readonly="readonly">
          · <a class="replyContent">댓글 입력 : </a><input type="text" id="replyContent${vo.frc_bno}" placeholder="댓글 내용을 입력하세요" >
          <a id="btn_reply_add${vo.frc_bno}" onclick="btn_reply_add(${vo.frc_bno})">
          <button type="button">
          <img src="${pageContext.request.contextPath}/resources/image/check.png"></button></a>
        
        </div>

        <div style="text-align: center;">
          <div id="replies${vo.frc_bno}"></div>
        </div>
        <hr>
      </form>
    </c:forEach>
    
  </div>
  <div>
    <ul class="pager">
      <c:if test="${pageMaker.hasPrev }">
        <li><a href="${pageMaker.startPageNo - 1 }">이전</a></li>
      </c:if>
      <c:forEach begin="${pageMaker.startPageNo }"
        end="${pageMaker.endPageNo }" var="num">
        <li><a href="${num }">${num }</a></li>
      </c:forEach>
      <c:if test="${pageMaker.hasNext }">
        <li><a href="${pageMaker.endPageNo + 1 }">다음</a></li>
      </c:if>
    </ul>
  </div>
  <div>
    <form id="pagingForm" style="display: none;">
      <input type="text" name="page" value="${pageMaker.criteria.page }">
    </form>
  </div>
 </div><!-- end frcBoard --> 
</div>  <!-- end Main -->
  
  <!--  ========================================================= 자바 스크립트 ==========================================================  -->
  <!--  ========================================================= 자바 스크립트 ==========================================================  -->
  <script type="text/javascript">
  /* ===================================================== 일촌평 수정(on) ====================================================== */
	/*  */
  	function btn_update(frc_bno){
	  var bno = frc_bno;
	  console.log('frcList 일촌평 수정(on-off부분) bno : ' + bno);
	  var btnUpdate = '#btn_update' + bno;
	  var update = $(btnUpdate);
	  var save = $('#update_save' + bno);
	  var ilChonPyeong = '#ilChonPyeong' + bno;
	  var ilChonPyeong = $(ilChonPyeong);
	  //event.preventDefault();
	  
	 /*  var check_on_off_btn_update = document.getElementById(frc_bno);
	  
	  if(check_on_off_btn_update.style.display == 'none'){
	    check_on_off_btn_update.style.diaplay = 'block';
	  } else{
	    check_on_off_btn_update.style.display = 'none';
	  } */
	  
	  ilChonPyeong.find('[name = "frcList_bno"]').val(bno);
	  save.removeAttr('hidden');
	  //update.submit();
	}
  
  	/* ===================================================== 일촌평 수정(off) ====================================================== */
  	function update_cancel(frc_bno){
  	  var bno = frc_bno;
  	  var saveCancel = '#update_cancel' + bno;
  	  var cancel = $(saveCancel);
  	  var save = $('#update_save' + bno);
  	  console.log("updatte_cancle " +save);
  	  
  	  save.attr('hidden');
  	  cancel.submit();
  	  
  	  
  	}
	/* ===================================================== 일촌평 수정(실제 수정되는 기능) ====================================================== */
	function save_update(frc_bno){
	  var bno = frc_bno;
	  console.log('frcList 일촌평 수정(기능수행부분) bno : ' + bno);
	  var btnUpdate = '#save_update' + bno;	
	  var save = $(btnUpdate);
	  var ilChonPyeong = '#ilChonPyeong' + bno;
	  var ilChonPyeong = $(ilChonPyeong);
	  var inputbox = '#frc_content' + bno;
	  var frc_content = $(inputbox).val();
	  
	  
	  if(frc_content == null || frc_content == ""){
	    alert('내용을 입력하세요.');
	    return;
	  } else {
	    alert('일촌평이 수정 되었습니다.')
	  }
	  
	  ilChonPyeong.find('[name = "frcList_bno"]').val(bno);
	  ilChonPyeong.attr('action', 'update'); 
	  ilChonPyeong.attr('method', 'post');
	  save.submit();
	}
	/* ==================================================== 일촌평 삭제(on) ============================================ */	
	function btn_delete(frc_bno){
	  var bno = frc_bno;
	  console.log('frcList 일촌평 삭제(on-off 부분) bno : ' + bno);
	  var btnDelete = '#del_hidden' + bno;
	  var del = $(btnDelete);
	  var save = $('#delete' + bno);
	  var ilChonPyeong = '#ilChonPyeong' + bno;
	  var ilChonPyeong = $(ilChonPyeong);
	  //event.preventDefault();
	  ilChonPyeong.find('[name = "frcList_bno"]').val(bno);
	  save.removeAttr('hidden');
	  del.submit();
	}
	
	/* ===================================================== 일촌평 삭제(off) ====================================================== */
	function delete_cancel(frc_bno){
	  var bno = frc_bno;
	  var deleteCancel = '#delete_cancel' + bno;
	  var cancel = $(deleteCancel);
	  var save = $('#delete' + bno);
	  
	  
	  save.attr('hidden');
	  cancel.submit();
	  
	  
	}
	
	/* ==================================================== 일촌평 삭제(실제 삭제되는 기능) ============================================ */
	function del_hidden(frc_bno){
	  var bno = frc_bno;
	  console.log('frcList 일촌평 삭제(기능수행부분) bno : ' + bno);
	  var btnDelete = '#del_hidden' + bno;
	  var del = $(btnDelete);
	  var ilChonPyeong = '#ilChonPyeong' + bno;
	  var ilChonPyeong = $(ilChonPyeong);
	  ilChonPyeong.find('[name = "frcList_bno"]').val(bno);
	  ilChonPyeong.attr('action', 'delete'); 
	  ilChonPyeong.attr('method', 'post');
	  del.submit();
	  alert('일촌평 삭제 성공');
	}
	
	/*====================================================== 댓글 입력 ===================================================================*/
	  
	function btn_reply_add(frc_bno){
	  event.preventDefault();
	  console.log('frcList 댓글 입력 부분 bno : ' + frc_bno);
	
	  var inputbox = '#replyContent' + frc_bno;
	  var replyContent = $(inputbox).val();
	  
	  if(replyContent == null || replyContent == ""){
	    alert('댓글 입력 실패 : 내용을 입력하세요!')
	    return;
	  }
	  
	  var content = replyContent; // 댓글 내용 값

	  var obj = {
	      'frc_bno' : frc_bno,
	      'frc_reply_content' : content
	    
	  }; // end obj
	  
	  $.ajax({
	    type : 'post',
	    url : '/helloworld/frcReplies',
	    headers : {
	      'Content-Type' : 'application/json',
  	      'X-HTTP-Method-Override' : 'POST'
	    },
	    data : JSON.stringify(obj),
	    success : function(result){
	      console.log("frcList 댓글 입력 부분 btn_reply_add - success : functino - result : " + result);
	      if(result == 1){
	        alert('댓글 입력 성공');
	        var textClear = '#replyContent' + frc_bno;
	        $(textClear).val(' ');
	        getFrcReply(frc_bno);
	        //var check_on_off = document.getElementById(frc_bno);
	        //check_on_off_style.display = 'block';
	      }
	    }
	  });// end ajax

	} // end btn_reply_daa()
	
	/*====================================================== 댓글 전체 가져오기 ===================================================================*/
	
	function getFrcReply(frc_bno){
	  var frc_bno = frc_bno;
	  var url = '/helloworld/frcReplies/all/' + frc_bno;
	  console.log("function getFrcReply - frc_bno : " + frc_bno);
	  
	  // 댓글 on-off
	  var check_on_off = document.getElementById(frc_bno);
	  if(check_on_off.style.display == 'none'){
	    check_on_off.style.display = 'block';
	  } else {
	    check_on_off.style.display = 'none';
	  }
	  
	  var div = '';
	  $.getJSON (
	  	url,
	  	function(jsonData){
	  	  console.log(jsonData);
	  	  var list = '';
	  	  $(jsonData).each(
	  	  function(){
	  	      div = '';
	  	      div = '#frc_reply' + this.frc_bno;
	  	      
	  	      var date = getFormatDate(new Date(this.frc_reply_date));
	  	      
	  	      list += '<div class="reply_item" id="' + this.frc_bno + '">'
	  	      + '<pre>'
	  	      + '<input type="hidden" id="frc_rno" value="' + this.frc_rno + '" />'
	  	      + '<input type="hidden" id="userid" value="' + this.userid + '" />└'
	  	      + '&nbsp;'
	  	      + this.frc_reply_content
	  	      + '&nbsp;&nbsp;'
	  	      + '('
	  	          + this.nickname
	  	      + '&nbsp;&nbsp;' // 공백
	  	      + '<a href="#">' + this.user_name + '</a>'
	  	      + ')'
	  	      + date
	  	      + '&nbsp;&nbsp;' // 공백
	  	      + '&nbsp;&nbsp;' // 공백
	  	      /* ========================================= 댓글 수정버튼(on-off) ===================================== */
	  	      + '<a>'
	  	      + '<button type = "button" id="btn_reply_update('+this.frc_rno+')" onclick="btn_reply_update(' + this.frc_rno +')">'
	  	      + '<img src="${pageContext.request.contextPath}/resources/image/update.png"></button>'
	  	      + '</a>'
	  	      /* ========================================= 댓글 삭제버튼 ===================================== */
	  	      + '<a>'
	  	      + '<button type = "button" id="btn_reply_delete('+this.frc_rno+')" onclick="btn_reply_delete(' + this.frc_rno + ',' + this.frc_bno +')">'
	  	      + '<img src="${pageContext.request.contextPath}/resources/image/delete.png"></button>'
	  	      + '</a>'
	  	      + '</pre>'
	  	      /* ========================================= 댓글 수정버튼(기능수행) ===================================== */
	  	      + '<pre id = "'+ this.frc_rno + '" style="display: none;"">'
	  	      + '<input id="frc_reply_content'+ this.frc_rno + '" type="text" name="frc_content" placeholder="댓글 수정 내용 입력" >'
	  	      + '<button type = "button" id="btn_reply_save('+this.frc_rno+')" onclick="btn_reply_save(' + this.frc_rno + ',' + this.frc_bno +')">'
	  	      + '<img src="${pageContext.request.contextPath}/resources/image/check.png"></button>'
	  	      + '</pre>'
	  	      + '</div>';
	  	      
	  	      $(div).html(list);
	  	      //console.log(list);
	  	  }) // end each
	  	} // end jsonData
	  ) // end get JSON
	}// end getFrcReply(frc_bno)
	
	/*====================================================== 댓글 수정(on-off) ===================================================================*/
	 
	function btn_reply_update(frc_rno){
      console.log(frc_rno);
      
      var check_on_off_reply = document.getElementById(frc_rno);
      
      if(check_on_off_reply.style.display == 'none'){
        check_on_off_reply.style.display = 'block';
      } else {
        check_on_off_reply.style.display = 'none';
      } 
      //var frc_reply_content = $('#replyContent').val();
      
    }; //end update
    /* ========================================= 댓글 수정(기능수행) ===================================== */
      
    function btn_reply_save(frc_rno, frc_bno){
      console.log('frcList 댓글 수정(기능) rno : ' + frc_rno);
      console.log('frcList 댓글 수정(기능) bno : ' + frc_bno);
      
      var frc_bno = frc_bno;
      var inputBox = '#frc_reply_content' + frc_rno;
      var content = $(inputBox).val(); // 댓글 수정 내용값
      
      if(content == null || content == ""){
  	    alert('댓글 수정 실패 : 내용을 입력하세요!')
  	    return;
  	  }
      
      var obj = {
  	      'frc_reply_content' : content
      }; // end obj()
      $.ajax({
        type : 'put',
        url : '/helloworld/frcReplies/' + frc_rno,
        headers : {
          'Content-Type' : 'application/json',
	  	  'X-HTTP-Method-Override' : 'PUT'
        },
        data : JSON.stringify(obj),
        success : function(result){
          console.log('frcList 댓글 수정 부분 btn_reply_save - result : ' + result);
          if(result == 'success'){
            alert('댓글 수정 성공')
            getFrcReply(frc_bno);
            var check_on_off = documentById(frc_bno);
            check_on_off.style.display = 'block';
            //location.reload(frc_rno);
          }// end if()
        }// end success)()
   	  }); // end ajax()
    
    }; // end btn_reply_save()
    
    
    /* ========================================= 댓글 삭제(기능수행) ===================================== */
    
    function btn_reply_delete(frc_rno, frc_bno){
      var frc_bno = frc_bno;
      var frc_rno = frc_rno;
      
      console.log('frcList 댓글 삭제 부분 bno : ' + frc_bno);
      console.log('frcList댓글 삭제 부분 rno : ' + frc_rno);
      var obj = {
          'frc_rno' : frc_rno,
          'frc_bno' : frc_bno
      };
      
      $.ajax({
        type : 'delete',
        url : '/helloworld/frcReplies/' + frc_rno,
        headers : {
          'Content-Type' : 'application/json',
  	  	  'X-HTTP-Method-Override' : 'DELETE'
        },
        data : JSON.stringify(obj),
        success : function(result){
          console.log('frcList 댓글 삭제 success 부분 result : ' + result);
          if(result == 'success'){
            alert('댓글 삭제 성공');
            getFrcReply(frc_bno);
            
          } // end if()
        } // end success()
      
      }); // end ajax()
    }; // end btn_reply_delete()
    
	
	/*====================================================== 시간 데이터 ===================================================================*/
	function getFormatDate(date){
    	var year = date.getFullYear();              //yyyy
    	var month = (1 + date.getMonth());          //M
    		month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    	var day = date.getDate();                   //d
    		day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    	var hour = date.getHours();
    		hour = hour >= 10 ? hour : '0' + hour;
    	var min = date.getMinutes();
    		min = min >= 10 ? min : '0' + min;
    	return  year + '.' + month + '.' + day + ' ' + hour + ':' + min;
	} // end getFormatDate()

    </script>
</body>
</html>