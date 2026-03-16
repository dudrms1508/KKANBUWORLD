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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
	<link rel="stylesheet" href="resources/css/footer.css">
	
	<!-- slick css -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<!-- slick JS -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <footer>
            <div id="mainFooter">
                <div id="footerTop">
                    <div id="footerLogo">
                        <img src="${path}/resources/image/header/logo.jpg">
                    </div>
                    <div id="footerNotice">
                        <a href="${path}/webpage/notice/list">공지사항 &gt;</a>
                    </div>
                </div>
                <div id="footerCS">
                    <p>
                        C/S CENTER
                    </p>
                    <p>
                        MON-FRI 09:00 - 17:50 | LUNCH 12:50 - 14:00 | SAT, SUN, HOLIDAY OFF
                    </p>
                </div>
                <div id="footerText">
                    <p>
                        ⓒ KKANBU Corp.
                    </p>
                    <p>
                        Tel.1544-9970
                    </p>
                    <p>
                        서울 강남구 테헤란로14길 6, 4층
                    </p>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>