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
<title>미니홈피 게시판 작성</title>
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

        .write-btn {
            padding: 3px 8px 3px 8px;
            margin: 5px 5px 5px 5px;
        }
    </style>
</head>

<body>
   <section id="content">
      <div id='board-write-container'>
         <form action="${ path }/board/write" method="POST" enctype="multipart/form-data">
            <table id='tbl-board'>
               <tr>
                  <th>제목</th>
                  <td><input type="text" name="title" id="title"></td>
               </tr>
               <tr>
                  <th>작성자</th>
                  <td><input type="text" name="writer" value="${ loginMember.id }" readonly></td>
               </tr>
               <tr>
                  <th>첨부파일</th>
                  <td><input type="file" name="upfile"></td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td><textarea name="content" cols="50" rows="15" ></textarea></td>
               </tr>
               <tr>
                  <th colspan="2">
                     <input class="write-btn" type="submit" value="등록">
                     <input class="write-btn" type="reset" value="취소">
                  </th>
               </tr>
            </table>
         </form>
      </div>
   </section>
</body>

</html>