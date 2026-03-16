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
<title>신고하기</title>
<style>
    #reportwrapdiv {
        width: 300px;
        height: 290px;
        border: 1px solid black;
        margin: 0 auto;
    }

    #contentdiv {
        margin: 0 auto;
        /* border: 1px solid red; */
    }

    #topdiv {
        height: 30px;
        width: 100%;
        background-color: rgb(243, 156, 18);
        margin-bottom: 10px;
    }

    #topdiv>div {
        float: left;
        height: 100%;
    }

    #topdiv>div>img {
        height: 100%;
    }

    #topdiv>div>span {
        height: 100%;
        vertical-align: middle;
        color: white;
    }

    #middlediv {
        height: 50px;
        width: 100%;
    }
	
	#middlediv {
		display: flex;
		align-items: center;
		justify-content: center;
	}

    #middlediv>div>div {
        float: left;
    }

    #middlediv>div>div>img {
        width: 30px;
        height: 30px;
        margin-right: 10px;
    }
    
    #middlediv>div>#middletextdiv {
    	vertical-align: middle;
    }

    #reportTextarea {
        resize: none;
        height: 100px;
        width: 100%;
        padding: 1px 0 0 2px;
        margin: 0;
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }

    table {
        width: 100%;
    }

    .headtd {
        background-color: dimgray;
        color: white;
    }


    td>select {
        width: 100%;
        box-sizing: border-box;
        padding: 0;
        margin: 0;
        display: flex;
        align-items: center;
    }

    #bottomdiv {
        margin-top: 20px;
    }

    #bottomdiv>div {
        text-align: center;
        display: flex;
        justify-content: center;
    }

    #bottomdiv>div>div {
        float: left;
        /* border: 1px solid red; */
    }

    #cancelbtn {
        margin-right: 10px;
    }
    

    .btnstyle {
        background-color: rgb(243, 156, 18);
        color: white;
        height: 25px;
        border-radius: 4px;
        border: 0;
        cursor: pointer;
    }

</style>
</head>
<body>
	    <div id="reportwrapdiv">
        <form action="${ path }/minihome/visitor/report/${ minihomeNo }" method="post">
        <div id="contentdiv">
            <div id="topdiv">
                <div>
                    <img src="${ path }/resources/image/mypage/siren.png">                
                </div>
                <div>
                    <span>신고하기</span>
                    <input type="hidden" name="visitorNo" value="${ visitorNo }">
                    <input type="hidden" name="reportCode" value="${ reportCode }">
                </div>
            </div>
            <div id="middlediv">
            	<div>
	                <div>
	                    <img src="${ path }/resources/image/mypage/check_gray.png">
	                </div>
	                <div id="middletextdiv"><span>허위신고 시 제재될 수 있습니다.</span></div>
            	</div>
            </div>
            <div>
                <table style="border: 1px solid black;">
                    <tr>
                        <th class="headtd">신고사유</th>
                        <td>
                            <select name="categoryCode" id="selectId">
                                <option value="none" selected disabled>선택하세요</option>
                          		<c:forEach var="list" items="${ categoryList }">
                                <option value="${ list.categoryCode }" >${ list.categoryName }</option>
                          		</c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th class="headtd">신고내용</th>
                        <td><textarea name="content" id="reportTextarea" placeholder="신고내용을 작성해 주세요."></textarea></td>
                    </tr>
                </table>
            </div>
            <div id="bottomdiv">
                <div>
                    <div><button type="button" id="cancelbtn" class="btnstyle" onclick="self.close();">취소하기</button></div>
                    <div><button class="btnstyle" id="reportbtn">신고하기</button></div>
                </div>
            </div>
        </div>
        </form>
    </div>
<script>
window.onload = function() {
    let reportbtn = document.getElementById('reportbtn');

    reportbtn.addEventListener('click', (event) => {
        let selectId = document.getElementById('selectId').value;

        if(selectId == 'none') {
            alert('신고사유를 선택해주세요.')
            event.preventDefault();

        }

    });

}
</script>
</body>
</html>