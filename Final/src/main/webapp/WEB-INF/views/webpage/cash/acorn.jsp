<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <style>
        #paymentwrap{
            width: 400px;
            height: 300px;

        }
        #paymentHead{            
            padding: 2px;
            background-color: rgb(243, 156, 18);
            color: white;
            
        }
        
        #headright{
            float: right;
        }

        #paybody{
            margin: 10px;
        }

        #buyinfo{
            background-color: lightgray;
            padding: 5px;
        }

        label{
            font-size: 14px;
        }
        #getAcorn{
            width: 30px;
        }
        
        #payway, #charge{
            background-color: lightgray;
            padding: 5px;
        }
        input[type=submit]{
            border-radius: 5px;
            border: none;
            background-color: rgb(243, 156, 18);
            color: white;
            margin: 20px 60px;
            width: 60px;
            height: 30px;
        }
        input[type=reset]{
            border-radius: 5px;
            border: none;
            margin-left: 50px;
            width: 60px;
            height: 30px;
        }

    </style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>도토리 충전</title>
</head>
<body>
    <div id="paymentwrap">
        <div id="paymentHead">
            도토리 충전
            <div id="headright"><a href="#" style="color:white;">공지사항</a> |  <a href="#" style="color:white;">고객센터</a></div>
        </div>
        <div id="paybody">
            <div>
                도토리 충전
                <span style="color: rgb(243, 156, 18);">50 </span>
                개
                | 결제수단
            </div>
            <hr>
            <!-- <form action="/Acorn/pointCharge" method="POST" name="updateAcorn"> -->
            <form>
                <label>도토리 충전</label>
                <div id="charge">
                        <input type="radio" id="1000" name="Acorn" value="1000" onclick="radioChange()"><label for="1000">10개(1,000원)</label>
                        <input type="radio" id="3000" name="Acorn" value="3000" onclick="radioChange()"><label for="3000">30개(3,000원)</label>
                        <input type="radio" id="5000" name="Acorn" value="5000" onclick="radioChange()"><label for="5000">50개(5,000원)</label>
                        <br>
                        <input type="radio" id="10000" name="Acorn" value="10000" onclick="radioChange()"><label for="10000">100개(10,000원)</label>
                        <input type="radio" id="10000" name="Acorn" value="30000" onclick="radioChange()"><label for="30000">300개(30,000원)</label>
                        <br>
                        <input type="radio" id="num" name="Acorn" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g,'$1');" 
                        onclick="radioChange()"><label for="num">직접 입력</label><input type="text" id="getAcorn" placeholder="직접입력"><label>개(0원)</label>
                        <br>                 

                </div>
                <br>
                <label>결제 수단</label>
                <div id="payway">
                <label>결제 수단 선택</label>
                    <select>
                        <option value="payco">페이코 결제</option>
                        <option value="naverpay">네이버 페이 결제</option>
                    </select>
                </div>
                <br>
                <input type="checkbox"><label>이용 약관에 동의합니다.</label>
                <br>
                <input type="checkbox"><label>결제 대행사에 결제 정보 제공하는것을 동의합니다.</label>
                <hr>

                <button onclick="goPaymentAPI()">결제하기</button>
                <!-- <input type="button" id="buy" value="결제"> -->
                <input type="reset" value="취소">

            
                
            </form>   
            <div>

            </div>
        </div>


    </div>
    
    <script>
       	/* function radioChange(event){
    		var pointAmount = document.querySelector('input[name="Acorn"]:checked').value;	
	    	console.log("1" + pointAmount);
    	} */      	
    	
/*      	function goPaymentAPI(){
    		var IMP = window.IMP;
    		IMP.init("imp23737244");
    		IMP.request_pay({
    			pg: "kakao",
    			pay_method: "card",
    			amount: "1"    			
    		}, async function(rsp){
    			alert("결제 완료");
    			console.log(rsp);
    			let response = await fetch("/payment",{
    				method:"POST",
    				body:JSON.stringify(rsp),
    				headers:{
    					"Content-Type":"application/json; charset=utf-8"
    				}
    			});
    			
    			let parseResponse = await response.text();
    			console.log(parseResponse);
    			if(parseResponse === "ok"){
    				location.href="/acorn";
    			}    		}
    		)}; 
    		 */
/*     		
    $(document).ready(function(){
    	
    	

    	
    	
    	/* console.log("111" + pointAmount); */	
    	
    }); */
    	
/*     	var IMP = window.IMP;
    	var code = "imp23737244";
    	IMP.init(code);
    	
    	$('#buy').click(function(e){
    		IMP.request_pay({
    			pg: 'kakao',
    			pay_method: 'card',
    			merchant_uid: 'merchant_' + new Date().getTime(),
    			name: '도토리 충전',
    			amount: pointAmount
    			}, function(rsp){
    				if(rsq.success){
    					var msg = '결제 완료';
    					var result = {
    							"amount": rsp.money,    							
   								"merchant_uid": rsp.merchant_uid,
    							"pay_date" : new Date().getTime()
    					}
    					console.log('성공' + msg);
    					$.ajax({
    						url: '/cash/insert.do',
    						type:'POST',
    						data: JSON.stringify(result,
    								["amount", "merchant_uid","pay_date"]),
    						contentType: 'application/json;charset=utf-8',
    						dataType: 'json',
    						success: function(res){
    							
    							if(res == 1){
    								console.log("성공");	
    							}else{
    								console.log("실패");
    							}
    						},
    						error: function(){
    							console.log("통신 실패");
    						}  						
    						
    						
    					}) //ajax
    				}else{
    					var msg = '결제 실패';
    					msg += '에러 : ' + rsq.error_msg;
    				}
    				console.log(msg);
    			}    		
    	}); //pay
    	
    }); // click 이벤트 */
    
    
    
	/* const IMP = window.IMP;
	IMP.init("imp23737244");
	
	
	console.log(pointAmount);
	function requestPay(){
		IMP.request_pay({
			pg: "kakao",
			pay_method: "card",
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: "도토리 충전",
			amount: pointAmount
			},function (rsp){
				if(rsq.success){
				const msg = '결제 완료';
				console.log(msg)
				updateAcorn.submint();
				}else{
				const msg ='결제 실패';
				alert(msg);
	    		}
			});
		} 
	 */	
		/* var pointAmount = document.querySelector('input[name="Acorn"]:checked').value; */
		/* var pointAmount = $(":input:radio[name=Acorn]:checked").val(); */
		/* var pointAmount = $('input[name=Acorn]').val(); */
		/* var pointAmount = $('input:radio[name="Acorn"]:checked').val(); */

		

    </script>
</body>
</html>