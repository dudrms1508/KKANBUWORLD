<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

.registerbtn{
	width: 460px;
 	height: 35px;
 	background-color: #FF6F61;
 	color: white;
 	margin: 20px 0px 10px;
 	font-size: 120%;
 	font-weight: bold;
 	border-style: none;
 	border-radius: 10px;
}
body{
background: #F6F6F6;
}
p{
font-size: 10px;}
a{
height :14px;
width :32px;
font-family: Dotum,'돋움',Helvetica,sans-serif;
}
.inputBox {
	width: 202px;
	height: 25px;
	display: block;
	position: relative;

	height: 29px;
	line-height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

.mainback {
	height: 1048px;
	width: 450px;
	margin: auto;
}

.spaninput {
	display: block;
	position: relative;
	width: 100%;
	height: 45px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	vertical-align: top;
}

.stepurl {
	position: absolute;
	top: 16px;
	right: 13px;
	font-size: 15px;
	line-height: 18px;
	color: #8e8e8e;
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
		

		<div class="mainback">
				<div>
				<div id ="logo" style=" text-align: center;"><img  src="${pageContext.request.contextPath}/resources/images/logo1.png">	
					</div><br>
					<a>아이디</a>
					<div>
						<span class="spaninput">
						 <input class="inputBoxid"type="text" name="userid" id="registerid"><span class="stepurl">@helloworld.com</span>
						</span>
					</div>
					<p id="useridtxt"></p>
				</div>

				<div>
					<a>비밀번호</a>	
					<div>
						<span class="spaninput"> <input class="inputBoxPw"
							type="password" name="password" id ="registerpw"><samp class="stepurl"><img class="passwordimg" src="${pageContext.request.contextPath}/resources/images/nopassword.PNG"></samp>
						</span>
						<p id="userpwtxt"></p>
					</div>
				</div>
					<div>
					<a>비밀번호 재확인</a>	
					<div>
						<span class="spaninput"> <input class="reinputBoxPw"
							type="password"  id ="reinputBoxPw"><samp class="stepurl"><img class="passwordckimg" src="${pageContext.request.contextPath}/resources/images/notpass.PNG"></samp>
						</span>
						<p id="reuserpwtxt"></p>
					</div>
				</div>
				<div>
					<a>이름</a>
					<div>
						<span class="spaninput"> <input class="inputBoxname"
							type="text" name="user_name">
						</span>
					</div>
				</div>
				<div>

					<label for="user_gender">성별</label> <span class="spaninput">
						<select class="inputBoxgender" id="user_gender" name="user_gender"
						size="1">
							<option value="">선택하세요</option>
							<option value="M">남자</option>
							<option value="W">여자</option>
					</select>
					</span>
				</div>
				<br>
				<div>
					<a>본인확인 이메일 (선택)</a>
					<div>
						<span class="spaninput"> <input class="inputBoxemail"
							type="text" name="user_email">
						</span>
					</div>
				</div>
				<div>
					<a>생년월일</a>
					<div>
						<span class="spaninput">
						
								<input  type="text" name="user_birth" class = "userBirthYear" maxlength="4" placeholder="년(4자)"> <span> <select id="user_gender"
									name="user_birth" class = "userBirthMonth" size="1">
										<option value="">월</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select>
								</span> <input type="text" name="userBirthDay" class="userBirthDay"
									maxlength="2" placeholder="일">
							
						</span>
					</div>
				</div>
				<p id="userbir"></p>

				<div>
					<a>휴대전화</a>
					<div>
						<span class="spaninput"> <input class="inputBoxphone"
							type="text" name="user_phone"></span>
					</div>
				</div>
					<p id="phoentxt"></p>


				<button type="button"  class ="registerbtn">가입하기</button>
			
		</div>
	</div>
	
	<script type="text/javascript">
	
	
	$(document).ready(function(){
		var idRegExp = /^[a-z0-9][a-z0-9_\-].{4,19}$/; //아이디 유효성 검사
		var password1RegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/; // 비밀번호 유효성 검사
		
	$(".inputBoxid").blur(function () {
		var userid =$(".inputBoxid").val();
 		$.ajax({
			 type : 'post',
			 url : '/helloworld/user/useridselect/'+userid,
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
			data : JSON.stringify(userid),
			success : function(result){
	  	        if(result == 1){
	  	        	 useridtxt.style.color = 'red';
	  		         useridtxt.innerHTML = '이미존재한 아이디입니다.';
	  	         }else if (userid == "") {
	  		         useridtxt.style.color = 'red';
	  		         useridtxt.innerHTML = '필수 입력사항';
	  		        }else if (userid.length < 5 || userid.length >20){
	  		       	 useridtxt.style.color = 'red';
	  		         useridtxt.innerHTML = '아이디는 5~20자로 제한합니다' ;
	  		        } 
	  		        else if (!idRegExp.test(userid)) {
	  		         useridtxt.style.color = 'red';
	  		         useridtxt.innerHTML = '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'
	  		        } else {
	  		         useridtxt.style.color = '#53C14B';
	  		         useridtxt.innerHTML = '멋진 아이디네요!';
	  		        }
	  	       }			
		}); 
	}); // inputBoxid.blur end
	
	
	
	
	$(".inputBoxPw").blur(function () {
	var	pw = $(".inputBoxPw").val();
	console.log(pw);
		if(pw == ""){
			userpwtxt.style.color = 'red';
		    userpwtxt.innerHTML = '필수 정보입니다.';
		    $(".passwordimg").attr("src", "${pageContext.request.contextPath}/resources/images/notpassword.PNG");
		} else if (pw.length < 8 || pw.length >17){
			userpwtxt.style.color = 'red';
			userpwtxt.innerHTML = '비밀번호는 8~16자로 제한합니다' ;
			  $(".passwordimg").attr("src", "${pageContext.request.contextPath}/resources/images/notpassword.PNG");
	   }else if (!password1RegExp.test(pw)) {
		  	userpwtxt.style.color = 'red';
	       	userpwtxt.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
	        $(".passwordimg").attr("src", "${pageContext.request.contextPath}/resources/images/notpassword.PNG");
	      } else {
	        userpwtxt.style.color = '#53C14B';
	        userpwtxt.innerHTML = '사용 가능한 비밀번호';
	        $(".passwordimg").attr("src", "${pageContext.request.contextPath}/resources/images/passpassword.PNG");
	      }
	}); //inputBoxPw.blur end
	
	$(".reinputBoxPw").blur(function () {
		var	pw = $(".inputBoxPw").val();
		var repw = $(".reinputBoxPw").val();
		console.log(pw);
		
		if(repw == ""){
				reuserpwtxt.style.color = 'red';
				reuserpwtxt.innerHTML = '필수 정보입니다.';
				
		}else if(pw == repw){
			reuserpwtxt.style.color = '#53C14B';
				reuserpwtxt.innerHTML = '일치합니다.';
			    $(".passwordckimg").attr("src", "${pageContext.request.contextPath}/resources/images/passsave.PNG");
			}else {
				reuserpwtxt.style.color = 'red';
				reuserpwtxt.innerHTML = '비밀번호가 일치하지 않습니다.';
				
				 $(".passwordckimg").attr("src", "${pageContext.request.contextPath}/resources/images/notpass.PNG");
				
			}
		});// reinputBoxPw.blur end
	
	$(".inputBoxname").blur(function () {
		var	username = $(".inputBoxname").val();
		if(username == ""){
			reuserpwtxt.style.color = 'red';
			reuserpwtxt.innerHTML = '필수 정보입니다.';
			}
		});// inputBoxname.blur  end
	
	$(".userBirthYear").blur(function(){
		var year = $(".userBirthYear").val();
		console.log(year);
		if(year == ""){
				reuserpwtxt.style.color = 'red';
				reuserpwtxt.innerHTML = '필수 정보입니다.';
			}else if(year >2021){
				userbir.style.color = 'red';
				userbir.innerHTML = '미래에서 오셨네요?.';
			}
	});//userBirthYear.blur  end
	
	$(".userBirthMonth").blur(function(){
		var Month = $(".userBirthMonth").val();
			console.log(Month);

		if(Month == ""){
			userbir.style.color = 'red';
			userbir.innerHTML = '필수 정보입니다.';
			}
	});// userBirthMonth.blur  end
	
	$(".userBirthDay").blur(function(){
		var Day = $(".userBirthDay").val();
		console.log(Day);
		if(Day == ""){
			userbir.style.color = 'red';
			userbir.innerHTML = '필수 정보입니다.';
			}
	});//userBirthDay.blur  end
	
	$(".inputBoxphone").blur(function(){
		var phoen = $(".inputBoxphone").val();
		console.log(phoen);
		if(phoen == ""){
			phoentxt.style.color = 'red';
			phoentxt.innerHTML = '필수 정보입니다.';
			}
	});//inputBoxphone.blur  end
	
	$(".inputBoxgender").blur(function(){
		var gender = $(".inputBoxgender").val();
		console.log(gender);
		if(gender == ""){
			phoentxt.style.color = 'red';
			phoentxt.innerHTML = '필수 정보입니다.';
			}
	});//inputBoxphone.blur  end
	
	$(".mainback").on("click", ".registerbtn" ,function(){
 		var userid =$(".inputBoxid").val(); // 아이디 
 		var	pw = $(".inputBoxPw").val(); //회원 비밀번호
		var	username = $(".inputBoxname").val(); //이름 
		var	gender = $(".inputBoxgender").val(); // 성별 
		var Year = $(".userBirthYear").val(); // 생일 /년
		var Month = $(".userBirthMonth").val(); // 생일 /월 
		var Day = $(".userBirthDay").val();    // 생일 /일
		var phoen = $(".inputBoxphone").val();// 핸드폰 번호 
		var user_email = $(".inputBoxemail").val(); // 이메일
		
		if (Day < 10){
			Day = '0'.concat(Day);
		}
		
		var user_birth =  Year.concat(Month);
		user_birth = user_birth.concat(Day);
		console.log(user_birth);
		var obj = {
				'userid' : userid,
				'password': pw,
				'user_name' : username,
				'user_gender' : gender,
				'user_email' : user_email,
				'user_birth':user_birth,
				'user_phone':phoen
		};// obj end
		$.ajax({
			url : '/helloworld/user/user-register',
			type : 'post',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
			data : JSON.stringify(obj),
			success : function(result){
	  	        if(result == 'success'){
	  	          alert('회원가입성공')		  	          
	  	      
	  	        } // end if()
	  	      var target = encodeURI('/user/login');
	  		console.log(target);
	  		location = target;
	  	      }// end success()
		});
		
	});// mainback.on(click) end
	  $('#logo').click(function() {//로고클릭 

			location = '/helloworld';

		});
});// document ready()end
	
	
	</script>
</body>
</html>