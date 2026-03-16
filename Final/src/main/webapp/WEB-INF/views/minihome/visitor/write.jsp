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
<title>방명록</title>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<style>
    #visitorwrapdiv {
/*         border: 1px solid lightpink; */
        width: 780px;
        margin: 0 auto;
    }

    #visitorformdiv {
        /* border: 1px solid red; */
        height: 180px;
        padding: 20px;
    }

    #visitorformdiv>form {
        height: 100%;
        width: 100%;
        /* border: 1px solid black; */
    } 

    #writewrapdiv {
        border-top: 1px solid gainsboro;
        border-bottom: 1px solid gainsboro;
        height: 100%;
        width: 100%;
    }

    #visitorformdiv .visitorwriteareadiv {
        float: left;
        height: 100%;
        box-sizing: border-box;
        /* border: 1px solid blue; */
        background-color: whitesmoke;
    }

    #formleftdiv {  
        width: 30%;
        padding: 10px;
        /* border: 1px solid salmon; */
    }

    #formleftdiv>div {
        margin: 0 auto;
        /* border: 1px solid saddlebrown; */
        height: 100%;
        width: 90%;
    }
    
    .minimiImgdiv {
        /* border: 1px solid red; */
        box-sizing: border-box;
        width: 100%;
        height: 80%;
        padding: 0 10px;
    }

    .minimiImgdiv>img {
        width: 100%;
        height: 100%;
    }

    #selectminimidiv {
        float: right;
        margin: 5px 10px 0 0;
    }

    
    #formrightdiv {
        width: 70%;
        padding: 10px;
        /* border: 1px solid salmon; */
    }

    #formrightdiv>div {
        margin: 0 auto;
        /* border: 1px solid saddlebrown; */
        height: 100%;
        width: 100%;
    }

    .textareasizediv {
        width: 100%;
        height: 80%;
        /* border: 1px solid red; */
        box-sizing: border-box;
    }

    .visitortextarea {
        width: 100%;
        height: 100%;
        resize: none;
        padding: 5px;
        box-sizing: border-box;
    }

    #writebtndiv {
        /* border: 1px solid darkblue; */
        height: 20%;
        padding-top: 5px;
        display: flex;
        justify-content: end;
        box-sizing: border-box;
    }

    #checkboxdiv {
        margin-right: 15px;
    }

    #writebtn>button {
        background-color: whitesmoke;
        border: 1px solid darkgray;
        border-radius: 4px;
    }

    #visitorlistdiv {
/*         border: 1px solid lightpink; */
        padding: 20px;
        /* margin-bottom: 30px; */
    }

    #visitorlistdiv>#contentviewdiv {
        /* border-top: 1px solid violet; */
        /* border-bottom: 1px solid violet; */
        /* background-color: whitesmoke; */
        background-color: transparent;
        width: 100%;
        height: 200px;
        /* height: 100%; */
        box-sizing: border-box;
    }

    #listtopbardiv {
        background-color: whitesmoke;
        height: 15%;
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        vertical-align: middle;
    }

    #listtopbardiv>div {
        float: left;
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }

    #topbarleftdiv {
        /* border: 1px solid red; */
        font-size: 14px;
        width: 70%;
        height: 100%;
        padding-left: 10px;
    }

    #topbarrightdiv {
        /* border: 1px solid red; */
        font-size: 14px;
        width: 30%;
        height: 100%;
        justify-content: flex-end;
        padding-right: 10px;
    }

    #visitorviewdiv {
        width: 100%;
        height:85%;
        /* border: 1px solid black; */
    }

    #visitorviewdiv>div {
        float: left;
        /* border: 1px solid salmon; */
        padding: 10px;
        box-sizing: border-box;
    }

    .visitorviewleft {
        width: 30%;
        height: 100%;
    }

    .visitorviewleft>div {
        margin: 0 auto;
        height: 100%;
        width: 90%;
    }
    
    .visitorviewright {
        width: 70%;
        height: 100%;
    }

    .visitorviewleft>div {
        margin: 0 auto;
        height: 100%;
        width: 90%;
    }

    .viewtextareadiv {
        box-sizing: border-box;
        width: 100%;
        height: 80%;
        padding: 0 10px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .viewminimiImgdiv {
        box-sizing: border-box;
        width: 100%;
        height: 80%;
        padding: 0 10px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .viewminimiImgdiv>img {
        width: 100%;
        height: 90%;
    }

    /* 수정할 때는 css 바뀌도록 */
    .viewtextarea {
        width: 100%;
        height: 90%;
        resize: none;
        padding: 5px;
        box-sizing: border-box;
        outline: none;
        border: 0;
        background-color: transparent;
    }


    #replydiv {
        /* padding: 0 10px; */
        background-color: whitesmoke;
        border-radius: 15px
    }

    #replydiv>form>div {
        display: flow-root;
        padding: 0 10px;
        background-color: transparent; 
    }

    #replyinnerdiv {
        height: 100%;
    }

    #replyinnerdiv>div {
        float: left;
        box-sizing: border-box;
    }

    #replyuserdiv {
        width: 15%;
        text-align: center;
        /* margin-right: 15px; */
    }

    #replycontentdiv {
        width: 70%;
    }

    #replycontentdiv>div {
        width: 100%;
        height: auto;
    }

    #replytbtndiv {
        height: 25px;
        width: 15%;
        /* border: 1px solid red; */
    }

    #replytbtndiv>div {
        width: 100%;
        height: 100%;
        text-align: right;
    }

    #replytbtndiv>div>button {
        height: 100%;
        margin-left: 5px;
        background-color: whitesmoke;
        border: 1px solid darkgray;
        border-radius: 4px;
    }

    .depthreply {
        padding: 0 10px;
    }

    .depthreply>div {
        display: flow-root;
        /* padding: 0 10px; */
    }


    .depthreply {
        margin-left: 10px;
    }

    .depthinner>div {
        float: left;
        box-sizing: border-box;
    }

    .depthuserdiv {
        width: 20%;
        text-align: center;
        /* margin-right: 10px; */
    }

    .depthinnercontent {
        width: 65%;
    }

    .depthinnercontent>div {
        width: 100%;
        height: auto;
    }


    #depthreplytextarea {
/*         width: 100%;
        resize: none;
        padding: 2px 5px;
        box-sizing: border-box;
        background-color: white;
        overflow-y: hidden;
        height: auto; */
    }   

    .readonlytextarea {
        outline: none;
        border: 0;
        cursor: default;
        width: 100%;
        resize: none;
        padding: 2px 5px;
        box-sizing: border-box;
        background-color: transparent;
        overflow-y: hidden;
    }

    .readonlytextarea:focus {
        outline: none;
    }
    
    .writereplywrapdiv {
    	height: 100%;
    }
    

    .writereplywrapdiv>div {
    	height: 100%;
        padding: 0 10px;
    }

    .writereplydiv>div {
        float: left;
        box-sizing: border-box;
        margin: 10px 0;
        /* display: flow-root; */
    }

    .replywriteuserdiv {
        width: 15%;
        padding-left: 20px;
        /* margin-right: 15px; */
    }


    .replywritebtn {
        height: 30px;
        width: 15%;
    }

    .replywritebtn>div {
        width: 100%;
        height: 100%;
        margin-left: 10px;
/*         text-align: right; */
    }

    .replywritebtn>div>button {
        height: 100%;
        background-color: whitesmoke;
        border: 1px solid darkgray;
        border-radius: 4px;
    }

    .wirtereplytextareadiv {
        width: 70%;
        height: 100%;
    }

    .wirtereplytextareadiv>div {
        width: 100%;
        height: 70%;
    }

    .wirtereplytextareadiv>div>textarea {
        width: 100%;
        height: 100%;
        padding: 2px 5px;
        resize: none;
        box-sizing: border-box;
    }

	
    #secretlisttopbardiv {
        background-color: whitesmoke;
        height: 15%;
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        vertical-align: middle;
    }

    #secretlisttopbardiv>div {
        float: left;
        box-sizing: border-box;
        display: flex;
        align-items: center;
        background-color: rgba(243, 156, 18, 0.8);
    }
    
    a {
    	color: darkblue;
    	text-decoration: none;
    }

	.hiddenReplyupdate {
		display: none;
	}
	
	 .btmbtndiv {
        text-align: center;
    }
    
    .btmbtndiv button {
       	background-color: transparent;
    	border: 0;
    }
    
    .depth0writeform {
     	display: none; 
    }
    
    .depthupdateDonebtn {
    	display: none;
    }
    


</style>
</head>
<body>
    <div id="visitorwrapdiv">
        <!-- 주인장한테만~ -->
        <div style="text-align: right; padding-right: 25px">
            <button>글꼴설정</button>
            <button>방명록관리</button>
        </div>
        <!-- form 태그 상위 div -->
        <div id="visitorformdiv">
            <!-- 글 쓸 수 있는 form -->
            <form action="${ path }/minihome/visitor/write/${ minihomeNo }" method="post">
                <div id="writewrapdiv">
                    <div id="formleftdiv" class="visitorwriteareadiv">
                        <div>
                            <div class="minimiImgdiv">
                                <img src="${ path }/${ loginMember.minimi }" alt="">
                            </div>
                            <div id="selectminimidiv">
                                <select name="" id="">
                                    <option value="">미니미</option>
                                    <option value="">프로필사진</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div id="formrightdiv" class="visitorwriteareadiv">
                        <div>
                            <div class="textareasizediv">
                                <textarea name="visitorContent" class="visitortextarea"></textarea>
                            </div>
                            <div id="writebtndiv">
                                <div id="checkboxdiv">
                                    <label>
                                        <input type="checkbox" id="secretCheck" name="secretCheck">비밀이야
                                    </label>
                                </div>
                                <div id="writebtn">
                                    <button>확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
        
        <!-- c:if 시작 -->
        <c:if test="${ not empty visitorList }">
        <c:forEach var="list" items="${ visitorList }">
        	<!-- 비밀이 아님 -->
        	<c:if test="${ list.secret == 'N' }">
	        <div id="visitorlistdiv">
	            <div id="contentviewdiv">
	                <div id="listtopbardiv">
	                    <div id="topbarleftdiv">
	                        <span><b>no.${ list.rowNum } &nbsp;</b></span>
	                        <span><a href="">${ list.writer.name }</a>&nbsp;</span>
	                        <span><a href=""><img style="width: 20px; height: 20px; color: rgba(243, 156, 18);" src="${ path }/resources/image/home/homecolor.png" alt=""></a>&nbsp;</span>
	                        <span>
	                        <c:if test="${ list.createDate eq list.modifyDate }">(<fmt:formatDate value="${ list.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</c:if>
	                        <c:if test="${ list.createDate ne list.modifyDate }">(수정됨 : <fmt:formatDate value="${ list.modifyDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</c:if>
	                        
	                        </span>
	                    </div>
	                    <div id="topbarrightdiv">
	                        <c:if test="${ list.writer.no eq loginMember.no }">
	                        	<span><a href="">비밀로하기</a></span>
		                        <span>&nbsp;|&nbsp;</span>
		                        <span><a href="${ path }/minihome/visitor/update/${ minihomeNo }?visitorNo=${ list.visitorNo }">수정</a></span>
		                        <span>&nbsp;|&nbsp;</span>
		                        <span><a href="${ path }/minihome/visitor/delete/${ minihomeNo }?visitorNo=${ list.visitorNo }" id="deleteAtag" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></span>
<!-- 	                        	<span>&nbsp;|&nbsp;</span> -->
	                        </c:if>
	                        <c:if test="${ list.writer.no ne loginMember.no && minihomeUser.member.no eq loginMember.no }">
							   <span><a href="">비밀로하기</a></span>
							   <span>&nbsp;|&nbsp;</span>
							   <span><a href="${ path }/minihome/visitor/delete/${ minihomeNo }?visitorNo=${ list.visitorNo }" id="deleteAtag" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></span>
							</c:if>
	                        <c:if test="${ list.writer.no ne loginMember.no && minihomeUser.member.no ne loginMember.no }">
		                        <span><a href="${ path }/minihome/visitor/report/${ minihomeNo }?visitorNo=${ list.visitorNo }&reportCode=${ list.reportCode }" 
		                        		onclick="window.open(this.href, '신고하기', 'width=350, height=340, top=200, left=300'); return false;">신고</a></span>
	                        </c:if>
	                    </div>
	                </div>
	                <div id="visitorviewdiv">
	                    <div class="visitorviewleft">
	                        <div class="viewminimiImgdiv">
	                            <img src="${ path }/${ list.writer.minimi }" alt="">
	                        </div>
	                    </div>
	                    <div class="visitorviewright">
	                        <div class="viewtextareadiv">
	                            <textarea name="" class="viewtextarea" readonly>${ list.content }</textarea>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <!-- 댓글 시작 -->
	            <div id="replydiv">
	            <c:if test="${ not empty list.replies }">
	            	<c:forEach var="replies" items="${ list.replies }" varStatus="repliesStatus">
	            		<!-- 원댓 -->
	            		<c:if test="${ replies.depth eq 0 }">
		                <form action="">
		                <div id="replyinnerdiv">
		                    <div id="replyuserdiv">
		                        <div>
		                            <a href="" >${ replies.writer.name }</a>
		                        </div>
		                    </div>
		                    <div id="replycontentdiv">
		                        <div id="replytextareadiv">
		                           <textarea class="readonlytextarea" id="textarea_visitorNo${list.visitorNo}vreNo${replies.vreNo}" readonly>${ replies.content }</textarea>
		                        </div>
		                    </div>
		                    <div id="replytbtndiv">
		                        <div class="updatehiddendiv">
		                        	<a href="javascript:void(0);" id="depthReply_visitorNo${list.visitorNo}vreNo${replies.vreNo}" onclick="depthReply('${ list.visitorNo }', '${ replies.vreNo }', '${ replies.step }', '${ replies.depth }');">답글</a>
		                        	<c:if test="${ replies.writer.no eq loginMember.no }">
			                        	<a href="javascript:void(0);" class="visibleReplyupdate" id="updateReply_visitorNo${list.visitorNo}vreNo${replies.vreNo}" onclick="updateReply('${ list.visitorNo }', '${ replies.vreNo }');">수정</a>
			                        	<a href="javascript:void(0);" class="hiddenReplyupdate" id="updateReplyDone_visitorNo${list.visitorNo}vreNo${replies.vreNo}" onclick="updateReplyDone('${ list.visitorNo }', '${ replies.vreNo }');">수정완료</a>
			                        	<a href="${ path }/minihome/visitor/deleteReply/${minihomeNo}?visitorNo=${ list.visitorNo }&vreNo=${ replies.vreNo }" id="deleteReply_visitorNo${list.visitorNo}vreNo${replies.vreNo}">삭제</a>
		                        	</c:if>
		                        </div>
		                    </div>    
		                </div>
		                </form>
		                </c:if>
		                
		                <!-- 댓글의 댓글 depth로 시작  -->
	                	<c:forEach var="depthReply" items="${ list.replies }" >
		                <c:if test="${ depthReply.depth ne 0 && depthReply.group eq replies.vreNo }">
		                		<!-- 여기 대댓글은 해당 vre_no로 묶인 group + depth가 0이 아니며 step으로 나열됨  -->
<%-- 		                	<c:forEach></c:forEach> --%>
			                <form action="">
			                <div class="depthreply">
			                    <div class="depthinner">
			                        <div class="depthuserdiv">
			                            <div>
			                                └ <a href="" style="text-decoration: none; color: darkblue" >${ depthReply.writer.name }</a>
			                            </div>
			                        </div>
			                        <div class="depthinnercontent">
			                            <div class="depthtextarea">
			                                <textarea name="" id="depthtextareaContent_visitorNo${ list.visitorNo }vreNo${ depthReply.vreNo }depth${ depthReply.depth }" 
			                                class="readonlytextarea" readonly>${ depthReply.content }</textarea>
			                            </div>
			                        </div>
			                        <c:if test="${ depthReply.writer.no eq loginMember.no }">
			                        <div id="replytbtndiv" class="depthbtndiv">
			                            <div>
				                        	<a href="javascript:void(0);" id="depthupdate_visitorNo${ list.visitorNo }vreNo${ depthReply.vreNo }depth${ depthReply.depth }" onclick="depthupdate('${ list.visitorNo }', '${ depthReply.vreNo }', '${ depthReply.step }', '${ depthReply.depth }')">수정</a>
			                            	<a href="javascript:void(0);" id="depthupdateDone_visitorNo${ list.visitorNo }vreNo${ depthReply.vreNo }depth${ depthReply.depth }" class="depthupdateDonebtn" onclick="depthupdateDone('${ list.visitorNo }', '${ depthReply.vreNo }', '${ depthReply.step }', '${ depthReply.depth }', '${ depthReply.group }')">수정완료</a>
				                        	<a href="javascript:void(0);" id="depthdelete_visitorNo${ list.visitorNo }vreNo${ depthReply.vreNo }depth${ depthReply.depth }" onclick="depthdelete('${ list.visitorNo }', '${ depthReply.vreNo }', '${ depthReply.step }', '${ depthReply.depth }', '${ depthReply.group }')">삭제</a>
			                            </div>
			                        </div> 
			                        </c:if>   
			                    </div>
			                </div>
			                </form>
		                <!-- 댓글의 댓글 c:if 끝 -->
			            </c:if>
		                <!-- 답댓 돌릴거임 -->
		                </c:forEach>
			            
			            
    					<!-- 댓글의 댓글에다가 답글 누르면 나오는 폼 depth0에다가 작성하는거임 작성 폼 기본 none -->
		            	<form action="" id="replybtndiv_vreNo${ replies.vreNo }" class="depth0writeform" >
			                <div class="depthreply" >
			                    <div class="depthinner">
			                        <div class="depthuserdiv">
			                            <div>
			                                └ <a href="" style="text-decoration: none; color: darkblue" >${ loginMember.name }</a>
			                            </div>
			                        </div>
			                        <div class="depthinnercontent">
			                            <div class="depthtextarea">
			                                <textarea name="" id="depthtextarea_visitorNo${ list.visitorNo }vreNo${ replies.vreNo }depth${ replies.depth }" class="readonlytextarea" readonly>@${ replies.writer.name } </textarea>
			                            </div>
			                        </div>
			                        <div id="replytbtndiv" class="depthbtndiv">
			                            <div>
			                            	<button type="button" onclick="depthReplyDone('${ list.visitorNo }', '${ replies.vreNo }', '${ replies.step }', '${ replies.depth }');" >작성</button>
			                                <button type="button" onclick="replycancelbtn('${replies.vreNo}');">취소</button>
			                            </div>
			                        </div>    
			                    </div>
			                </div>
		                </form>
       			    <!-- 댓글 c:forEach 끝 -->
			        </c:forEach>
	            <!-- 댓글 c:if 끝 -->
	     		</c:if>
	     		
	     			<!-- 댓글 작성칸 -->
					<form action="${ path }/minihome/visitor/writeReply/${ minihomeNo }" method="post" >
		                <div class="writereplywrapdiv">
		                    <div class="writereplydiv">
		                        <div class="replywriteuserdiv">
		                            <div>
		                                <span>${ loginMember.name }</span>
		                            </div>
		                        </div>
		                        <div class="wirtereplytextareadiv">
		                            <div class="">
		                                <textarea name="replycontent" id="wirtereplytextarea"></textarea>
                            		    <input type="hidden" name="visitorNo" value="${ list.visitorNo }">
		                            </div>
		                        </div>
		                        <div id="" class="replywritebtn">
		                            <div>
		                                <button>작성</button>
		                            </div>
		                        </div>    
		                    </div>
		                </div>
	                </form>

		        <!-- replydiv 끝. 댓글 끝 -->
	            </div>
	        <!-- visitorlistdiv 끝 -->
	        </div>
	        <!-- 비밀아닌거 끝 -->
	        </c:if>
	        
	          
	        <!-- 비밀인거 시작 -->
	        <c:if test="${ list.secret == 'Y' }">
	        <c:if test="${ list.writer.no eq loginMember.no || minihomeUser.member.no eq loginMember.no }">
   		    <div id="visitorlistdiv">
	            <div id="contentviewdiv">
	                <div id="secretlisttopbardiv">
	                    <div id="topbarleftdiv" >
	                        <span><b>no.${ list.rowNum } &nbsp;</b></span>
	                        <span><a href="">${ list.writer.name }</a>&nbsp;</span>
	                        <span><a href=""><img style="width: 20px; height: 20px; color: rgba(243, 156, 18);" src="${ path }/resources/image/home/homecolor.png" alt=""></a>&nbsp;</span>
	                        <span>
	                        <c:if test="${ list.createDate eq list.modifyDate }">(<fmt:formatDate value="${ list.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</c:if>
	                        <c:if test="${ list.createDate ne list.modifyDate }">(수정됨 : <fmt:formatDate value="${ list.modifyDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</c:if>
	                        </span>
	                    </div>
	                    <div id="topbarrightdiv">
	                        <c:if test="${ list.writer.no eq loginMember.no }">
<!-- 	                        	<span><a href="">비밀로하기</a></span> -->
		                        <span><a href="${ path }/minihome/visitor/update/${ minihomeNo }?visitorNo=${ list.visitorNo }">수정</a></span>
		                        <span>&nbsp;|&nbsp;</span>
		                        <span><a href="${ path }/minihome/visitor/delete/${ minihomeNo }?visitorNo=${ list.visitorNo }" id="deleteAtag" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></span>
	                        </c:if>
	                        <c:if test="${ minihomeUser.member.no eq loginMember.no && list.writer.no ne loginMember.no }">
		                        <span><a href="${ path }/minihome/visitor/delete/${ minihomeNo }?visitorNo=${ list.visitorNo }" id="deleteAtag" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></span>
		                        <span>&nbsp;|&nbsp;</span>
		                        <span><a href="${ path }/minihome/visitor/report/${ minihomeNo }?visitorNo=${ list.visitorNo }&reportCode=${ list.reportCode }" 
		                        		onclick="window.open(this.href, '신고하기', 'width=350, height=340, top=200, left=300'); return false;">신고</a></span>
	                        </c:if>
	                        <c:if test="${ list.writer.no ne loginMember.no && minihomeUser.member.no ne loginMember.no }">
		                        <span><a href="${ path }/minihome/visitor/report/${ minihomeNo }?visitorNo=${ list.visitorNo }&reportCode=${ list.reportCode }" 
		                        		onclick="window.open(this.href, '신고하기', 'width=350, height=340, top=200, left=300'); return false;">신고</a></span>
	                        </c:if>
	                    </div>
	                </div>
	                <div id="visitorviewdiv">
	                    <div class="visitorviewleft">
	                        <div class="viewminimiImgdiv">
	                            <img src="${ path }/${ list.writer.minimi }" alt="">
	                        </div>
	                    </div>
	                    <div class="visitorviewright">
	                        <div class="viewtextareadiv">
	                            <textarea name="" class="viewtextarea" readonly>${ list.content }</textarea>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <!-- 댓글 시작 -->
	            <div id="replydiv">
	            <c:if test="${ not empty list.replies }">
	            	<c:forEach var="replies" items="${ list.replies }">
		                <form action="">
		                <div id="replyinnerdiv">
		                    <div id="replyuserdiv">
		                        <div>
		                            <a href="" >${ replies.writer.name }</a>
		                        </div>
		                    </div>
		                    <div id="replycontentdiv">
		                        <div id="replytextareadiv">
		                           <textarea class="readonlytextarea"  id="textarea_visitorNo${list.visitorNo}vreNo${replies.vreNo}" readonly>${ replies.content }</textarea>
		                        </div>
		                    </div>
		                    <div id="replytbtndiv">
		                        <div>
		                        	<a href="">답글</a>
		                        	<c:if test="${ replies.writer.no eq loginMember.no }">
			                        	<a href="javascript:void(0);" class="visibleReplyupdate" id="updateReply_visitorNo${list.visitorNo}vreNo${replies.vreNo}" onclick="updateReply('${ list.visitorNo }', '${ replies.vreNo }');">수정</a>
			                        	<a href="javascript:void(0);" class="hiddenReplyupdate" id="updateReplyDone_visitorNo${list.visitorNo}vreNo${replies.vreNo}" onclick="updateReplyDone('${ list.visitorNo }', '${ replies.vreNo }');">수정완료</a>
			                        	<a href="${ path }/minihome/visitor/deleteReply/${minihomeNo}?visitorNo=${ list.visitorNo }&vreNo=${ replies.vreNo }" id="deleteReply_visitorNo${list.visitorNo}vreNo${replies.vreNo}">삭제</a>
		                        	</c:if>
		                        </div>
		                    </div>    
		                </div>
		                </form>
		                <!-- 대댓글 depth로 시작  -->
		                <c:if test="${ replies.depth ne 0 }">
			                <form action="">
			                <div class="depthreply">
			                    <div class="depthinner">
			                        <div class="depthuserdiv">
			                            <div>
			                                └ <a href="" style="text-decoration: none; color: darkblue" >박성우바보야</a>
			                            </div>
			                        </div>
			                        <div class="depthinnercontent">
			                            <div class="depthtextarea">
			                                <textarea name="" id="" class="readonlytextarea" readonly>댓 내용 ㅠ.ㅜ</textarea>
			                            </div>
			                        </div>
			                        <div id="replytbtndiv" class="depthbtndiv">
			                            <div>
				                        	<a href="">수정</a>
				                        	<a href="">삭제</a>
			                            </div>
			                        </div>    
			                    </div>
			                </div>
			                </form>
		                <!-- 대댓글 c:if 끝 -->
			            </c:if>
       			    <!-- 댓글 c:forEach 끝 -->
			        </c:forEach>
	            <!-- 댓글 c:if 끝 -->
	     		</c:if>
	     			<!-- 댓글 작성칸 -->
					<form action="${ path }/minihome/visitor/writeReply/${ minihomeNo }" method="post" >
		                <div class="writereplywrapdiv">
		                    <div class="writereplydiv">
		                        <div class="replywriteuserdiv">
		                            <div>
		                                <span>${ loginMember.name }</span>
		                            </div>
		                        </div>
		                        <div class="wirtereplytextareadiv">
		                            <div class="">
		                                <textarea name="replycontent" id="wirtereplytextarea"></textarea>
                            		    <input type="hidden" name="visitorNo" value="${ list.visitorNo }">
		                            </div>
		                        </div>
		                        <div id="" class="replywritebtn">
		                            <div>
		                                <button>작성</button>
		                            </div>
		                        </div>    
		                    </div>
		                </div>
	                </form>

		        <!-- replydiv 끝. 댓글 끝 -->
	            </div>
	        <!-- visitorlistdiv 끝 -->
	        </div>
	        <!-- 끝!! writer랑 loginMember 같을때 + 주인일때 -->
	        </c:if>
	        <!-- 비밀인데 writer랑 loginMember 다를때 + 주인도 아닐때 비밀임 -->
	        <c:if test="${ list.writer.no ne loginMember.no && minihomeUser.member.no ne loginMember.no }"> 
	        	<div id="visitorlistdiv">
	            <div id="contentviewdiv">
	                <div id="secretlisttopbardiv">
	                    <div id="topbarleftdiv">
	                        <span><b>no.${ list.rowNum } &nbsp;</b></span>
	                        <span><a href="">${ list.writer.name }</a>&nbsp;</span>
	                        <span><a href=""><img style="width: 20px; height: 20px; color: rgba(243, 156, 18);" src="${ path }/resources/image/home/homecolor.png" alt=""></a>&nbsp;</span>
	                        <span>
	                        <c:if test="${ list.createDate eq list.modifyDate }">(<fmt:formatDate value="${ list.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</c:if>
	                        <c:if test="${ list.createDate ne list.modifyDate }">(수정됨 : <fmt:formatDate value="${ list.modifyDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</c:if>
	                        </span>
	                    </div>
	                    <div id="topbarrightdiv">
	                    </div>
	                </div>
	                <div id="visitorviewdiv">
	                    <div class="visitorviewleft">
	                        <div class="viewminimiImgdiv">
	                            <img src="${ path }/${ list.writer.minimi }" alt="">
	                        </div>
	                    </div>
	                    <div class="visitorviewright">
	                        <div class="viewtextareadiv">
	                            <textarea name="" class="viewtextarea" readonly style="font-weight: bold;" >비밀글 입니다.</textarea>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        <!-- visitorlistdiv 끝 -->
	        </div>
	        </c:if> <!-- 끝 writer랑 loginMember 다를때 + 주인도 아닐때 -->
	        <!-- 비밀로하기 조건 -->
	        </c:if>
        <!-- c:forEach 끝 -->
        </c:forEach>
        <!-- c:if 끝 -->
        </c:if>
<!--         <div class="btmbtndiv">
          <button><</button>
          <button>1</button>
          <button>2</button>
          <button>3</button>
          <button>4</button>
          <button>5</button>
          <button>></button>
        </div>     -->  
        
    <!-- visitorwrapdiv 끝 -->
    </div>

<script>
// window.onload = function() {
// }	


    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (12 + obj.scrollHeight) + 'px';
    }

    // 댓글 수정 함수
    function updateReply(str1, str2) {
    	let visitorNo = str1;
    	let vreNo = str2;
    	let textareaId = 'textarea_visitorNo' + str1 + 'vreNo' + str2;
    	let depthId = 'depthReply_visitorNo' + str1 + 'vreNo' + str2;
    	let updateId = 'updateReply_visitorNo' + str1 + 'vreNo' + str2;
    	let deleteId = 'deleteReply_visitorNo' + str1 + 'vreNo' + str2;
    	let updateDoneId = 'updateReplyDone_visitorNo' + str1 + 'vreNo' + str2;
    	
    	console.log(visitorNo)
    	console.log(vreNo)
    	console.log(textareaId)
    	
    	$('#' + textareaId).attr('readonly', false).focus();
    	$('#' + textareaId).css('background-color', 'white').css('border', '1px solid black');
    	// 답글, 수정, 삭제 안보이도록
    	$('#' + depthId ).css('display', 'none');
    	$('#' + updateId ).css('display', 'none');
    	$('#' + deleteId ).css('display', 'none');
    	// 수정완료는 보이게
    	$('#' + updateDoneId ).css('display', 'block');
    	
    };
    
    
    // 댓글 수정완료 함수
    function updateReplyDone(str1, str2) {
    	let visitorNo = str1;
    	let vreNo = str2;
    	let depthId = 'depthReply_visitorNo' + str1 + 'vreNo' + str2;
    	let updateId = 'updateReply_visitorNo' + str1 + 'vreNo' + str2;
    	let deleteId = 'deleteReply_visitorNo' + str1 + 'vreNo' + str2;
    	let updateDoneId = 'updateReplyDone_visitorNo' + str1 + 'vreNo' + str2;
    	
    	let textareaId = 'textarea_visitorNo' + str1 + 'vreNo' + str2;    	
    	let content = $('#' + textareaId).val();
    	
    	
    	
		$.ajax({
			url: '${path}/minihome/visitor/updateReply/${minihomeNo}',
			type: 'post',
			dataType: 'json',
			data : {
				visitorNo,
				vreNo,
				content
			},
			success : function(data) {
				console.log('성공')
				console.log(data);
				console.log(data.updateReplyContent);
				// 내용 바꾸기
				content = data.updateReplyContent;
				// 수정완료 없애기 + readonly				
		    	$('#' + updateDoneId ).css('display', 'none');
				$('#' + textareaId).attr('readonly', true);
				$('#' + textareaId).css('background-color', 'transparent').css('border', '0');
				
				// 기존 버튼 보이도록
		    	$('#' + depthId ).css('display', 'inline');
		    	$('#' + updateId ).css('display', 'inline');
		    	$('#' + deleteId ).css('display', 'inline');
				
			},
			error : (error) => {
				alert('다시 시도해주세요.');
				location.reload();
			}
		// ajax 끝
		});


    };
    
    
//     depthtextarea_visitorNo${ list.visitorNo }vreNo${ replies.vreNo }depth${ replies.depth }
    // 답글 눌렀을때 보여야하는 폼 안의 textarea
// 		<a href="javascript:void(0);" id="depthReply_visitorNo${list.visitorNo}vreNo${replies.vreNo}" onclick="depthReply('${ replies.vreNo }', '${ replies.step }', '${ replies.depth }');">답글</a>
//   id ->  depthtextarea_visitorNo${ list.visitorNo }vreNo${ replies.vreNo }depth${ replies.depth }
	function depthReply(str0, str1, str2, str3) {
		let visitorNo = str0;
		let vreNo = str1;
		let step = str2;
		let depth = str3;
		
		console.log(str0 + ', ' + str1 + ', ' + str2 + ', ' + str3)
		
		let textareaId = 'depthtextarea_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
	   	let content = $('#' + textareaId).val();
		
	   	let replybtndiv = 'replybtndiv_vreNo' + str1;
	   	
	   	console.log(content);
	
	   	// 게시할 수 있는 공간 inline으로 드러나도록
	   	$('#' + replybtndiv).css('display', 'inline');
	   	
    	$('#' + textareaId).attr('readonly', false).focus();
    	$('#' + textareaId).css('background-color', 'white').css('border', '1px solid black');
		
	}
	
	
// 	id="depthReplyDone_vreNo${ replies.vreNo }depth${ replies.depth }"
	// 작성버튼 클릭 함수
	function depthReplyDone(str0, str1, str2, str3) {
		let visitorNo = str0;
		let vreNo = str1;
		let step = str2;
		let depth = str3;
		
		console.log(str0 + ', ' + str1 + ', ' + str2 + ', ' + str3)
		
		let textareaId = 'depthtextarea_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
	   	let content = $('#' + textareaId).val();

	   	
	   	console.log(content);
	   	
		$.ajax({
			url: '${path}/minihome/visitor/insertDepthReply/${minihomeNo}',
			type: 'post',
			dataType: 'json',
			data : {
				vreNo,
				visitorNo,
				step,
				depth,
				content
			},
			success : function(data) {
				console.log('성공')
				console.log(data);
	
				document.location.reload();			
				// 내용 바꾸기
// 				content = data.~~~~;
				// 수정완료 없애기 + readonly				
// 		    	$('#' + updateDoneId ).css('display', 'none');
// 				$('#' + textareaId).attr('readonly', true);
// 				$('#' + textareaId).css('background-color', 'transparent').css('border', '0');
				
				// 기존 버튼 보이도록
// 		    	$('#' + depthId ).css('display', 'inline');
// 		    	$('#' + updateId ).css('display', 'inline');
// 		    	$('#' + deleteId ).css('display', 'inline');
				
			},
			error : (error) => {
				alert('다시 시도해주세요.');
				location.reload();
			}
		// ajax 끝
		});
	
	}
	
	// 취소 버튼시 작성칸 사라지도록
	function replycancelbtn(str1) {
		
	   	let replybtndiv = 'replybtndiv_vreNo' + str1;
		
	   	// 대댓글 작성 공간 없애기
	   	$('#' + replybtndiv).css('display', 'none');
	}
	
	
	// 수정 버튼
	function depthupdate(str0, str1, str2, str3) {
		let visitorNo = str0;
		let vreNo = str1;
		let step = str2;
		let depth = str3;
		
		let textareaId = 'depthtextareaContent_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
	   	let content = $('#' + textareaId).val();
    	let updateId = 'depthupdate_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
     	let updateDoneId = 'depthupdateDone_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
    	let deleteId = 'depthdelete_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
		
	   	
	   	// 수정을 누르면 수정될 수 있는 textarea css설정
	   	$('#' + textareaId).attr('readonly', false).focus();
	   	$('#' + textareaId).css('background-color', 'white').css('border', '1px solid black');
		// 수정, 삭제는 없애고 
    	$('#' + updateId ).css('display', 'none');
    	$('#' + deleteId ).css('display', 'none');
		// 수정완료는 보이도록
    	$('#' + updateDoneId ).css('display', 'block')
    	
	}
	
	function depthupdateDone(str0, str1, str2, str3, str4) {
		let visitorNo = str0;
		let vreNo = str1;
		let step = str2;
		let depth = str3;
		let group = str4;
		
		let textareaId = 'depthtextareaContent_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
	   	let content = $('#' + textareaId).val();
    	let updateId = 'depthupdate_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
     	let updateDoneId = 'depthupdateDone_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
    	let deleteId = 'depthdelete_visitorNo' + str0 + 'vreNo' + str1 + 'depth' + str3;
    	
	   	console.log(content);
	   	
	   	$.ajax({
	   		url: '${ path }/minihome/visitor/depthUpdate/${ minihomeNo }',
	   		type: 'post',
			dataType: 'json',
			data : {
				visitorNo,
				vreNo,
				step,
				depth,
				content,
				group
			},
			success : function(data) {
				console.log('성공')
				console.log(data.result);

				// 수정완료 없애기 + readonly				
		    	$('#' + updateDoneId ).css('display', 'none');
				$('#' + textareaId).attr('readonly', true);
				$('#' + textareaId).css('background-color', 'transparent').css('border', '0');
				
				// 기존 버튼 보이도록
		    	$('#' + updateId ).css('display', 'inline');
		    	$('#' + deleteId ).css('display', 'inline');
				
				document.location.reload();			
				
			},
			error : (error) => {
				alert('다시 시도해주세요.');
				location.reload();
			}			
	   		
	   	});
    	
	}
	
	
	function depthdelete(str0, str1, str2, str3, str4) {
		let visitorNo = str0;
		let vreNo = str1;
		let step = str2;
		let depth = str3;
		let group = str4;
		
// 		console.log(str0 + ', ' + str1 + ', '+ str2 + ', ' + str3 + ', ' + str4)
		if(confirm('삭제하시겠습니까?')) {
			
		
		   	$.ajax({
		   		url: '${ path }/minihome/visitor/depthDelete/${ minihomeNo }',
		   		type: 'post',
				dataType: 'json',
				data : {
					visitorNo,
					vreNo,
					step,
					depth,
					group
				},
				success : function(data) {
					console.log('성공')
					console.log(data.result);
		
					document.location.reload();			
					
				},
				error : (error) => {
					alert('다시 시도해주세요.');
					console.log(error)
					location.reload();
				}			
		   		
		   	});
		}
	   	
	}
	
	
    	
</script>
</body>
</html>