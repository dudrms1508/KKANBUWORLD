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
    <style>
        #paymentwrap{
            width: 400px;
            height: 270px;

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
<title>도토리 충전</title>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<!-- <script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
            <form novalidate>
                <label>도토리 충전</label>
                <div id="charge">
                        <input type="radio" id="10" name="Acorn" value="1000"><label for="10">10개(1,000원)</label>
                        <input type="radio" id="30" name="Acorn" value="3000"><label for="30">30개(3,000원)</label>
                        <input type="radio" id="50" name="Acorn" value="5000"><label for="50">50개(5,000원)</label>
                        <br>
                        <input type="radio" id="100" name="Acorn" value="10000"><label for="100">100개(10,000원)</label>
                        <input type="radio" id="300" name="Acorn" value="30000"><label for="300">300개(30,000원)</label>
                        <br>
                        <!-- <input type="radio" class="radio-value" id="inputvalue" name="Acorn" value="" ><label for="selectAcorn6">직접 입력</label><input type="text" id="getAcorn"><label>개(0원)</label>
                        <br>              -->        

                </div>
                <!-- <label>결제 수단</label>
                <div id="payway">
                <label>결제 수단 선택</label>
                    <select>
                        <option value="payco">페이코 결제</option>
                        <option value="naverpay">네이버 페이 결제</option>
                    </select>
                </div> -->
                <br>
                <input type="checkbox"><label>이용 약관에 동의합니다.</label>
                <br>
                <input type="checkbox"><label>결제 대행사에 결제 정보 제공하는것을 동의합니다.</label>
                <hr>

                <!-- <input type="submit" value="결제">   -->              
	          	<!-- <input type="button" onclick="payment('inicis','test','card')" value="충전"> -->
	          	<input type="button" onclick="payment()" value="충전">         
                <input type="reset" value="취소">
            </form>            
        </div>       
    </div>    

<script type="text/javascript">
/* 	function payment(pg_provider, mode, payment_method){
		IMP.init('imp23737244');
		var pg_mid;
		
		if(pg_provider=='inicis'){
			
			if(mode=='test'){
				pg_mid = 'html5_inicis';
			}else{
				pg_mid = 'html5_inicis';
			}
		}else if(pg_provider=='kcp'){
			if(mode=='test'){
				pg_mid = 'kcp.T0000';
			}else{
				pg_mid = 'kcp.IOfds34';
			}
		}
		alert(pg_mid);
		
		const data = {				
				pg: pg_mid,
				pay_method: payment_method,
				merchant_uid: 'dotori1',
				name: '도토리',
				amount: 1004,
				buyer_email: 'dudrms1508@gmail.com',
				buyer_name: '03',
				buyer_tel: '010-8673-0000',
		};
		
		IMP.request_pay(data, response => {
			// call back 함수로 전달받은 데이터를 백으로 보냄
			alert('callback!: ' + JSON.stringify(response));
			
			jQuery.ajax({
				url: "${path}/payment/callback_receive",
				method: "POST",
				headers: { "Content-Type": "application/json" },
				data: JSON.stringify(response)
			}).done(function (data){
				alert("Please, Check your payment result page!");
			})
		});		
	} */
	
	
	const AcornBuyerEmail = "${member.email}"
	const AcornBuyerName = "${member.name}"
	const AcornBuyerPhone = "${member.phone}"
	
	/* console.log(pointAmount); */
	console.log(AcornBuyerEmail);
	console.log(AcornBuyerName);
	console.log(AcornBuyerPhone);
	
	function payment(){
		
	IMP.init('imp23737244');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
	    name : '도토리 충전',
	    amount : parseInt($('input[name="Acorn"]:checked').val()),
	    buyer_email : AcornBuyerEmail,
	    buyer_name : AcornBuyerName,
	    buyer_tel : AcornBuyerPhone,  
	    
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "${path}/payment/callback_receive", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;	        
	        alert(msg);
	    }
	});
	}
</script>
</body>

</html>