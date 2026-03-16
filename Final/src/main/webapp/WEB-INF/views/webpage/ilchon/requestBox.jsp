<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="${ path }/resources/js/jquery-3.6.3.js"></script>
    <title>일촌 리스트</title>
    
    <style>        
        div,ul,li{margin:0; padding:0;}
        ul,li {list-style:none;}
        .tab{float:left; width:1100px; height:290px;}
        .tabnav{font-size:0; width:1100px; border:1px solid #ddd;}
        .tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
        .tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
        .tabnav li a.active:before{background:rgb(243, 156, 18);}
        .tabnav li a.active{border-bottom:1px solid #fff;}
        .tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
        .tabnav li a:hover,
        .tabnav li a.active{background:#fff; color:rgb(243, 156, 18); }
        .tabcontent{padding: 20px; border:1px solid #ddd; border-top:none;}
        .searchContent{width: 1000px; padding: 0px; border:1px solid #ddd; margin-left: auto; margin-right: auto;}

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
        
     /* 팝업 스타일 */
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
	  max-height:400px;
	}
	
	.popup-foot{
	  width:100%;
	  height:50px;
	}
	.pop-btn{
	  display:inline-flex;
	  width:33%;
	  height:100%;
	  float:left;
	  justify-content:center;
	  align-items:center;
	  color:#ffffff;
	  cursor:pointer;
	}
	.pop-btn.confirm{
	  order-right:1px solid rgb(243, 156, 18);
	}
	
    </style>
    	
</head>

<body>

<br>

<h2>일촌 신청함</h2>

<br>
<hr>
<br><br>


    <div class="tab">
        <ul class="tabnav">
            <li><a href="#toRequest">보낸 신청함</a></li>
            <li><a href="#fromRequest">받은 신청함</a></li>
        </ul>
            
        <div class="tabcontent">
                <!-- 보낸 신청함 리스트 -->
			<div id="toRequest">
                    <div class="ilchons">
                        <div class="ilchon-list">
                            <a href="#" class="ilchon">
                                <img src="${ path }/resources/images/pompom.png" width="200px">
                                <div class="ilchon-name">
                                    아이디
                                </div>
                                <div class="ilchon-nick">
                                    일촌명
                                </div>
                            </a>
                            <jsp:include page="${ path }/webpage/ilchon/inbox"/>
                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <!-- 일촌 신청 보관함 -->
                <div id="fromRequest">
                    <div class="ilchons">
                        <div class="ilchon-list">
                            <c:if test="${ empty list }">
                                <p>일촌 신청 목록이 없습니다.</p>
                            </c:if> 
                      		
	                        <!-- 일촌 신청 정보 -->
	                        <div class="container">
	                            <a href="#" class="ilchon">
	                                <img src="${ path }/resources/images/pompom.png" width="200px">
	                                <div class="ilchon-name">
	                                    아이디
	                                </div>
	                                <div class="ilchon-nick">
	                                    일촌명
	                                </div>
	                                <%-- <c:if test="${ not empty loginMember && loginMember.id == request.toUserId }"> </c:if>--%>
	                            	<button type="button" id="modal-open" onclick="javascrit:window.open('${ path }/webpage/ilchon/requestModal','popup_1','width=500px,height=400px,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,left=300px,top=100px')">
	                            	신청 내용 확인 </button>
	                            </a>
	                         </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                
            </div> 
    </div>


    <script>
        $(function(){
            $('.tabcontent > div').hide();
            $('.tabnav a').click(function () {
                $('.tabcontent > div').hide().filter(this.hash).fadeIn();
                $('.tabnav a').removeClass('active');
                $(this).addClass('active');
                return false;
            }).filter(':eq(0)').click();
        });

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
		  $("#modal-open").click(function(){        
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
		      $("#modal-open").css('background-color','rgb(243, 156, 18)');
		      $('#modal-open').html('<div class="icon-ok"></div> 나의 일촌');
		  }
		  
		});
        
    </script>
</body>
</html>