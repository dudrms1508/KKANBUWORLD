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
    .content{heigt: 300px; width: 1000px; padding: 3px; background-color:orange;  margin-left: auto; margin-right: auto;}
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
    
    .ilchon td {
        justify-content: center;
    }

    .ilchon .information {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .ilchon .information .id {
        font-size:18px;
        font-weight:bold;
        display: inline-block;
    }
    
    #tab3Btn {
	  display: inline-block;
	  vertical-align: middle; /* 옆으로 배치된 요소를 수직 정렬합니다. */
	}

    .ilchon .information .nick {
        font-size:16px;
        color: rgb(245, 124, 77);
        margin-bottom: 3px;
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
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
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
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
	    text-align:center;
	    display:inline-block;
	}
	
	.pg_current_next { /* 현재의 다음 페이지 */
	    width:30px !important;
	    height:30px !important;
	    font-size:13px;
	    color:#fff;
	    font-weight:normal;
	    line-height:33px;
	    margin:0;
	    padding:0;
	    background:#ccc;
	    border:0;
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
	    text-align:center;
	    display:inline-block;
	}
	
	.pg_start { /* 처음 */
	    position:relative;
	    top:50%;
	    width:28px !important;
	    height:28px !important;
	    background:#fff;
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
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
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
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
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
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
	    /* border:1px solid #ccc; */
	    border: 0;
	    border-radius:5px;
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
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
	
	#tab3Btn img {
    	width: 20px;
    	height: 20px;
	}
	
	#modal-open {
	 float: right;
    /* position: relative; */
    bottom: 81px;
    right: 20px;
    font-size: 12px;
    padding: 3px;
    border: 1px solid rgb(245, 124, 77);
    background-color: transparent;
    color: #333;
    border-radius: 4px;
    cursor: pointer;
	}
	
	#modal-open already-ilchon{
	    float: right;
    /* position: relative; */
    bottom: 81px;
    right: 20px;
    font-size: 12px;
    border: 1px solid rgb(245, 124, 77);
    background-color: transparent;
    color: #333;
    border-radius: 4px;
    cursor: pointer;
	}
	
	.minimiImg {
	height:143px;
	}
	
</style> 
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<!-- 전체 회원의 아이디, 이름 검색 -->
	<div class="searchList">
    <h2>회원 목록 조회</h2> <br>
        <div class="searchContent">
            <div class="search-box">
                <form action="${ path }/webpage/ilchon/memberList" method="GET">
                    <select id="search" name="type" style="height: 30px; width: 100px; margin-right: 10px;">
                        <option value="">--- 전체 ---</option>
                        <option value="id">아이디</option>
                        <option value="name">이름</option>
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
	
	<form id="enrollForm" action="${ path }/ilchon/requestModal" method="POST">
		<section class="searchContent">
		<div class="ilchons">
		<table>
			<c:forEach var="list" items="${list}">
				<tr class="ilchon">
					<td class="memberList">
						<a href="#"><img class="minimiImg" src="${ path }/${list.minimi}" alt=""></a>
					</td>
					<td class="information">
						<span class="id">${list.name}</span>
						<span class="nick">${list.id}</span>
					</td>
				   	<td class="information">
	                <div class="modal-btn-box">
	                    <c:forEach var="ilchon" items="${ilchons}">
	                     <c:set var="ilchons" value="${ilchons}" />
	                         <c:if test="${ list.no eq ilchon.ilchonNo }">
	                             <input value="이미 일촌" type="button" id="modal-open already-ilchon" class="modal-open already-ilchon" disabled>
	                         </c:if>
	                    </c:forEach>
	                    <c:forEach var="request" items="${request}">
	                     <c:set var="request" value="${request}" />
	                         <c:if test="${ list.no eq request.receiver }">
	                             <input value="신청 중" type="button" id="modal-open already-ilchon" class="modal-open already-ilchon" disabled>
	                         </c:if>
	                    </c:forEach>
	                    <c:forEach var="exceptIlchons" items="${exceptIlchons}">
	                     <c:set var="exceptIlchons" value="${exceptIlchons}" />
	                     	<c:if test="${ list.no eq exceptIlchons.no}">
	                     		<input value="일촌신청" type="button" id="modal-open" class="modal-open" onclick="openModal('${path}/webpage/ilchon/requestModal?no=${list.no}')">
	                            <%-- <input value="일촌신청" type="button" id="modal-open" class="modal-open" onclick="javascrit:window.open('${ path }/webpage/ilchon/requestModal?no=${ list.no }','popup_1','width=450px,height=500px,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,left=300px,top=100px')"> --%>
	                         </c:if>
	                    </c:forEach>
	                    <c:if test="${loginMember.no eq list.no }">
	                        <input value="이건 나" type="button" id="modal-open already-ilchon" class="modal-open already-ilchon" disabled>
	                    </c:if>
	                </div>
	            	</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<div class="clearfix"></div>
		</section>
		</form>
	
	
	
	<!-- 일촌리스트 페이징 처리 -->
	<div class="pagecontent">
		<div id="pageBar" class="pg_wrap">
			<!-- 맨 처음으로 (현재 페이지) -->
			<button class="pg_start" onclick="location.href='${ path }/webpage/ilchon/memberList?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button class="pg_prev" onclick="location.href='${ path }/webpage/ilchon/memberList?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  5개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when  test="${ status.current == pageInfo.currentPage}">
						<button class="pg_current" disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>						
						<button class="pg_current_next" onclick="location.href='${ path }/webpage/ilchon/memberList?page=${ status.current }'">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button class="pg_next" onclick="location.href='${ path }/webpage/ilchon/memberList?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button class="pg_end" onclick="location.href='${ path }/webpage/ilchon/memberList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	function openModal(url) {
	  var popup = window.open(url, 'popup_1', 'width=450px,height=500px,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,left=300px,top=100px');
	
	}
</script>

	
</body>
</html>