<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 날짜를 APR로 나오게 하는 설정 -->
<fmt:parseDate var="now" value="${now}" pattern="yyyy-MM-dd"/>
<fmt:setLocale value="en_US"/>
<fmt:setBundle basename="java.text.resources.DateFormatSymbols" var="dfs"/>
<fmt:message key="MMM" bundle="${dfs}" var="months"/>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 다이어리 </title>
    <script src="https://kit.fontawesome.com/e2e95fa20e.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/jquery-3.6.3.js"></script>

<style>
	/* 폰트 임의로 */
	@font-face {
    font-family: 'NeoDunggeunmo';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff')
      format('woff');
    font-weight: normal;
    font-style: normal;
  }
  
  @font-face {
    font-family: 'KOTRAHOPE';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2')
      format('woff2');
    font-weight: normal;
    font-style: normal;
  }
  
  @font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff')
      format('woff');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'SangSangYoungestDaughter';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202@1.0/SangSangYoungestDaughter.woff')
      format('woff');
    font-weight: normal;
    font-style: normal;
  }

	#buttonarea {
	width: 760px;
	}

	/* center */
	.center {
    width: 770px;
    height: auto;
    display: flex;
    flex: 1;
    flex-direction: column;
    background-color: #eeeeee;
    border-radius: 15px;
    margin: 5px 10px;
    margin-right: 0;
  }
  .top {
    display: flex;
    flex: 0.05;
    flex-direction: row;
    background-color: #eeeeee;
    border-radius: 15px;
    margin: 5px;
    padding: 5px;
    padding-bottom: 0;
    text-align: center;
  }
  .title {
    display: flex;
    flex: 0.6;
    flex-direction: row;
    background-color: #eeeeee;
    border-radius: 15px;
    margin: 0;
    padding: 0 5px;
    text-align: center;
  }
  .tears {
    font-size: 20px;
    font-weight: bolder;
    margin: 0;
  }
  .address {
    display: flex;
    flex: 0.4;
    flex-direction: row-reverse;
    background-color: #eeeeee;
    border-radius: 15px;
    margin: 0 5px;
    padding: 0 5px;
    vertical-align: bottom;
  }
  .main {
  	width: 750px;
    height: auto;
    display: flex;
    flex: 2;
    flex-direction: column;
    background-color: white;
    border-radius: 15px;
    margin: 0;
    margin-bottom: 10px;
    text-align: center;
    padding: 10px 10px 10px 10px;
  }
  
  /* main_diary */
  .main_diary {
    display: block;
    height: auto;
    flex-direction: column;
    margin: 10px;
  }
  .calender {
    border: 1px solid #eeeeee;
    border-radius: 5px;
    flex: 0.1;
    margin-bottom: 10px;
    display: flex;
    flex-direction: row;
  }
  .date {
    display: flex;
    flex: 0.2;
    padding: 10px;
    justify-content: center;
    font-family: 'NeoDunggeunmo';
    font-size: 20px;
    color: #4591cd;
  }
  .calenderbox {
    display: flex;
    flex: 1;
    padding: 10px;
    font-family: 'NeoDunggeunmo';
    font-size: 20px;
    flex-wrap: wrap;
  }
  .weekday {
    color: black;
    padding: 0 5px;
  }
  .sat {
    color: orangered;
    padding: 0 5px;
  }
  .sun {
    color: blue;
    padding: 0 5px;
  }
  .diary {
    width:auto;
    height: auto;
    flex: 1;
    flex-direction: column;
    overflow-y: scroll;
    overflow-x: hidden;
  }
  .diarybox {
  	width:auto;
    display: block;
    border: 1px solid #eeeeee;
    border-radius: 5px;
    margin: 15px 0 10px 0;
  }
  
   .diaryReplyBox {
    display: block;
    border: 1px solid #eeeeee;
    border-radius: 5px;
    margin: 15px 0;
  }
  
  
  .diary_title {
    flex: 0.1;
    font-family: 'NeoDunggeunmo';
    text-align: left;
    font-size: 20px;
    padding: 10px;
    color: #4591cd;
  }
  .diary_content {
    display: block;
    text-align: center;
    width: 200px;
    margin: auto;
    padding: 20px;
    font-size: 20px;
    font-family: 'SangSangYoungestDaughter';
  }
  
  .diary_comment {
    flex: 0.1;
    font-family: 'NeoDunggeunmo';
    text-align: left;
    font-size: 20px;
    padding: 10px;
    color: #4591cd;
  }
  
  .onion {
    width: 100%;
  }
  .diary_btn {
    margin-top: 15px;
    background-color: green;
    color: #eeeeee;
    border: 4px #eeeeee solid;
    font-family: 'NeoDunggeunmo';
    font-size: 16px;
    width: 130px;
    height: 50px;
    opacity: 0;
    transition: all 1s ease-in;
  }
  .diary_btn:hover {
    opacity: 1;
  }
  .icon {
    color: orangered;
    font-size: 20px;
  }
  .hidden {
    border-radius: 5px;
    border: #eeeeee 1px solid;
    margin: 20px 0;
    font-family: 'SangSangYoungestDaughter';
  }

  
  /* right */
  .right {
    display: flex;
    flex: 0.1;
    flex-direction: column;
    background-color: ;
    border-radius: 15px;
    padding: 10px 0;
    margin: 5px 15px;
    margin-left: 0;
    margin-bottom: 10px;
  }
  .right_menu {
    padding: 10px 0;
    margin-top: 50px;
  }
  .right_menu_home,
  .right_menu_diary,
  .right_menu_photo,
  .right_menu_friends {
    display: inline-block;
    color: white;
    background-color: #4591cd;
    padding: 5px 10px;
    width: 60px;
    margin: 5px 0;
    text-decoration: none;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    border: dashed 1px white;
    border-left: none;
    font-size: 17px;
    font-family: 'KOTRAHOPE';
    font-weight: lighter;
  }
  
  .float-right {
  	float: right;
  	width: 70px;
  	height: 30px;
  	margin: 5px; 
  	margin-right: 30px;
  }


	/* 글 내용의 경계선 표시 */
	.content{
		border: 1px dotted #cecece;
	}
	
	/* 글 내용안에 있는 이미지의 크기 제한 */
	.content img{
		max-width: 100%;
	}
	
	
	/* 댓글에 관련된 css */
	.comments {
		/* border: 1px solid blue; */
		width: 730px;
		height: auto;
	}
	
	.comments ul{
		padding: 10;
		margin: 0;
		list-style-type: none;
	}
	.comments ul li{
		border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
	}
	.comments dt{
		margin-top: 5px;
	}
	.s dd{
		margin-left: 26px;
	}
	
	.comment_form {
		/* border: 1px solid red; */
		height: 50px;
		width: 730px;
		background-color: whitesmoke;
		 flex-direction: column;
  		justify-content: center;
  		align-items: center;
	}
	
	.comment_form textarea {
		  max-width: 637px;
		  margin-top: 5px;
		}
	
	.comment_form button {
	  margin-top: 10px;
	}
	
	.comments textarea, .comments button{
		float: left;
	}
	.comments textarea{
		width: 700px;
		margin-right: 10px;
		margin-left: 10px;
		border: 1px solid #eeeeee;
		border-radius: 10px;
	}
	
	.comments button{
		width: 50px;
		height: 30px;
		float: left;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
	.comment {
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.comments .user-img{
		width: 20px;
		height: 20px;
		border-radius: 50%;
	}
	
	#barsetting {
		background-color: whitesmoke;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		width: auto;
		height: 30px;
		box-sizing: border-box;
		vertical-align: middle;
		margin-bottom: 20px;
		padding: 5px 5px 5px 5px;
		/* border: 1px solid red; */
    }
	
    #barlist>div {
        float: left;
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }
	
	#barleft {
        /* border: 1px solid red; */
        font-size: 14px;
        width: 85%;
        height: 100%;
        padding-left: 10px;
    }

    #barright {
        /* border: 1px solid red; */
        font-size: 14px;
        width: 15%;
        height: 100%;
        justify-content: center;
    }
    
    
    .reply_form {
		/* border: 1px solid red; */
		height: 50px;
		width: auto;
		display: flex;
		justify-content: space-between;
		background-color: whitesmoke;
	}
	
	.replies textarea{
		width: 560px;
		margin-left: 10px;
		margin-right: 20px;
		border: 1px solid #eeeeee;
		border-radius: 10px;
	}
    
    #replyleft {
        /* border: 1px solid red; */
        font-size: 14px;
        width: 7%;
        height: 100%;
        padding-left: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font: bold;
    }

    #replyright {
        /* border: 1px solid red; */
        font-size: 14px;
        width: 93%;
        height: 100%;
        justify-content: center;
        display: flex;
		justify-content: center;
		align-items: center;
    }
    
    .replybutton {
    	
    
    }
    
</style>  
    
</head>
<body>
    <div class="bookcover">
        <div class="bookdot">
            <div class="page">
                <!-- left -->

                <!-- center -->
                <div class="center">
                    <div class="top">
                        <div class="title">
                            <span class="tears">My Diary</span>
                        </div>
                        <div class="address">
                        </div>
                    </div>

                    <div class="main">
                        <div class="main_diary">
                            <div class="calender">

                                <div class="date">
                                <!-- 오늘 날짜로 출력 -->
                                <c:set var="now" value="<%= new java.util.Date() %>" />
								<fmt:formatDate value="${now}" pattern="yyyy'년'"/>
								<br>
								<fmt:formatDate value="${now}" pattern="MMM dd'일'"/>
                                </div>
                                <div class="calenderbox">
                                    <span class="sat"> 1 </span> 
                                    <span class="sun"> 2 </span> 
                                    <span class="weekday">3</span> 
                                    <span class="weekday">4</span> 
                                    <span class="weekday">5</span> 
                                    <span class="weekday">6</span> 
                                    <span class="weekday">7</span> 
                                    <span class="sat">8</span> 
                                    <span class="sun">9</span>
                                    <span class="weekday">10</span>
                                    <span class="weekday">11</span> 
                                    <span class="weekday">12</span> 
                                    <span class="weekday">13</span> 
                                    <span class="weekday">14</span> 
                                    <span class="sat">15</span> <br>
                                    <span class="sun">16</span>
                                    <span class="weekday">17</span>
                                    <span class="weekday">18</span> 
                                    <span class="weekday">19</span> 
                                    <span class="weekday">20</span> 
                                    <span class="weekday">21</span>
                                    <span class="sat">22</span> 
                                    <span class="sun">23</span>
                                    <span class="weekday">24</span>
                                    <span class="weekday">25</span>
                                    <span class="weekday">26</span>
                                    <span class="weekday">27</span>
                                    <span class="weekday">28</span>
                                    <span class="sat">29</span> 
                                    <span class="sun">30</span>
                                </div>
                            </div>
                            
			
		                   <%-- <form action="${path}/minihome/diaryView/${minihomeNo}" method="GET"> --%>
		                   		<c:forEach var="diary" items="${diaryList}">
		                   			<div class="oneDiary">
				                        <div class="diarybox">
				                            <div class="diary_title">
				                                <fmt:formatDate value="${diary.createDate}" pattern="MMM dd'일'(E) HH:mm"/>
				                            </div>
				                            <div name="content" class="diary_content">
				                                <span>${diary.title}</span> <br>
				                                <span>${diary.content}</span>
				                            </div>
				                        </div>
				                        
				                        
						                <!-- 홈주인의 설정 -->
										<div id="barsetting">
											<div id="barlist">
						                        <div id="barleft">
						                        	<span><b>공개설정 : 전체공개</b></span>
						                        </div>
												<div id="barright">
<!-- 								                      <span>
								                      	<a href="">비밀로하기</a>
								                      </span> -->
								                      <c:if test="${ not empty loginMember && loginMember.no eq diary.writer }">
									                      <span>&nbsp;|&nbsp;</span>
									                      <span>
									                      <a type="button" href="${ path }/minihome/diaryUpdate/${minihomeNo}/${diary.DNo}">수정</a>
									                      </span>
									                      <span>&nbsp;|&nbsp;</span>
									                      <span>
									                      	<a type="button" id="btnDelete" href="${ path }/minihome/diaryDelete/${minihomeNo}/${diary.DNo}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
									                      </span>
									                      <span>&nbsp;|&nbsp;</span>
								                      </c:if>
												</div>
											</div>
										</div>
									</div>

									<!-- 댓글 작성 영역 -->
									<div class="diary_comment">
		                             댓글
		                            </div>
		                            
									<form action="${ path }/minihome/diaryReply/${minihomeNo}/${diary.DNo}" method="post" >
										<div class="comments">
											<!-- 원글에 댓글을 작성할 수 있는 폼 -->
											<div class="comment_form">
												<textarea name="content" id="content" rows="content" placeholder="소중한 댓글을 작성해주세요^^" style="resize: none;" style="resize: none; text-align: center; line-height: 100px;"></textarea>
												<button type="submit">등록</button>
											</div>
								   		</div>
									</form>
								</c:forEach> 
							   	<!-- 댓글 작성 영역 끝 -->
							   		
							   		<!-- 작성된 댓글 보여주기 영역  -->
							<table id="tbl-comment">
			                    <c:forEach var="reply" items="${ reply }">
			                        <tr class="level1">
			                            <td>
			                                <sub class="comment-writer">${ reply.writer }</sub>
			                                <sub class="comment-date"><fmt:formatDate value="${reply.createDate}" pattern="yyyy-MM-dd" type="date"/></sub>
			                                
			                                <br>
			                                <span>${ reply.content }</span>
			                            </td>
			                            <td>
			                                <c:if test="${ not empty loginMember && loginMember.no == reply.writer }">
			                                    <button>삭제</button>
			                                </c:if>
			                            </td>
			                        </tr>
			                    </c:forEach>
			                </table>
							   		
							   		
							   		
							   		
							   		
							   		
							   		<%-- 
							   		<form action="${ path }/minihome/diaryReply/${minihomeNo}/${dNo}" method="post" >
										<div class="replies">
											<!-- 원글에 댓글을 작성할 수 있는 폼 -->
											<div class="reply_form">
												<div id="replyleft">
													<span>dd</span>
												</div>
												<div id="replyright">
													<textarea rows="content" style="resize: none;"></textarea>
													<!-- 댓글 작성한 사람만 수정 가능하게 -->
													<button class="replybutton" type="button">수정</button>
													<button class="replybutton" type="button">삭제</button>
												</div>
											</div>
								   		</div>
									</form>
									 --%>
									

										
		                    </div>
                    	</div>
	                    <!-- 다이어리 영역 끝 -->
     
                	</div>
                	<!-- 가운데 영역 끝 -->

            <!-- right -->
            </div>
                 <div id="buttonarea">
               		<button type="button" class="float-right" onclick="location.href='${ path }/minihome/diaryWrite/${minihomeNo}'">글쓰기</button>
               		<%-- <button type="button" class="float-right" onclick="location.href='${ path }/minihome/test/${minihomeNo}'">테스트</button> --%>
               	</div>
               	
        </div>
    </div>
    
    
<!-- 	<script>
	  $(document).ready(function() {
	    $('#submit_btn').click(function(e) {
	      e.preventDefault();
	      
	      var content = $('#comment_input').val(); // textarea에 입력된 댓글 내용
	      
	      $.ajax({
	        type: 'POST', // 데이터 전송 방식
	        url: '', // 요청을 보낼 서버의 URL
	        data: {content: content}, // 전송할 데이터
	        success: function(response) {
	          // AJAX 요청이 성공적으로 처리되면 실행되는 함수
	          console.log(response); // 서버에서 전달한 응답 데이터 출력
	        },
	        error: function(xhr, status, error) {
	          // AJAX 요청이 실패했을 때 실행되는 함수
	          console.error(error); // 오류 메시지 출력
	        }
	      });
	    });
	  });
	</script> -->


</body>
</html>