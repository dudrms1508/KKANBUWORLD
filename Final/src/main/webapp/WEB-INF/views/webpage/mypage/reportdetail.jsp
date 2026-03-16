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
<title>신고하기 상세보기</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
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
        height: 30px;
        width: 100%;
    }

    #middlediv>div {
        text-align: center;
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
        outline: none;
        cursor: default;
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

    #closebtn {
        cursor: pointer;
    }

    .btnstyle {
        background-color: rgb(243, 156, 18);
        color: white;
        height: 25px;
        border-radius: 4px;
        border: 0;
    }

    #reportCategory, #reportDate {
        width: 100%;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        outline: none;
        /* border: 0; */
        cursor: default;
    }
    


</style>
</head>
<body>
    <div id="reportwrapdiv">
        <form action="">
        <div id="contentdiv">
            <div id="topdiv">
                <div>
                    <img src="../images/free-icon-siren-503891.png">                
                </div>
                <div>
                    <span>신고내역 상세보기</span>
                </div>
            </div>
            <div id="middlediv">
                <div>신고하신 내용입니다.</div>
            </div>
            <div>
                <table style="border: 1px solid black;">
                    <tr>
                        <th class="headtd">신고날짜</th>
                        <td>
                            <input type="text" id="reportDate" value="<fmt:formatDate value="${report.date}" pattern="yyyy년 MM월 dd일" />" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th class="headtd">신고사유</th>
                        <td>
                            <input type="text" id="reportCategory" value="${ report.categoryName }" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th class="headtd">신고내용</th>
                        <td><textarea name="" id="reportTextarea" readonly>${ report.content }</textarea></td>
                    </tr>
                </table>
            </div>
            <div id="bottomdiv">
                <div>
                    <div><button type="button" id="closebtn" class="btnstyle">닫기</button></div>
                </div>
            </div>
        </div>
        </form>
    </div>
<script>
window.onload = function() {
    let closebtn = document.getElementById('closebtn');

    closebtn.addEventListener('click', () => {
        self.close();

    });

}
</script>
</body>
</html>