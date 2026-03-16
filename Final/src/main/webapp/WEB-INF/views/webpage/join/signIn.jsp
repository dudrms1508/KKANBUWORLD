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
<title>회원가입</title>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="${ path }/resources/js/join/signIn.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
    #wrapdiv {
        width: 550px;
        margin: 0 auto;
    }

    #wrapdiv>h1 {
        width: 100%;
        text-align: center;
    }

    #rectanglediv {
        width: 100%;
        height: 100%;
        border: 1px solid rgba(0,0,0,.12);
        /* padding: 30px; */
        margin-bottom: 40px;
    }

    #contentdiv {
        margin: 10px 20px 0px 20px;
        padding: 55px 30px 50px 30px;
        /* border: 1px solid black; */
    }

    #progressdiv {
        width: 60px;
        height: 4px;
        margin-bottom: 32px;
        border-radius: 4px;
        background: rgba(0,0,0,.08);
    }

    #progressdiv>div {
        border-radius: 4px;
        float: left;
        box-sizing: border-box;
    }

    .joindiv {
        /* border: 1px solid lightpink; */
        margin-bottom: 20px;
    }

    .titleClassdiv {
        font-weight: 600;
        margin-bottom: 3px;
    }

    .inputClassdiv {
        width: 360px;
        height: 25px;
    }

    .inputClassdiv input {
        width: 100%;
        height: 100%;
        padding: 2px 3px 0px 3px;
        margin: 0px;
        border-radius: 4px;
        border: 1px solid lightgray;
    }
    
    .inputClassdiv>input:focus {
        outline: 1px solid rgb(245, 124, 77);
        border: 1px solid white;
    }

    .inputClassdiv>input::placeholder {
        color: lightgray;
    }


    .alertText {
        margin-top: 8px;
        font-size: 12px;
        display: inline-block;
        width: 100%;
    }

    #birthdiv {
        width: 300px;
        height: 27px;     
    }

    #birthdiv>div {
        float: left;
        width: 90px;
        height: 100%;
        box-sizing: border-box;;
    }

    #yeardiv {
        margin-right: 15px;
    }

    #daydiv {
        margin-left: 15px;
    }

    #birthdiv>div>span {
        display: block;
        position: relative;
        width: 100%;
        height: 100%;
        box-sizing: border-box;
    }

    .birthClass {
        position: relative;
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0 0 0 5px;
        box-sizing: border-box;
        border: 1px solid lightgray;
        border-radius: 4px;
    }

    .birthClass:focus {
        outline: 1px solid rgb(245, 124, 77);
        border: 1px solid white;
    }

    .birthClass::placeholder {
        color: lightgray;
    }

    .selClassdiv {
        width: 300px;
        height: 27px;
    }

    #selgender {
        width: 100%;
        height: 100%;
        padding: 2px 3px 0px 3px;
        margin: 0px;
        border-radius: 4px;
        border: 1px solid lightgray;        
    }

    #selgender:focus {
        outline: 1px solid rgb(245, 124, 77);
        border: 1px solid white;
    }

    .floatdiv {
        height: 25px;
    }

    .floatinnerdiv {
        width: 360px;
        height: 100%;
    }

    .floatinnerdiv input {
        width: 100%;
        height: 100%;
        padding: 2px 3px 0px 3px;
        margin: 0px;
        border-radius: 4px;
        border: 1px solid lightgray;
    }
    
    .floatinnerdiv>input:focus {
        outline: 1px solid rgb(245, 124, 77);
        border: 1px solid white;
    }

    .floatinnerdiv>input::placeholder {
        color: lightgray;
    }

    .floatdiv>div{
        float: left;
    }

    .floatdiv>div>.certifiedbtn{
        margin-left: 10px;
        display: flex;
        line-height: 23px;
        padding: 3px 5px 0 5px;
    }
    
    .certifiedbtn {
        /* margin-left: 10px; */
        background-color: whitesmoke;
        border: 1px solid lightgray;
        border-radius: 4px;
        height: 100%;
        font-size: 12px;
    }


    #detailaddressdiv {
        margin: 7px 0 0 0;
    }
    
    #mailcertInputdiv {
        margin: 7px 0 0 0;
        display: none;
    }

    #joinbtndiv{
        width: 100%;
        height: 50px;
        padding-top: 38px;
    }
    
    /* 약관 동의 전 스타일 */
    #joinbtndiv>button {
        display: block;
        width: 100%;
        height: 50px;
        border: 0px;
        border-radius: 4px;
        font-weight: 400;
        font-size: 16px;
        line-height: 51px;
        color: white;
        background-color: rgb(243, 156, 18);
        cursor: pointer;
    }

</style>
</head>
<body>
    <div id="wrapdiv">
        <h1><a href="${ path }/" style="text-decoration: none; color: rgb(245, 124, 77);">KKANBU</a></h1>
        <div id="rectanglediv">
            <div id="contentdiv">
                <div style="padding-bottom: 39px;">
                <div id="progressdiv">
                    <div style="width: 100%; background-color: #4c4c4c; height: 4px;"></div>
                </div>
                <h2 style="font-weight: 500;">
                    깐부월드
                    <br>
                    회원가입 페이지 입니다.
                </h2>
                </div>
                <form action="${ path }/join/signIn" method="post">
                    <div class="joindiv">
                        <div class="titleClassdiv">아이디<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="inputClassdiv"><input type="text" name="id" id="id" placeholder="첫 글자 영문자를 포함하여 6~12글자 사이로 입력해 주세요." required></div>
                        <div class="alertText"><span id="idMsg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">비밀번호<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="inputClassdiv"><input type="password" name="password" id="pwd" placeholder="대/소문자, 특수문자, 숫자 각 하나씩 포함하여 6~12글자 사이로 입력해 주세요." required></div>
                        <div class="alertText"><span id="pwdMsg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">비밀번호 재확인<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="inputClassdiv"><input type="password" id="pwd2" placeholder="비밀번호를 다시 입력하세요." required></div>
                        <div class="alertText"><span id="pwd2Msg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">이름<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="inputClassdiv"><input type="text" name="name" id="name" placeholder="이름을 입력하세요." required></div>
                        <div class="alertText"><span id="nameMsg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">생년월일<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div id="birthdiv">
                            <div id="yeardiv">
                                <span>
                                    <input type="text" name="year" id="year" class="birthClass" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="년(4자)"  maxlength="4" required>
                                </span>
                            </div>
                            <div id="monthdiv">
                                <span>
                                    <select id="month" name="month" class="birthClass">
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </span>
                            </div>
                            <div id="daydiv">
                                <span>
                                    <input type="text" name="day" id="day" class="birthClass" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2" placeholder="일">
                                </span>
                            </div>
                        </div>
                        <div class="alertText"><span id="birthMsg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">성별<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="selClassdiv">
                            <select name="gender" id="selgender">
                                <option value="F">여자</option>
                                <option value="M">남자</option>
                                <option value="N">선택안함</option>
                            </select>
                        </div>
                        <div class="alertText"><span></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">이메일<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="floatdiv">
                            <div class="inputClassdiv">
                                <input type="text" name="email" id="email" placeholder="이메일을 입력하세요." required>
                            </div>
                            <div>
                                <input type="button" class="certifiedbtn" id="emailcertbtn" value="인증" disabled>
                            </div>
                        </div>
                        <div class="inputClassdiv" id="mailcertInputdiv"><input type="text" id="mailcertInput" placeholder="인증번호를 입력하세요."></div>
                        <div class="alertText"><span id="emailMsg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">휴대폰번호<span style="color: rgb(245, 124, 77);">*</span></div>
                        <div class="floatdiv">
                            <div class="inputClassdiv">
                                <input type="tel" name="phone" id="phone" placeholder="휴대폰번호를 입력하세요." pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13">
                            </div>
                            <!-- <div>
                                <button type="button" class="certifiedbtn">인증</button>
                            </div> -->
                        </div>
                        <div class="alertText"><span id="phoneMsg"></span></div>
                    </div>
                    <div class="joindiv">
                        <div class="titleClassdiv">주소</div>
                        <div class="floatdiv">
                            <div class="floatinnerdiv">
                                <input type="text" name="address" id="addressInput" placeholder="주소를 입력하세요." readonly>
                            </div>
                            <div>
                                <button type="button" class="certifiedbtn" id="addressbtn">주소검색</button>
                            </div>
                        </div>
                        <div class="inputClassdiv" id="detailaddressdiv"><input type="text" name="detailAddress" id="detailaddress" placeholder="상세주소 입력"></div>
                        <div class="alertText"><span>상세주소를 입력해주세요.</span></div>
                    </div>
                    <div id="joinbtndiv">
                        <button type="submit" id="joinbtn">가입하기</button>
                    </div>
                </form>

            <!-- contentdiv 끝 -->
            </div>
        <!-- rectanglediv 끝 -->
        </div>
    
    </div>



<script>
//아이디 검사 기본값 false (++ 중복검사하기)
let idReady = false;

//비밀번호 검사 기본값 false
let pwdReady = false;
let pwd2Ready = false;

//이름 검사 기본값 false
let nameReady = false;

//생년월일 검사 기본값 false
let birthReady = false;

//이메일 검사 기본값 false (++ 중복검사하기)
let emailReady = false;

//휴대폰번호 검사 (++ 중복검사 하기)
let phoneReady = false;


// 중복검사 아이디, 이메일, 휴대폰번호
let idDuplReady = false;
let emailDuplReady = false;
let phoneDuplReady = false;

$(document).ready(() => {
	
	// 아이디 중복검사
	$('#id').on('keyup', () => {
		let id = $('#id').val();
		
		$.ajax({
			url:'${ path }/join/check',
			type: 'POST',
			dataType: 'json',
			data : {
				id
			},
			success: (data) => {
				console.log(data);
				console.log()
				if(data.duplicatedId) {
					// 중복 아이디 있음
					$('#idMsg').html('중복된 아이디 입니다.').css('color', 'deeppink');
					idDuplReady = false;
				} else {
					// 중복 아이디 없음
					idDuplReady = true;
				}
			},
			error: (error) => {
				console.log(error);
			}
		// ajax 끝
		});
	// 아이디 keyup 이벤트 끝	
	});
	
 	$('#email').on('keyup', () => {
		let email = $('#email').val();
		
		$.ajax({
			url: '${ path }/join/check',
			type: 'POST',
			dataType: 'json',
			data: {
				email
			},
			success: (data) => {
				console.log(data);
				console.log(data.duplicatedEmail)
				
				if(data.duplicatedEmail) {
					
					// 중복 이메일 있음
					$('#emailMsg').html('중복된 이메일 입니다.').css('color', 'deeppink');
					emailDuplReady = false;
				} else {
					
					// 중복 이메일 없음
					emailDuplReady = true;
				}
			},
			error: (error) => {
				console.log(error)
			}
			
			
		// ajax 끝
		});
		
		
	// 이메일 keyup 이벤트 끝
	});
	
 	
 	// 휴대폰번호 중복 검사
 	$('#phone').on('keyup', () => {
		let phone = $('#phone').val();
		
		$.ajax({
			url: '${ path }/join/check',
			type: 'POST',
			dataType: 'json',
			data: {
				phone
			},
			success: (data) => {
				console.log(data);
				console.log(data.duplicatedPhone)
				
				if(data.duplicatedPhone) {
					
					// 중복 이메일 있음
					$('#emailcertbtn').attr('disabled',true);
					$('#phoneMsg').html('중복된 휴대폰번호 입니다.').css('color', 'deeppink');
					phoneDuplReady = false;
				} else {
					
					// 중복 이메일 없음
					phoneDuplReady = true;
				}
			},
			error: (error) => {
				console.log(error)
			}
			
			
		// ajax 끝
		});
		
		
	// 이메일 keyup 이벤트 끝
	});
	
	
	
	
	
	// 이메일 인증
    $('#emailcertbtn').click(function() {
		// let mailcertInput = $('#mailcertInput') // 인증번호 입력 input태그
		
		let emailaddress = $('#email').val(); // 이메일 주소값 얻어오기!
        console.log('완성된 이메일 : ' + emailaddress); // 이메일 오는지 확인
		
        // 이메일 검사 테스트
        console.log(emailReady);
        
		$.ajax({
			type : 'get',
			// url : '<c:url value ="/user/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email 가능 -> 변형함 data로 보냄
			url : '${path}/join/mailCheck',
// 			dataType: 'json',
			data: {
				emailaddress
			},
			success : function (data) {
				console.log("data : " +  data);
                // 인증버튼 비활성화
                $('#emailcertbtn').attr('disabled',true);
                // 숨겨져있던 input display는 block으로
                $('#mailcertInputdiv').css('display', 'block');
				
				code = data;
				$('#emailMsg').html('인증번호가 전송되었습니다.');
			}			
		}); // end ajax
	}); // end send email   

	
	// 인증번호 비교
	$('#mailcertInput').blur(function () {
		const inputCode = $(this).val();
		mailcertInput
// 		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$('#emailMsg').html('인증번호가 일치합니다.').css('color','green');
// 			$('#mail-Check-Btn').attr('disabled',true);
			$('#email').attr('readonly',true);
			// 인증 일치하면 true로
			emailReady = true;
			console.log(emailReady);
// 			$('#userEamil2').attr('readonly',true);
// 			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
// 	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$('#emailMsg').html('인증번호가 불일치 합니다. 다시 확인해주세요.');
			$('#emailMsg').css('color','red');
			// 인증 실패하면 false
			emailReady = false;
			console.log(emailReady);
		}
	});
	
	

});

</script>
</body>
</html>