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
<title>미니홈피 게시글 수정</title>
<style>
        #content {
            width: 800px;
            height: auto;
        }
        
        #board-write-container {
            border: 3px dotted rgba(243, 156, 18, 0.3);
            width: 750px;
            height: auto;
            margin: auto;
        }

        #tbl-board {
            border-spacing: 15px;
            color: #666;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .update-btn {
            padding: 3px 8px 3px 8px;
            margin: 5px 5px 5px 5px;
        }
    </style>
</head>

<body>
   <section id="content">
      <div id='board-write-container'>
         <form action="${ path }/board/update" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="no" value="${ board.no }">
            
            <table id='tbl-board'>
               <tr>
                  <th>제목</th>
                  <td><input type="text" name="title" id="title"
                        value="${ board.title }"></td>
               </tr>
               <tr>
                  <th>작성자</th>
                  <td><input type="text" name="writer" value="${ board.writerId }" readonly></td>
               </tr>
               <tr>
                  <th>첨부파일</th>
                  <td>
                     <input type="file" name="upfile"><br>
                     <c:if test="${ not empty board.originalFileName }">
                        <span>${ board.originalFileName }</span>
                     </c:if>
                  </td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td><textarea name="content" cols="50" rows="15" >${ board.content }</textarea></td>
               </tr>
               <tr>
                  <th colspan="2">
                     <input class="update-btn" type="submit" value="수정">
                     <input class="update-btn" type="button" onclick="location.replace('${path}/board/list')" value="목록으로">
                  </th>
               </tr>
            </table>
         </form>
      </div>
   </section>
</body>

</html>