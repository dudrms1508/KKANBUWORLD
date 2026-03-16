<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        #mr_wrapper {
            width: 800px;
            height: auto;
        }

        #update {
            border-bottom: 1px solid #666;
            color: skyblue;
            font-weight: bold;
            width: 750px;
            height: 30px;
            margin: auto;
            margin-top: 20px;
            box-sizing: border-box;
        }

        #mr1 {
            width: 370px;
            height: 100px;
            float: left;
            margin-top: 10px;
            margin-left: 25px;
            box-sizing: border-box;
        }

        #mr2 {
            width: 370px;
            height: 100px;
            float: right;
            margin-top: 10px;
            margin-right: 25px;
            box-sizing: border-box;
        }
        
        #BoardTotal {
        	border-collapse: collapse;
        }

        #BoardTotal td {
            /* border-bottom: 1px solid #666; */
            border-bottom: 1px solid #ccc;
            width: 180px;
            height: 30px;
            padding: 3px;
        }

        #b-count {
            color: #4582b4;
            font-weight: bold;
        }

        #room {
            border-bottom: 1px solid #666;
            color: skyblue;
            font-weight: bold;
            width: 750px;
            height: 30px;
            float: left;
            margin: auto;
            margin-top: 10px;
            margin-left: 25px;
            box-sizing: border-box;
        }

        #mr3 {
            width: 750px;
            height: 400px;
            float: left;
            margin-top: 10px;
            margin-left: 25px;
        }

        #mr3 img {
            width: 100%;
            height: auto;
        }

        #say {
            border-bottom: 1px solid #666;
            color: skyblue;
            font-weight: bold;
            width: 750px;
            height: 30px;
            float: left;
            margin: auto;
            margin-top: 20px;
            margin-left: 25px;
            box-sizing: border-box;
        }

        #mr4 {
            width: 750px;
            height: auto;
            float: left;
            margin-top: 10px;
            margin-left: 25px;
        }

        a {
    	color: darkblue;
    	text-decoration: none;
    	}
        

        #text1, #text2, #text3 {
            float: left;
        }
        
        #text3 {
            margin-top: 5px;
        }

        #ilchonsay {

            width: 650px;
            height: 30px;
            text-indent: 0.2em;
            border-radius: 3px;
		}
        
        .ilchonsay1{
			border: none;
            width: 500px;
            height: 26px;
            text-indent: 0.2em;
            outline: none;
            box-sizing: border-box;
            resize: none;  	
        }
        .ilchonsay1:focus{
        	outline: none;
        }
        .ilchonhidden{
        	display: none;
        }               

        #f-name {
            color: skyblue;
        }

        #f-date {
            color: #999;
        }

        #textBtn {
            height: 30px;
            float: left;
            margin-left: 5px;
        }

        #blank {
            float: left;
            margin-top: 10px;
            width: 750px;
            height: 20px;
        }
    </style>

<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="${ path }/resources/js/GGAN.js"></script>

</head>
<body>
	<!-- 최신 게시글 -->
    <div id="mr_wrapper">
        <div id="update">
            <span>Update news</span>
        </div>
        <div id="mr1">
            <table id="updateBoard">
                <tr>
                	<c:if test="${ not empty boardList }">
                		<c:forEach var="board" items="${ photoList }">
		                    <td>
		                        [게시판] ${ board.title }
		                    </td>
		                </c:forEach>
                    </c:if>
                </tr>
                <tr>
                	<c:if test="${ not empty photoList }">
                		<c:forEach var="photo" items="${ photoList }">
		                    <td>
		                        [사진첩] ${ photo.title }
		                    </td>
		             	</c:forEach>
                	</c:if>
                </tr>
                <tr>
                	<c:if test="${ not empty diaryList }">
                		<c:forEach var="diary" items="${ diaryList }">
		                    <td>
		                        [다이어리] ${ diary.title }
		                    </td>
                    	</c:forEach>
                    </c:if>
                </tr>
            </table>
        </div>
        
        <!-- 게시글 당일 업로드 수, 총 업로드 수 -->
        <div id="mr2">
            <table id="BoardTotal">
                <tr>
                    <td>
                        다이어리 <span id="b-count">${ diaryDay } / ${ diaryTotal }</span>
                    </td>
                    <td>
                        사진첩 <span id="b-count">${ photoDay } / ${ photoTotal }</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        게시판 <span id="b-count">${ boardDay } / ${ boardTotal }</span>
                    </td>
                    <td>
                        방명록 <span id="b-count">${ visitorDay } / ${ visitorTotal }</span>
                    </td>
                </tr>
            </table>
        </div>
        
		<!-- 미니룸 사진 -->
        <div id="room">
            <span>Miniroom</span>
        </div>
        <div id="mr3">

          <img src="${ path }/resources/image/homepage/room.jpg">

        </div>
        
		<!-- 일촌평 -->
        <div id="say">
            <span>What friend say</span>
        </div>
        <div id="mr4">
            <!-- 홈피 주인이 아닐 경우 보이는 일촌평 작성 창 -->

            <c:if test="${integer != loginMember.no}">
            <div>
            	<input id="ilchonsay" name="ilchonsay" type="text" placeholder="일촌평을 작성 해주세요.">
            	<a href="#" id="ilchonSayinsert" onclick="insert()">등록</a>
            </div>
            </c:if>   
            
            <div>
                <table id="friendSay">                    
                    <c:forEach var="coment" items="${list}">
					<tr>
                    	<td id="f-content">                   		
                    	<textarea class="ilchonsay1" id="ilchonsaycoment${loginMember.no}and${coment.c_no}" readonly>${coment.coment}</textarea>
                   		<span id="f-name">${coment.c_writename}</span> 
                   		<span id="f-date"><fmt:formatDate value="${coment.create_date}" pattern="yyyy-MM-dd" /></span>
                    	<c:choose>
                    	<c:when test="${coment.c_writerno == loginMember.no }">						
                            <a href="javascript:void(0);" class="ilchonSayUpdate" id="updateilchonSay${loginMember.no}and${coment.c_no}" onclick="updateilchonSay('${loginMember.no}', '${coment.c_no}');">수정</a>
                            <a href="javascript:void(0);" class="ilchonhidden" id="updateComentilchonSay${loginMember.no}and${coment.c_no}" onclick="updateComentilchonSay('${loginMember.no}', '${coment.c_no}');">수정완료</a>
<%--                             <a href="${path}/minihome/ilchoneSay/delete/${minihomeNo}?loginMemberNo=${loginMember.no}cNo=${coment.c_no}" id="ilchonSayDelete${loginMember.no}cNo${coment.c_no}" onclick="deleteComent('${loginMember.no}', '${coment.c_no}')">삭제</a> --%>
						</c:when>
						<c:when test="${integer eq loginMember.no}">
                    	<a href="javascript:void(0);" id="ilchonSayDeletecNo${coment.c_no}" onclick="OwnerDelete('${coment.c_no}')">삭제</a>
                    	</c:when>
                    	</c:choose>
                    	</td>
                    </tr>
                    </c:forEach> 
                </table>
            </div>
        </div>
        <div id="blank"></div>
    </div>
    
    <script>
    
    
    
    var userName =  '${loginMember.name}';
    var loginMemberNo = '${loginMember.no}';
    var ownerNo = '${integer}';
    
    
    console.log(userName);
    console.log(loginMemberNo);
    console.log(ownerNo);	
    
		
		function insert(){
		var ilchonsay = $('input[name="ilchonsay"]').val();
		
		var param = {
				user_no : ${loginMember.no},
				ilchonsay,
				minihomeNo : ${minihomeNo},
				user_name : '${loginMember.name}'				
    	}    	
		ajaxJsonParam("${path}/minihome/ilchonsay/insert/${minihomeNo}", param, function(data){
			if(data){
				
				
				
			}
		});
		alert("등록이 완료되었습니다.");
		location.reload();
		}
		
	
	// 미니홈피 주인이 아닌 사람이 사용하는 일촌평 등록 이벤트
    
    function updateilchonSay(str1, str2){
    	let loginMemberNo = str1;
    	let cNo = str2;
    	let textareaId = 'ilchonsaycoment' + str1 + 'and' + str2;
    	let updateId = 'updateilchonSay' + str1 + 'and' + str2;    	
    	let updateDoneId = 'updateComentilchonSay' + str1 + 'and' + str2;
    	let deleteId = 'ilchonSayDelete' + str1 + 'cNo' +str2;
    	
    	console.log(textareaId);
    	
    	$('#' + textareaId).attr('readonly', false).focus();
    	$('#' + updateId).css('display', 'none');
    	$('#' + deleteId).css('display', 'none');
    	
    	$('#' + updateDoneId).css('display', 'block');   	
    	
    };
    
    function updateComentilchonSay(str1, str2){
    	let loginMemberNo = str1;
    	let cNo = str2;
    	
    	let textareaId = 'ilchonsaycoment' + str1 + 'and' + str2;
    	let updateId = 'updateilchonSay' + str1 + 'and' + str2;    	
    	let updateDoneId = 'updateComentilchonSay' + str1 + 'and' + str2;
    	let deleteId = 'ilchonSayDelete' + str1 + 'cNo' +str2;
    	let content = $('#' + textareaId).val();
    	
    	var param = {
    			user_no : ${loginMember.no},
    			cNo,
    			content,
    			user_name : '${loginMember.name}'
    	}
    	console.log(param);
    	 ajaxJsonParam("${path}/minihome/ilchonsay/update/${minihomeNo}", param, function(data){
           	if(data){       		
           		content = data.content;
           		
           		$('#' + updateDoneId).css('display','none');
           		$('#' + textareaId).css('readonly', true);
           		
           		$('#' + updateId ).css('display', 'inline');
		    	$('#' + deleteId ).css('display', 'inline');
           	}  
			});
    	 alert("수정 완료");
    	 location.reload();
    	 }
    
    function deleteComent(str1, str2){
    	let loginMemberNo = str1;
    	let cNo = str2;
    	
    	var answer;
    	
    	var param ={
    			cNo
    	}
    	
    	answer = confirm("댓글을 삭제하시겠습니까?");
    	
    	if(answer == true){
    		ajaxJsonParam("${path}/minihome/ilchonsay/userdelete/${minihomeNo}", param, function(data){
    			if(data){
    				
    			}
    			
    			});
    		alert("댓글이 삭제되었습니다.");
    		location.reload();
    	}
    	
    	
    }
    
    	function OwnerDelete(str1){
    		let cNo = str1;
    		
    		var answer;
    		
    		var param = {
    				cNo
    		}
    		
    		answer = confirm("댓글을 삭제하시겠습니까");
    		
    		if(answer == true){
    		
    		ajaxJsonParam("${path}/minihome/ilchonsay/delete/${minihomeNo}", param, function(data){
    			if(data){
    				
    			}
    			
    			});
    		alert("댓글이 삭제되었습니다.");
    		location.reload();
    		}
    	}// delete function
    

	

	
    </script>
</body>
</html>