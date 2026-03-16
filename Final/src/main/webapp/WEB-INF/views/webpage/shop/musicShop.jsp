<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악 상점</title>

<link rel="stylesheet" href="${ path }/resources/css/header.css">
<link rel="stylesheet" href="${ path }/resources/css/footer.css">
<style>
		#musicwrap{
			width: 1000px;
			height: auto;
			margin: auto;
		}

        table, th, td{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
            width: 1000px;

        }
        th{
            background-color: lightgray;
        }
</style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="${ path }/resources/js/GGAN.js"></script>
</head>
<body>

	<div id="musicwrap">
	<table>
		<tr>
			<th>순위</th>
			<th>곡명/앨범명</th>
			<th>아티스트</th>
			<th>배경음악</th>
		</tr>
		<c:forEach var="music" items="${list}">		
		<tr>
			<td>${music.num}</td>
			<td>${music.name}</td>
			<td>${music.song_name}</td>
			<td><a href="#">선물+MP3</a>&nbsp;|&nbsp;<a href="${path}/musicBuy/${music.product_code}" onclick="window.open(this.href, '_blank','width=430,height=410'); return false;">구입</a></td>
		</tr>
		</c:forEach>
   	</table>
   	</div>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>