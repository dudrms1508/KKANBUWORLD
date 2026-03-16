<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 가게</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
    <div class="tab">
        <ul class="tabnav">
            <li><a href="#skin">스킨</a></li>
            <li><a href="#minimi">미니미</a></li>
        </ul>
            <div class="tabcontent">

                <!-- 스킨 메뉴 -->
                <div id="skin">
                    <div class="products">
                        <div class="product-list">

                            <a href="#" class="product">
                                <img src="../img/fallbackground.jpg" width="200px" height="110px">
                                <div class="product-name">
                                    가을 테마
                                </div>
                                <div class="product-price">
                                    도토리 90개
                                </div>
                            </a>
                            
                            <a href="#" class="product" onclick="showPopup();" return false;">
                                <img src="../img/springbackground.jpg" width="200px" height="110px">
                                <div class="product-name">
                                    봄 테마
                                </div>
                                <div class="product-price">
                                    도토리 90개
                                </div>
                            </a>
                
                            
                            <a href="#" class="product">
                                <img src="../img/summerbackground.jpg" width="200px" height="110px">
                                <div class="product-name">
                                    여름 테마
                                </div>
                                <div class="product-price">
                                    도토리 90개
                                </div>
                            </a>
                
                            <a href="#" class="product">
                                <img src="../img/winterbackground.jpg" width="200px" height="110px">
                                <div class="product-name">
                                    겨울 테마
                                </div>
                                <div class="product-price">
                                    도토리 90개
                                </div>
                            </a>
                
                            
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
                <div id="minimi">
                    <div class="products">
                        <div class="product-list">

                            <a href="#" class="product">
                                <img src="../img/minimi.jpg" width="200px" height="110px">
                                <div class="product-name">
                                    금발 남자
                                </div>
                                <div class="product-price">
                                    도토리 90개
                                </div>
                            </a>
                            
                            <a href="#" class="product">
                                <img src="../img/minimi2.PNG" width="200px" height="110px">
                                <div class="product-name">
                                    봄 여자
                                </div>
                                <div class="product-price">
                                    도토리 90개
                                </div>
                            </a>
                
                            
                            
                            </a>
                
                            
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div> 
    </div><!--tab-->


    <script>
        $(function(){
            $('.tabcontent > div').hide();
            $('.tabnav a').click(function () {
                $('.tabcontent > div').hide().filter(this.hash).fadeIn();
                $('.tabnav a').removeClass('active');
                $(this).addClass('active');
                return false;
            }).filter(':eq(0)').click();
            });

        function showPopup(){
            window.open("Buy_popup.HTML","_balnk","width=430, height=400, left=100,");
        }

    </script>
</body>
</html>