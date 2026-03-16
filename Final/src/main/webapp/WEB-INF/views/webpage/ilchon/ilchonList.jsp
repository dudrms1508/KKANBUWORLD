<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>일촌 검색</title>
	<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

	<link rel="stylesheet" href="${ path }/resources/css/header.css">
	<link rel="stylesheet" href="${ path }/resources/css/footer.css">

<style>
    div, table, tr, td {margin:0; padding:0;}
    table {border-collapse: collapse;}
    .searchContent{width: 1000px; padding: 20px; border:1px solid #ddd; display:flex; margin-left: auto; margin-right: auto;}
    .content{heigt: 300px; width: 1000px; padding: 3px; background-color:orange; align-items: center; justify-content: center; margin-top: auto; margin-left: auto; margin-right: auto;}
    .pagecontent{display: flex;, justify-content: center; heigt: 300px; width: 1000px; padding: 3px; background-color:orange;  margin-left: auto; margin-right: auto;}

    *{
	  margin:0;
	  padding:0;
	  box-sizing: border-box;
	}

    .searchList{
        width: 1000px;
        margin-top: auto;
        margin-left: auto;
        margin-right: auto;
       justify-content: center;
       align-items: center;
    }
    
    .search-box {
        padding: 10px;
        width: 80%;
        justify-content: center;
        align-items: center;
	}
	
    .search-btn {
        color: #EDEDED;
        /* float: right; */
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background: rgb(243, 156, 18);
        /* display: flex; */
        align-items: center;
        justify-content: center;
        border: none;
    }

    .ilchons {
        font-size: 24px;
        color: #545454;
        margin-left: auto; 
        margin-right: auto;
        /* margin-top:60px;
        margin-bottom: 60px; */
        text-align: center;
        }
        
	.follow{
        /* display: block; */
        width: 200px;
        text-align: center;
        text-decoration:none;
        color: black;
        float:left;
        margin-left: 30px;
        margin-right: 30px;
        margin-bottom: 30px;
        }

	.ilchon {
		margin: auto;
	}

    .ilchon-id{
        margin-top: 20px;
        margin-bottom: 4px;
    }
    
	.ilchon-name{
		color: #545454;
		font-size: 10px;
	}

    .clearfix{
    	clear: both;
    }
	
	
   /* 일촌리스트 보기 페이지 */
    .ilchon {
        width: 190px;
        text-align: center;
        text-decoration:none;
        color: black;
        float:left;
        margin-top: 20px;
        margin-left: 20px;
        margin-right: 20px;
        margin-bottom: 20px;
        border:1px solid gold;
        padding:10px 10px 10px 10px;
        justify-content: center;
    }
        
    .memberList img {
        width: 150px;
        margin: auto;
        display:inline-block;
        position:relative;
        margin: auto;
        justify-content: center;
    }

    .ilchon td {
        text-align: center;
    }

    .ilchon .information {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-bottom: 10px;
    }
    
    .ilchon .information .id {
        font-size:15px;
        font-weight:bold;
        margin-bottom: 5px;
    }

    .ilchon .information .nick {
        font-size:13px;
        color: rgb(245, 124, 77);
    }
    
	div.content {
		justify-content: center;
	}

    #pageBar {
    	margin: auto;
    	display:inline-block;
    }
    .pg_wrap { clear:both;  margin: auto;}
	.pg_page { /* 기본페이지 */
	    width:30px !important;
	    height:30px !important;
	    font-size:13px;
	    color:#333;
	    line-height:33px;
	    padding:0;
	    background:#fff;
	    border:0;
	    border-radius:2px;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    text-align:center;
	    display:inline-block;
	}
	.pg_page:hover {
	    background:#f2f2f2;
	}
	.pg_current { /* 현재페이지 */
	    width:30px !important;
	    height:30px !important;
	    font-size:13px;
	    color:#fff;
	    font-weight:normal;
	    line-height:33px;
	    margin:0;
	    padding:0;
	    background:rgb(245, 124, 77);
	    border:0;
	    border-radius:2px;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    text-align:center;
	    display:inline-block;
	}
	.pg_start { /* 처음 */
	    position:relative;
	    top:50%;
	    width:28px !important;
	    height:28px !important;
	    background:#fff;
	    border:1px solid #ccc;
	    border-radius:2px;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    text-indent:-9999px;
	    display:inline-block;
	}
	.pg_start:after {
	    position:absolute;
	    top:10px;
	    left:10px;
	    content:"";
	    width:6px;
	    height:6px;
	    border-top:1px solid transparent;
	    border-right:1px solid transparent;
	    border-bottom:1px solid #777;
	    border-left:1px solid #777;
	    transform:rotate(45deg);
	}
	.pg_start:before {
	    position:absolute;
	    top:10px;
	    left:16px;
	    content:"";
	    width:6px;
	    height:6px;
	    border-top: 1px solid transparent;
	    border-right: 1px solid transparent;
	    border-bottom: 1px solid #777;
	    border-left: 1px solid #777;
	    transform:rotate(45deg);
	}
	.pg_start:hover {
	    background:#fff;
	    border:1px solid #333;
	}
	.pg_prev { /* 이전 */
	    position:relative;
	    top:50%;
	    width:28px !important;
	    height:28px !important;
	    background:#fff;
	    border:1px solid #ccc;
	    border-radius:2px;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    text-indent:-9999px;
	    display:inline-block;
	}
	.pg_prev:after {
	    position:absolute;
	    top:10px;
	    left:13px;
	    content:"";
	    width:6px;
	    height:6px;
	    border-top:1px solid transparent;
	    border-right:1px solid transparent;
	    border-bottom:1px solid #777;
	    border-left:1px solid #777;
	    transform:rotate(45deg);
	}
	.pg_prev:hover {
	    background:#fff;
	    border:1px solid #333;
	}
	.pg_next { /* 다음 */
	    position:relative;
	    top:50%;
	    width:28px !important;
	    height:28px !important;
	    background:#fff;
	    border:1px solid #ccc;
	    border-radius:2px;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    text-indent:-9999px;
	    display:inline-block;
	}
	.pg_next:after {
	    position:absolute;
	    top:10px;
	    right:13px;
	    content:"";
	    width:6px;
	    height:6px;
	    border-top:1px solid #777;
	    border-right:1px solid #777;
	    border-bottom:1px solid transparent;
	    border-left:1px solid transparent;
	    transform:rotate(45deg);
	}
	.pg_next:hover {
	    background:#fff;
	    border:1px solid #333;
	}
	.pg_end { /* 맨끝 */
	    position:relative;
	    top:50%;
	    width:28px !important;
	    height:28px !important;
	    background:#fff;
	    border:1px solid #ccc;
	    border-radius:2px;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    text-indent:-9999px;
	    display:inline-block;
	}
	.pg_end:after {
	    position:absolute;
	    top:10px;
	    right:10px;
	    content:"";
	    width:6px;
	    height:6px;
	    border-top:1px solid #777;
	    border-right:1px solid #777;
	    border-bottom:1px solid transparent;
	    border-left:1px solid transparent;
	    transform:rotate(45deg);
	}
	.pg_end:before {
	    position:absolute;
	    top:10px;
	    right:16px;
	    content:"";
	    width:6px;
	    height:6px;
	    border-top:1px solid #777;
	    border-right:1px solid #777;
	    border-bottom:1px solid transparent;
	    border-left:1px solid transparent;
	    transform:rotate(45deg);
	}
	.pg_end:hover {
	    background:#fff;
	    border:1px solid #333;
	}
	#nickButton {
		width: 80px;
	}
	
	.tab3Btn {
	  background-color: transparent;
	  border: none;
	}
	
	.icon {
	  display: flex;
	  justify-content: center;
	  justify-content: space-between;
	  align-items: center;
	  width: auto;
	  margin: auto;
	  display:inline-block;
      position:relative;
	}
	
	.icon a {
	  padding: 0 3px;
	  margin: auto;
	}
	
	.minimiImg {
	height:143px;
	}
	
</style> 
</head>

<body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- 일촌의 아이디, 이름, 일촌명 검색 -->
	<div class="searchList">
	<br><br>
    <h2>나의 일촌 리스트</h2> <br>
        <div class="searchContent">
            <div class="search-box">
                <form action="${ path }/webpage/ilchon/ilchonList" method="GET">
                    <select id="search" name="type" style="height: 30px; width: 100px; margin-right: 10px;">
                        <option value="">--- 전체 ---</option>
                        <option value="id">아이디</option>
                        <option value="name">이름</option>
                        <option value="nick">일촌명</option>
                    </select>
                   
                    
                    <!-- 검색어 입력 부분 -->
                    <input type="text" style="height: 30px;" id="input_select" class="search-txt" name="keyword" placeholder="검색어를 입력하세요.">
                    <button class="search-btn" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
	</div>
            
	<br>
	
	<div class="content" style="height: 33px;">
	<h4 style="color: white;">내 일촌 (총${listCount}명)</h4>
     </div>
     
	<section class="searchContent">
     	<div class="ilchons">
	     	<c:if test="${ empty ilchon }">
				<tr>
					<td colspan="6">아직 일촌이 없습니다.</td>
					<br><br>
					<span style="font-size">일촌을 찾아 떠나볼까요?</span>
					<td><a href="${ path }/webpage/ilchon/memberList"><img src="${path}/resources/image/ilchon/support.png" width="40"></a></td>
				</tr>	
			</c:if>
	     	<c:if test="${ not empty ilchon }">
			<form action="${ path }/webpage/ilchon/ilchonList" method="GET">
				<table>
					<c:forEach var="ilchon" items="${ilchon}">
						<tr class="ilchon">
							<td class="memberList">
								<%-- <a href="#"><img src="${ path }/resources/image/profile/noProfile.png" alt=""></a> --%>
								<a href="#"><img class="minimiImg" src="${ path }/${ilchon.member.minimi}" alt=""></a>
							</td>
							<td class="information">
								<span class="id">${ilchon.member.name} (${ilchon.member.id})</span>
								<span class="nick">${ilchon.ilchonNick}</span>
								<%-- 							
								<div id = "titleWrapper">
									<input id="ilchonNickText" type="text" class="nick" value="${ilchon.ilchonNick}">
									<button id = "btnTitleUpdate" onclick="editTitle();">수정</button>
									<button id = "btnTitleUpdateDone" onclick="editTitleDone();" style="display: none;">수정완료</button>
								</div> 
								--%>
							</td>
							<td>
							<div class="icon">
								<a href="#"><img src="${ path }/resources/image/ilchon/edit.png" width="25"></a>
								<a href="#" class="ilchonMinihomeBtn" id="tab3"><img src="${ path }/resources/image/ilchon/homebutton.png" width="25"></a>
								<a href="${path}/webpage/message/sendMessage?no=${ilchon.ilchonNo}" class="open-popup"><img src="${path}/resources/image/ilchon/icon-letter.png" width="28" height="30"></a>
								<a href="${ path }/webpage/ilchon/ilchonDelete/${ilchon.ilchonNo}" class="" onclick="return confirm('정말 일촌을 삭제하시겠습니까?');"><img src="${path}/resources/image/ilchon/cancel.png" width="25"></a>
							</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			</c:if>
		</div>
		<div class="clearfix"></div>
	</section>
	
	
	<!-- 일촌리스트 페이징 처리 -->
	<div class="pagecontent">
		<div id="pageBar" class="pg_wrap">
			<!-- 맨 처음으로 (현재 페이지) -->
			<button class="pg_start" onclick="location.href='${ path }/webpage/ilchon/ilchonList?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button class="pg_prev" onclick="location.href='${ path }/webpage/ilchon/ilchonList?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  5개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when  test="${ status.current == pageInfo.currentPage}">
						<button class="pg_current" disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>						
						<button onclick="location.href='${ path }/webpage/ilchon/ilchonList?page=${ status.current }'">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button class="pg_next" onclick="location.href='${ path }/webpage/ilchon/ilchonList?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button class="pg_end" onclick="location.href='${ path }/webpage/ilchon/ilchonList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>

<!-- 팝업 관련 스크립트 -->
<script>
$(document).ready(function() {
    // 팝업 열기
    $(".open-popup").click(function(event) {
        event.preventDefault(); // a 태그의 기본 동작을 중단
        var url = $(this).attr("href");
        var name = "popup_" + Math.floor(Math.random() * 1000); // 팝업 이름을 랜덤으로 생성
        var specs = "width=400,height=420,scrollbars=no"; // 팝업 스펙 설정
        window.open(url, name, specs); // 새 창 열기
    });

	$('.ilchonMinihomeBtn').on("click", function() {
		 
		let popUrl = "${ path }/minihome/minihomepage/${minihome.minihomeNo}";
		let popOption = "width = 1200px, height=720px, top=300px, left=300px, scrollbars=yes";
		console.log(popUrl)
		
		window.open(popUrl,"미니홈피",popOption);
		
		});
	
	function editTitle() {
		const btnTitleUpdate = document.getElementById("btnTitleUpdate");
	    const btnTitleUpdateDone = document.getElementById("btnTitleUpdateDone");
		
	    btnTitleUpdate.style.display = "none";
	    btnTitleUpdateDone.style.display = "inline";
	    
	}

	function editTitleDone() {
		const btnTitleUpdate = document.getElementById("btnTitleUpdate");
	    const btnTitleUpdateDone = document.getElementById("btnTitleUpdateDone");
	    
	    let ilchonNick = $('#ilchonNickText').val();
		    
		$.ajax({
			url: '${ path }/ilchon/ilchonNickUpdate/${ilchonNo}',
			type: 'get',
			dataType: 'json',
			data: {
				ilchonNick
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

	
});


</script>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
           
</body>
</html>