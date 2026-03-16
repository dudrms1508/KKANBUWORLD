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
<title>선물 가게</title>
<style>
        div,ul,li{margin:0; padding:0;}
        ul,li {list-style:none;}
        .tab{float:left; width:1100px; height:290px;}
        .tabnav{font-size:0; width:1100px; border:1px solid #ddd;}
        .tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
        .tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
        .tabnav li a.active:before{background:rgb(243, 156, 18);}
        .tabnav li a.active{border-bottom:1px solid #fff;}
        .tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
        .tabnav li a:hover,
        .tabnav li a.active{background:#fff; color:rgb(243, 156, 18); }
        .tabcontent{padding: 20px; height:auto; border:1px solid #ddd; border-top:none;}

        /* shop */
        .product-list{
        width: 1000px;
        margin-left: auto;
        margin-right: auto;
        }
        .products h3{
        font-size: 24px;
        color: #545454;
        margin-top:60px;
        margin-bottom: 60px;
        text-align: center;
        }

        .product{
        display: block;
        width: 200px;
        text-align: center;
        text-decoration:none;
        color: black;
        float:left;
        margin-left: 30px;
        margin-right: 10px;
        margin-bottom: 30px;
        }

        .product-name{
        margin-top: 20px;
        margin-bottom: 4px;
        
        }

        .product-price{
            color: #545454;
            font-size: 10px;

        }
        .clearfix{
            clear: both;
            
        }
</style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
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
							
								<c:forEach var="product" items="${list}">
									<c:if test="${ product.category_code eq 'THEME'}">								
	                            <a href="${path}/webpage/giftTest/shop/buyPopUp/${product.product_code}" class="product"  onclick="window.open(this.href, '_blank','width=430,height=410'); return false;">
	                                <img src="${path}/resources/image/${product.product_url}" width="200px" height="110px">                            
	                                <div class="product-name">
	                                    ${product.product_name}                             
	                                        <img src="${path}/resources/image/shop/cart.png" style="width: 15px; height: 15px;">
	                                </div>
	                                <div class="product-price">
	                                    <label>도토리 &nbsp;</label>${product.product_money}<label>&nbsp;개</label>  
	                                </div>
	                            </a>
	                            </c:if>
                            </c:forEach>       
                            

                
                            
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
                
                <!-- 미니미 -->
				<div id="minimi">
                    <div class="products">
                        <div class="product-list">
                        
                        	<c:forEach var="product" items="${list}">
									<c:if test="${ product.category_code eq 'MINIMI'}">								
	                            <a href="${path}/webpage/giftTest/shop/buyPopUp/${product.product_code}" class="product"  onclick="window.open(this.href, '_blank','width=430,height=410'); return false;">
	                                <img src="${path}/resources/image/${product.product_url}" width="200px" height="110px">                            
	                                <div class="product-name">
	                                    ${product.product_name}                             
	                                        <img src="${path}/resources/image/shop/cart.png" style="width: 15px; height: 15px;">
	                                </div>
	                                <div class="product-price">
	                                    <label>도토리 &nbsp;</label>${product.product_money}<label>&nbsp;개</label>  
	                                </div>
	                            </a>
	                            </c:if>
                            </c:forEach>  

<!--                             <a href="#" class="product">
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
                            </a> -->
                
                            
                            
                            </a>
                
                            
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div> 
    </div><!--tab-->


    <script>
    $(document).ready(function(){
        $(function(){
            $('.tabcontent > div').hide();
            $('.tabnav a').click(function () {
                $('.tabcontent > div').hide().filter(this.hash).fadeIn();
                $('.tabnav a').removeClass('active');
                $(this).addClass('active');
                return false;
            }).filter(':eq(0)').click();
            });
        
      /*   $.ajax({
        	type: 'POST',
        	url: '/webpage/shop/buyPopUp',
        	data: list,
        	dataType: 'json',
        	success: function(data){
        		console.log(data);
        	},
        	error: function(data){
        		
        	}
        
        });
 */
    });

    </script>
</body>
</html>