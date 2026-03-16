window.onload = function() {
	
    // 휴대전화 하이픈(-) 넣는 함수
    function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }



    // 아이디 유효성 검사
    // 아이디 중복확인 추가 검사하기(++)
    let idInput = document.getElementById('id');
    // span에 알림 경고 텍스트
    idInput.addEventListener('keyup', e => {
    let id = document.getElementById('id').value;
    let idRegExp = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,11}$/;

	
        if(id == "") {
            document.getElementById('idMsg').innerHTML = '';
            idReady = false;
            return false;
        } else if(!idRegExp.test(id)) {
            document.getElementById('idMsg').innerHTML = '<font color=red>사용가능한 아이디가 아닙니다.</font>';
            idReady = false;
            return false;
        } else {
            document.getElementById('idMsg').innerHTML = '<font color=green>사용가능한 아이디 입니다.</font>';
            idReady = true;
            return true;
        }
    });



    

    // 비밀번호 유효성 검사
    let pwdInput = document.getElementById('pwd');
    
    pwdInput.addEventListener('keyup', () => {
        let pwd = document.getElementById('pwd').value;
        let pwdRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;

        if(pwd == "") {
            document.getElementById('pwdMsg').innerHTML = '';
            pwdReady = false;
            return false;
        } else if(!pwdRegExp.test(pwd)) {
            document.getElementById('pwdMsg').innerHTML = '<font color=red>사용할 수 없는 비밀번호 입니다.</font>';
            pwdReady = false;
            return false;
        } else {
            document.getElementById('pwdMsg').innerHTML = '<font color=green>사용 가능한 비밀번호 입니다.</font>';
            pwdReady = true;
            return true;
        }
    });

    // 비밀번호 재입력 확인
    let pwd2Input = document.getElementById('pwd2');

    pwd2Input.addEventListener('keyup', () => {
        let pwd = document.getElementById('pwd').value;
        let pwd2 = document.getElementById('pwd2').value;
        
        if(pwd2 == "") {
            document.getElementById('pwd2Msg').innerHTML = '';
            pwd2Ready = false;
            return false;
        } else if(pwd != pwd2) {
            document.getElementById('pwd2Msg').innerHTML = '<font color=red>비밀번호가 동일하지 않습니다.</font>';
            pwd2Ready = false;
            return false;
        } else {
            document.getElementById('pwd2Msg').innerHTML = '<font color=green>동일한 비밀번호 입니다.</font>';
            pwd2Ready = true;
            return true;
        }
    });

    
    


    // 이름 유효성
    let nameInput = document.getElementById('name');

    // span에 알림 경고 텍스트
    nameInput.addEventListener('keyup', () => {
        let nameRegExp = /^[가-힣]{2,5}$/;
        let name = document.getElementById('name').value;
        
        if(name == "") {
            document.getElementById('nameMsg').innerHTML = '';
            nameReady = false;
            return false;
        } else if(!nameRegExp.test(name)) {
            document.getElementById('nameMsg').innerHTML = '<font color=red>정확한 이름을 입력하세요.</font>';
            nameReady = false;
            return false;
        } else {
            document.getElementById('nameMsg').innerHTML = '';
            nameReady = true;
            return true;
        }
    });

    
    


    // 생년월일 함수 유효성
    function birthChk() {
        let today = new Date();
        let year = document.getElementById('year').value;
        let yearNow = today.getFullYear();
        let month = document.getElementById('month').value;
        let day = document.getElementById('day').value;
        let zero = 0;
        
            if(year.length < 4) {
                document.getElementById('birthMsg').innerHTML = '태어난 년도 4자리를 정확하게 입력하세요.';
                birthReady = false;
                return false;
            } else if (year < 1900 || year > yearNow) {
                document.getElementById('birthMsg').innerHTML = '태어난 년도 4자리를 정확하게 입력하세요.';
                birthReady = false;
                return false;
            } else if (day < 1 || day > 31) {
                document.getElementById('birthMsg').innerHTML = '생년월일을 다시 확인해주세요.';
                birthReady = false;
                return false;
            } else if ((month == 4 || month == 6 || month == 9 || month == 11) && day==31) {
                document.getElementById('birthMsg').innerHTML = '생년월일을 다시 확인해주세요.';
                birthReady = false;
                return false;
            } else if (month == 2) {
                // 윤달 체크
                var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                if (day > 29 || (day == 29 && !isleap)) {
                    document.getElementById('birthMsg').innerHTML = '생년월일을 다시 확인해주세요.';
                    birthReady = false;
                    return false;
                } else {
                    document.getElementById('birthMsg').innerHTML = '';
                    birthReady = true;
                    return true;
                } //end of if (day>29 || (day==29 && !isleap))
                
            } else {
                document.getElementById('birthMsg').innerHTML = '';
                birthReady = true;
                return true;
            } //end of if
        

        // if(Number(day) < 10) {
        //     let dayAdd = String(zero)+ String(day);
        //     let birth = year + month + dayAdd;
            
        //     console.log(birth);
        //     console.log(day);
        // } else {
        //     let dayAdd = day;
        //     let birth = year + month + dayAdd;

        //     console.log(birth);
        //     console.log(day);
        // }

    
    }; // function 끝

    // span 출력 완료
    let yearChk = document.getElementById('year');
    let monthChk = document.getElementById('month');
    let dayChk = document.getElementById('day');

    // select는 change 이벤트 주기
    yearChk.addEventListener('keyup', birthChk);
    monthChk.addEventListener('change', birthChk);
    dayChk.addEventListener('keyup', birthChk);




    // 이메일 유효성
    let emailInput = document.getElementById('email');
    let emailcertbtn = document.getElementById('emailcertbtn');
    
    emailInput.addEventListener('keyup', () => {
        let emailRegExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        let email = document.getElementById('email').value;
        
        if(email == "") {
            document.getElementById('emailMsg').innerHTML = '';
            emailcertbtn.disabled = true;
            return false;
        } else if(!emailRegExp.test(email)) {
            document.getElementById('emailMsg').innerHTML = '<font color=red>정확한 이메일을 입력하세요.</font>';
            emailcertbtn.disabled = true;
            return false;
        } else {
            document.getElementById('emailMsg').innerHTML = '<font color=green>사용가능한 이메일 입니다.</font>';
            emailcertbtn.disabled = false;
            return true;
        }
    });
    
    
    // 이메일 인증버튼
    // let emailcertbtn = document.getElementById('emailcertbtn');
    
    emailcertbtn.addEventListener('click', () => {
        let mailcertInputdiv = document.getElementById('mailcertInputdiv');
        let mailcert = document.getElementById('mailcertInputdiv').value;
        
        // span태그의 html 변경
        document.getElementById('emailMsg').innerHTML = '';
        
        //
        emailcertbtn.disabled = true;
        emailInput.readonly = true;
//        emailInput.disabled = true;
        
    });


    

    // 휴대전화 하이픈 넣는 keyup 이벤트
    var phoneInput = document.getElementById('phone');
    phoneInput.onkeyup = function(event){
        event = event || window.event;
        var phone_val = this.value.trim();
        this.value = autoHypenPhone(phone_val);
    }


    // 휴대폰번호 메시지만 이벤트 막는거는 버튼에서하기
    phone.addEventListener('keyup', () => {
        let phone = document.getElementById('phone').value;
        var phoneRegExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

        if(phone == "") {
            document.getElementById('phoneMsg').innerHTML = '';
            phoneReady = false;
            return false;
        } else if(!phoneRegExp.test(phone)) {
            document.getElementById('phoneMsg').innerHTML = '<font color=red>휴대폰번호를 정확히 입력해주세요.</font>';
            phoneReady = false;
            return false;
        } else {
            document.getElementById('phoneMsg').innerHTML = '<font color=green>사용가능한 휴대폰번호 입니다.</font>';
            phoneReady = true;
            return true;
        }

    });





    // 지도 API
    let addressbtn = document.getElementById('addressbtn');
    
    // 지도 API는 http에서 동작함
    addressbtn.addEventListener('click', function() { //주소입력칸을 클릭하면
        
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅	
                // input을 변수 선언 시 동작하지 않음
            	document.getElementById('addressInput').value = data.address; // 주소 넣기
                document.getElementById('detailaddress').focus(); //상세입력 포커싱
            }
        }).open();
    });

    
    
    
    // submit 이벤트 막기!!!!
   	let joinbtn = document.getElementById('joinbtn');
    
    
    joinbtn.addEventListener('click', (event) => {
        console.log(idReady);
        console.log(pwdReady);
        console.log(pwd2Ready);
        console.log(nameReady);
        console.log(birthReady);
        console.log(emailReady);
        console.log(phoneReady);

        if(!idReady) {
            alert('사용할 수 없는 아이디입니다.');
            event.preventDefault();
        } else if(!idDuplReady) {
            alert('사용할 수 없는 아이디입니다.');
            event.preventDefault();            
        } else if(!pwdReady) {
            alert('사용할 수 없는 비밀번호입니다.');
            event.preventDefault();
        } else if(!pwd2Ready) {
            alert('비밀번호를 확인해주세요.');
            event.preventDefault();
        } else if(!nameReady) {
            alert('정확한 이름을 기입해주세요.');
            event.preventDefault();
        } else if(!birthReady) {
            alert('생년월일을 입력해주세요.');
            event.preventDefault();
        } else if(!emailReady) {
            alert('이메일을 확인해주세요.');
            event.preventDefault();
        } else if(!emailDuplReady) {
            alert('사용할 수 없는 이메일입니다.');
            event.preventDefault();
        } else if(!phoneReady) {
            alert('사용할 수 없는 휴대폰번호 입니다.');
            event.preventDefault();
        } else if(!phoneDuplReady) {
            alert('사용할 수 없는 휴대폰번호 입니다.');
            event.preventDefault();
        } 
        // else {
        //    alert('회원가입 성공')
        // }

    });


}
