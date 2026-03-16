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
<title>구매</title>
<style>
        #buywrap{
            width: 400px;
            height: 300px;

        }
        #buyHead{            
            padding: 2px;
            background-color: rgb(243, 156, 18);
            color: white;
            
        }
        
        #headright{
            float: right;
        }

        #buybody{
            margin: 10px;
        }

        #buyinfo{
            background-color: lightgray;
            padding: 5px;
        }

        input[type=button], input[type=submit]{
            border-radius: 5px;
            border: none;
            background-color: rgb(243, 156, 18);
            color: white;
            margin: 20px 30px;
            width: 60px;
            height: 30px;
        }
        input[type=reset]{
            border-radius: 5px;
            border: none;
            margin-left: 35px;
            width: 60px;
            height: 30px;
        }
        #agree label{
            font-size: 10px;
        }

</style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="${ path }/resources/js/GGAN.js"></script>
</head>
<body>
    <div id="buywrap">
        <div id="buyHead">
            상품 구매
            <div id="headright"><a href="#" style="color:white;">공지사항</a> |  <a href="#" style="color:white;">고객센터</a></div>
        </div>
        <div id="buybody">
            <div>
                보유중인 도토리 
                <span style="color: rgb(243, 156, 18);">${loginMember.acorn}</span>
                개
            </div>            
            <hr>
            <div id="buyinfo">
                <form>
                    <table>
                        <tr>
                            <td rowspan="5"><img src="${path}/resources/image/${productvo.product_url}" width="200px" height="110px"></td>
                            <td>상품명</td>
                            <td>${productvo.product_name}</td>
                        </tr>
                        <tr>
                            <td>도토리</td>
                            <td>${productvo.product_money} 개</td>
                        </tr>
                    </table>
            </div>
                <div id="agree">
                    <input type="checkbox" id="allagree" name="agree_all"><label>전체 동의</label>
                    <hr>
                    <input type="checkbox" id="pay_agree" name="agree"><label>전자 금융거래 이용약관(필수)</label>
                    <br>
                    <input type="checkbox" id="info_agree" name="agree"><label>개인정보 수집 및 이용동의(필수)</label>
                    <br>
                    <hr>    
                </div>            
                    
                    

                    <input type="submit" onclick="buy()" value="결제">
                    <input type="button" id="giftbtn" value="선물하기">
                    <input type="reset" value="취소" onclick="self.close();">

                
            </form>   
            <div>

            </div>
        </div>


    </div>

<script>
        var $agree_all = $('#allagree');
        $agree_all.change(function (){
            var $this = $(this);
            var checked = $this.prop('checked');
            $('input[name="agree"]').prop('checked',checked);
        });
        
        var user_acorn = ${loginMember.acorn};
        var product_acorn = ${productvo.product_money};
        
        function buy(){
        	if(user_acorn > product_acorn){
        	
        		var param = {
	        		user_no: ${loginMember.no},
	        		product_code: ${productvo.product_code},
	        		product_money: ${productvo.product_money}	        
	        }
	        console.log(param);
        ajaxJsonParam("${path}/giftTest/shop/buy", param, function(data){
        	if(data){       		
        		
        	}
        });
        alert("결제 완료!");
        window.close();
        }else{
        	alert("도토리가 부족합니다. 충전 후 이용해주세요.");
    		window.close();
        	}
        }
        
        
        
        /* ajaxJsonParam("${path}/shop/buy",param, function (data) {
			if (data) {
    			
    			
    	
    			alert("구매가 완료되었습니다.");
    			window.close();
    		}
 */     
</script>

<script>
// 선물하기 컨트롤러로 상품코드 값 넘기기
$(document).ready(() => {
	let productCode = ${ productvo.product_code };
	
	
	// 약관 동의를 눌러야 선물할 수 있도록 // 선물하면 도토리 변경 갯수가 반영될 수 있도록 페이지 닫고 부모 페이지 loginMember 새로 넘겨주기
    $('#giftbtn').on('click', (event) => {
        // $('#pay_agree').is(':checked');
        // $('#info_agree').is(':checked');

		console.log("productCode : " + productCode);
		
        // 전자 금융거래 체크 안되어있으면
        if(!($('#pay_agree').is(':checked')) || !($('#info_agree').is(':checked'))) {
            alert('필수 이용약관에 동의해주세요.')
            event.preventDefault();
            return false;
        } else {
            // 여기서 보내기
        	console.log('전부 동의함');
			location.href = '${ path }/gift/send/' + productCode;
        }

    });
	
	
	
});
</script>

</body>
</html>