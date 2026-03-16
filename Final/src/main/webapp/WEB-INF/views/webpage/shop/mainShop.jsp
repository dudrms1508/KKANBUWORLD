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
<title>선물 가게</title>
<link rel="stylesheet" href="${ path }/resources/css/header.css">
<link rel="stylesheet" href="${ path }/resources/css/footer.css">
<style>

		div,ul,li{margin:0; padding:0;}
		
        ul,li {list-style:none;}
        .tab{width:1060px; height:auto; margin:auto;}
        .tabnav{font-size:0; width:1058px; height:auto; border:1px solid #ddd;}
        .tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
        .tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
        .tabnav li a.active:before{background:rgb(243, 156, 18);}
        .tabnav li a.active{border-bottom:1px solid #fff;}
        .tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
        .tabnav li a:hover,
        .tabnav li a.active{background:#fff; color:rgb(243, 156, 18); }
        .tabcontent{padding: 20px; height:auto; border:1px solid #ddd; border-top:none;}

	.name {font-size:13px;}
	.price {font-size:13px;}

    .product{
        /* display: block; */
        width: 220px;
        text-align: center;
        text-decoration:none;
        color: black;
        float:left;       
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 30px;
        
        text-align: center;
        text-decoration:none;
        color: black;        
        
        margin-right: 10px;
        margin-bottom: 30px;
        /* position:relative; */
        justify-content: center;
	}
        
	    .productlist img {
	    margin: auto;
	    display:inline-block;
	    position:relative;
	    margin: auto;
	    justify-content: center;
	    }        
		
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
        a>.cart{
            float: right;
        }
</style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
</head>
<body>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="tab">
        <ul class="tabnav">
            <li><a href="#skin">스킨</a></li>
            <li><a href="#minidd">미니미</a></li>
        </ul>
            <div class="tabcontent">
                <!-- 스킨 메뉴 -->
                <div id="skin">
                    <div class="products">
                        <div class="product-list">
							
								<c:forEach var="product" items="${list}">
									<c:if test="${ product.category_code eq 'THEME'}">								
								<div class="product">
                                <div class="productlist">
                                    <a href="${path}/webpage/shop/buyPopUp/${product.product_code}" class="product"  onclick="window.open(this.href, '_blank','width=430,height=410'); return false;">
                                        <img src="${path}/resources/image/shop/${product.product_url}" width="200px" height="110px">
                                    </a>
                                </div>
	                                <ul>
                                    	<li>
                                    	<div class="information">
                                        	<p class="name">${product.product_name}&nbsp;&nbsp;&nbsp;
                                        	<a href="javascript:void(0);" onclick="insertCart('${ product.product_code }')">
                                        	<img src="${path}/resources/image/shop/cart.png" style="width: 15px; height: 15px;"></a></p>
                                        	<p class="price">${product.product_money}</p>
                                    	</div>
                                    	</li>
                                	</ul>
                            	</div>
	                            </c:if>
                            </c:forEach>       
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
                
                <div id="minidd">
                    <div class="products">
                        <div class="product-list">
							
								<c:forEach var="product" items="${list}">
									<c:if test="${ product.category_code eq 'MINIMI'}">								
								<div class="product">
                                <div class="productlist">
                                    <a href="${path}/webpage/shop/buyPopUp/${product.product_code}" class="product"  onclick="window.open(this.href, '_blank','width=430,height=410'); return false;">
                                        <img src="${path}/resources/image/shop/${product.product_url}" width="200px" height="110px">
                                    </a>
                                </div>
	                                <ul>
                                    	<li>
                                    	<div class="information">
                                        	<p class="name">${product.product_name}&nbsp;&nbsp;&nbsp;
                                        	<a href="javascript:void(0);" onclick="insertCart('${ product.product_code }')">
                                        	<img src="${path}/resources/image/shop/cart.png" style="width: 15px; height: 15px;"></a></p>
                                        	<p class="price">${product.product_money}</p>
                                    	</div>
                                    	</li>
                                	</ul>
                            	</div>
	                            </c:if>
                            </c:forEach>       
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
	
    
    function insertCart(str) {
    	
		let productNo = str;
    	
		$.ajax({
			url: '${path}/webpage/mypage/cartIn',
			type: 'get',
			dataType: 'json',
			data : {
				productNo
			},
			success : function(data) {
				console.log('성공')
				console.log(data);
				
				if(data == '1') {
					alert('장바구니에 담았습니다.')
				} else {
					alert('이미 장바구니에 있는 상품입니다.')
				}
				
			},
			error : (error) => {
				alert('다시 시도해주세요.');
				location.reload();
			}
		// ajax 끝
		});
    	
    }
    
    </script>
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>