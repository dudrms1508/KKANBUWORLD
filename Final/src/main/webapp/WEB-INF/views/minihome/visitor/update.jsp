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
	#visitorwrapdiv {
	    border: 1px solid lightgray;
	    width: 780px;
	    margin: 0 auto;
	}
	
	#visitorlistdiv {
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
	    padding-right: 20px;
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
	
	.viewtextareadiv {
	    height: 100%;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	
	/* 수정할 때는 css 바뀌도록 */
	.viewtextarea {
	    width: 100%;
	    height: 90%;
	    resize: none;
	    padding: 5px;
	    box-sizing: border-box;
	    /* outline: none; */
	    /* border: 0; */
	    background-color: transparent;
	}
	
	#submitbtn {
		background-color: black;
		opacity: 0.8;
		border: 0;
		color: white;
		border-radius: 4px;
		margin: 0;
		padding: 2px 5px;
	}
	
	a {
		text-decoration: none;
		color: darkblue;
	}
	
</style>
</head>
<body>
    <div id="visitorwrapdiv">
        <form action="${ path }/minihome/visitor/update/${ minihomeNo }" method="post">
            <div id="visitorlistdiv">
                <div id="contentviewdiv">
                    <div id="listtopbardiv">
                        <div id="topbarleftdiv">
                            <span><b>(수정중) &nbsp;</b></span>
                            <span><a href="">${ visitor.writer.name }</a>&nbsp;</span>
                            <span><a href=""><img style="width: 20px; height: 20px;" src="../images/check_gray.png" alt=""></a>&nbsp;</span>
                            <span>(<fmt:formatDate value="${ visitor.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</span>
                        </div>
                        <div id="topbarrightdiv">
                            <span><button id="submitbtn">등록</button></span>
                        </div>
                    </div>
                    <div id="visitorviewdiv">
                        <div class="visitorviewleft">
                            <div class="viewminimiImgdiv">
                                <img src="../images/starbutterfly.jpg" alt="">
                            </div>
                        </div>
                        <div class="visitorviewright">
                            <div class="viewtextareadiv">
                                <textarea name="content" class="viewtextarea">${ visitor.content }</textarea>
                                <input type="hidden" name="visitorNo" value="${ visitorNo }">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
<script type="text/javascript">


</script>
</body>
</html>