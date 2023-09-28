/* 유효성 검사용 객체 */
const checkObj = {
    "memberEmail" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "memberTel" : false,
    "sample6_postcode" : false
}

/* ------------------------------------------------------------------------------ */

/* 이메일 인증 */

/* input 요소 얻어오기 */
const emailMessage = document.getElementById("emailMessage");
const memberEmail = document.getElementById("memberEmail");
const sendEmailBtn = document.getElementById("sendEmailBtn");
const emailTimerSpan = document.getElementById("emailTimer");
const emailAtKey = document.getElementById("email-auth-key");
const emailAuthBtn = document.getElementById("email-auth-btn");    

/* 이메일 인증용 변수 선언 */
let emailTimer;                                               
let emailIsRunning = false;

/* 이메일이 입력될 때마다 */
memberEmail.addEventListener("input",()=>{

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    /* 올바른 형식일 때 */
    if(regEx.test(memberEmail.value)){

        /* 이메일 중복 검사 */
        fetch("/checkEmail/email?email=" + memberEmail.value)
        .then( response => response.text() ) 
        .then( count => {
            
            if(count == 0){

                emailMessage.innerText="사용 가능한 이메일입니다.";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");

                checkObj.memberEmail = true;

            } else{

                emailMessage.innerText="이미 사용 중인 이메일입니다.";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");

                checkObj.memberEmail = false;
            }

        }) 
        .catch(err => console.log(err)) 

    }
    
    /* 올바른 형식이 아닐 때 */
    else{
        emailMessage.innerText="이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        checkObj.memberEmail = false;
    }

})

/* 이메일 인증 번호 전송 */
sendEmailBtn.addEventListener("click", e=>{
    
    /* 유효성 검사가 완료되었을 경우 */
    if(checkObj.memberEmail){
        
        fetch("/member/ajaxEmail", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : memberEmail.value
        })
        .then(response => response.text())
        .then( resultEmailAtKey => {
            if(resultEmailAtKey!=""){
                if (emailIsRunning) clearInterval(emailTimer);
                startTimer(60*5-1, 2);
    
                e.target.innerText = "인증 번호 재전송";
    
                set_cookie(memberEmail.value.replace("@","_")+"_emailAtKey", resultEmailAtKey, 5);
                
                Swal.fire({
                    icon: 'success',                     
                    title: '인증 번호 전송 성공',    
                    text: '이메일을 확인해 주세요.', 
                });

                checkObj.memberEmail = false;
                emailAtKey.focus();
    
            } else{
                
                Swal.fire({
                    icon: 'error',                     
                    title: '인증 번호 전송 실패',    
                    text: '이메일을 확인해 주세요.', 
                });

                checkObj.memberEmail = false;
                memberEmail.focus();
            }
            
        })
        .catch(err =>{
            console.log("예외 발생");
            console.log(err);
        })

    } else {

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호 전송 실패',    
            text: '인증 번호를 받을 이메일을 입력해 주세요.', 
        });

        memberEmail.focus();
    }
})

/* 이메일 인증 결과 출력 영역 */
const authMessage = document.getElementById("authMessage");

/* 이메일 인증 번호 일치 확인 */
emailAuthBtn.addEventListener("click", ()=>{

    const emailCookieValue = get_cookie(memberEmail.value.replace("@","_")+"_emailAtKey");

    /* 인증 번호를 보내지 않은 경우 */
    if(emailCookieValue == null){

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 전송해 주세요.',
        });

        checkObj.memberEmail = false;
        return;
    }

    /* 인증 번호를 입력하지 않은 경우 */
    if(emailAtKey.value.trim().length == 0){

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 입력해 주세요.',    
        });

        emailAtKey.focus();
        checkObj.memberEmail = false;
        return;
    }

    if(emailCookieValue == emailAtKey.value){

        authMessage.innerText = "인증되었습니다.";
        authMessage.classList.add("confirm");
        authMessage.classList.remove("error");

        clearInterval(emailTimer);
        emailTimerSpan.innerText = "";

        checkObj.memberEmail = true;

    } else{
        authMessage.innerText = "인증 번호가 일치하지 않습니다.";
        authMessage.classList.add("error");
        authMessage.classList.remove("confirm");

        checkObj.memberEmail = false;
    }

})

/* ------------------------------------------------------------------------------------ */

// 휴대폰 인증
const memberTels = document.getElementsByName("memberTel");
let memberTel = "";

const sendSmsBtn = document.getElementById("sendSmsBtn");
const smsTimerSpan = document.getElementById("smsTimer");

const telAtKey = document.getElementById("tel-auth-key");
const telAuthBtn = document.getElementById("tel-auth-btn");

let smsTimer;
let smsIsRunning = false;

/* 휴대폰 인증 번호 버튼 클릭 시 */
sendSmsBtn.addEventListener("click", (e) => {

    memberTel = "";

    for (let i of memberTels) {

        /* 휴대폰 번호를 입력하지 않았을 때 */
        if (i.value.trim().length == 0) {

            Swal.fire({
                icon: 'error',                     
                title: '인증 번호 전송 실패',    
                text: '휴대폰 번호를 입력해 주세요.', 
            });

            memberTel.focus();
            return;
        }

        memberTel += i.value;
    }

    // 기존 쿠키 삭제
    delete_cookie(memberTel + "_telAtKey");

    // ajax 코드 작성
    fetch("/member/sendSms", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: memberTel,
    })
        .then((response) => response.text())
        .then((resultTelAtKey) => {

            if (resultTelAtKey != "") {

                // 타이머 세팅
                if (smsIsRunning) clearInterval(smsTimer); // 이미 타이머가 실행중이면 초기화
                startTimer(60 * 5 - 1, 1); // sms 타이머 함수 실행

                // 1회 이상 전송시 버튼 문구 변경
                e.target.innerText = "인증 번호 재전송";

                // 5분간 유효한 쿠키 생성
                set_cookie(memberTel + "_telAtKey", resultTelAtKey, 5);

                // 안내문구 출력
                Swal.fire({
                    icon: 'success',                     
                    title: '인증 번호 전송 성공',    
                    text: '휴대폰을 확인해 주세요.', 
                });

                telAtKey.focus();

            } else {

                Swal.fire({
                    icon: 'success',                     
                    title: '인증 번호 전송 실패',    
                    text: '휴대폰 번호를 다시 확인해 주세요.', 
                });

                memberTel.focus();
            }
        })
        .catch((err) => {
            console.log("예외 발생");
            console.log(err);
        });
});

/* 휴대폰 인증 결과 출력 영역 */
const authMessage2 = document.getElementById("authMessage2");

/* 휴대폰 인증 버튼 클릭 시 */
telAuthBtn.addEventListener("click", () => {
    const smsCookieValue = get_cookie(memberTel + "_telAtKey");

    /* 인증 번호 전송을 안 눌렀을 때 */
    if (smsCookieValue == null) {

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 전송해 주세요.',    
        });

        return;
    }

    /* 인증 번호를 입력 안 했을 때 */
    if (telAtKey.value.trim().length == 0) {

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 입력해 주세요.',    
        });

        telAtKey.focus();
        return;
    }

    /* 인증 성공 */
    if (smsCookieValue == telAtKey.value) {

        authMessage2.innerText = "인증되었습니다.";
        authMessage2.classList.add("confirm");
        authMessage2.classList.remove("error");
        clearInterval(smsTimer);
        smsTimerSpan.innerText = "";

        checkObj.memberTel = true;
    
    /* 인증 실패 */
    } else {
        authMessage2.innerText = "인증 번호가 일치하지 않습니다.";
        authMessage2.classList.add("error");
        authMessage2.classList.remove("confirm");

        checkObj.memberTel = false;
        telAtKey.focus();
    }
});

/* ----------------------------------------------------------------------------- */

/* 비밀번호 유효성 검사 */
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

/* 비밀번호 입력 시 유효성 검사 */
memberPw.addEventListener("input", ()=>{

    /* 비밀번호를 입력하지 않았을 때 */
    if(memberPw.value.trim().length == 0){

        memberPw.value= "";

        pwMessage.innerText= "영어, 숫자, 특수문자(!,@,#,-,_) 6~20자 사이로 입력해 주세요.";
        pwMessage.classList.remove("confirm", "error");
        
        checkObj.memberPw = false;

        return;
    }

    /* 비밀번호 유효성 검사 정규 표현식 */
    const regEx = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/;

    /* 비밀번호가 유효한 형식일 때 */
    if(regEx.test(memberPw.value)){

        checkObj.memberPw = true;

        /* 비밀번호 확인을 입력하지 않았을 경우 */
        if(memberPwConfirm.value.trim().length == 0){

            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

        } else{ /* 비밀번호 확인을 입력했을 경우 */

            /* 비밀번호와 비밀번호 확인이 일치할 경우 */
            if (memberPw.value == memberPwConfirm.value) {

                pwMessage.innerText = "비밀번호가 일치합니다.";

                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");

                checkObj.memberPwConfirm = true;
            }
            else { /* 비밀번호 확인이 일치하지 않을 경우 */

                pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");

                checkObj.memberPwConfirm = false;
            }
        }
    }

    /* 비밀번호 형식이 유효하지 않을 때 */
    else{ 
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.memberPw = false;
    }
})

/* 비밀번호 확인 유효성 검사 */
memberPwConfirm.addEventListener("input", ()=>{

    /* 비밀번호가 유효할 경우 */
    if(checkObj.memberPw){

        /* 비밀번호와 비밀번호 확인이 일치할 때 */
        if(memberPw.value == memberPwConfirm.value){

            pwMessage.innerText = "비밀번호가 일치합니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

            checkObj.memberPwConfirm = true;
        }

        else{ /* 비밀번호와 비밀번호 확인이 일치하지 않을 때 */

            pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");

            checkObj.memberPwConfirm = false;
        }
    }

    else{ /* 비밀번호가 유효하지 않을 경우 */

        Swal.fire({
            icon: 'error',                     
            title: '비밀번호 형식이 유효하지 않습니다.',    
        });

        memberPw.value="";
        memberPwConfirm.value="";
        memberPw.focus();

        checkObj.memberPwConfirm = false;
    }
})

/* ------------------------------------------------------------------------------- */

/* 닉네임 유효성 검사 */

const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");

memberNickname.addEventListener("input", () => {

    /* 닉네임을 입력하지 않았을 경우 */
    if (memberNickname.value.trim().length == 0) {

        nickMessage.innerText = "한글, 영어, 숫자 2~10자 사이로 입력해주세요.";
        nickMessage.classList.remove("confirm", "error");

        checkObj.memberNickname = false; 

        return;

    } else { /* 닉네임을 입력했을 경우 */

        /* 닉네임 유효성 검사 */
        const regEx = /^[가-힣A-Za-z0-9]{2,10}$/;

        /* 닉네임 형식이 유효할 경우 중복 검사*/
        if (regEx.test(memberNickname.value)) { 

            fetch("/checkNick/nickname?nickname=" + memberNickname.value)
            .then( nickname => nickname.text() )
            .then( name => {
                if (name == 0) {

                    nickMessage.innerText = "사용 가능한 닉네임입니다.";
                    nickMessage.classList.add("confirm");
                    nickMessage.classList.remove("error");

                    checkObj.memberNickname = true; 

                }else{

                    nickMessage.innerText = "이미 사용 중인 닉네임입니다.";
                    nickMessage.classList.add("error");
                    nickMessage.classList.remove("confirm");

                    checkObj.memberNickname = false;    

                }
            })
            .catch(err => console.log(err))

        } else { /* 닉네임 형식이 유효하지 않을 경우 */

            nickMessage.innerText = "유효하지 않은 닉네임 형식입니다.";
            nickMessage.classList.add("error");
            nickMessage.classList.remove("confirm");

            checkObj.memberNickname = false;

        }

    }

})

/* ------------------------------------------------------------------------------- */

/* 주소 관련 변수 */
const sample6_postcode = document.getElementById("sample6_postcode");
const sample6_address = document.getElementById("sample6_address");

/* 회원 가입 */
const signUpFrm = document.getElementById("signUpFrm");

/* 회원가입 폼 제출 시 */
signUpFrm.addEventListener("submit", e=>{

    let allChecked = true; 

    /* 이용 약관 체크박스 */
    const chkBoxes = document.getElementsByName('chk');
    
    /* 약관 체크가 전부 되었는지 확인 */
    for (let i = 0; i < chkBoxes.length; i++) {
        if (!chkBoxes[i].checked) {
            allChecked = false;
            break; 
        }
    }

    /* 약관 체크가 전부 되어 있지 않을 경우 */
    if (!allChecked) {

        alert('모든 약관에 동의해 주세요.');

        document.getElementById('chkAll').focus();
        e.preventDefault();
        return;
    }

    /* 주소 입력이 되었는지 확인 */

    /* 주소 입력이 하나라도 되어 있지 않을 경우 */
    if ( sample6_postcode.value.trim().length == 0 || sample6_address.value.trim().length == 0 ) {

        alert("주소를 모두 입력해 주세요.");

        sample6_address.focus();
        checkObj.sample6_postcode = false;
        e.preventDefault(); 

        return;
    }

    checkObj.sample6_postcode = true;

    /* 유효성 검사용 객체 확인 */
    for(let key in checkObj){

        /* 유효성 검사 결과가 false인 경우 */
        if(!checkObj[key]){

            switch(key){

                case "memberEmail" : 
                    alert("이메일이 유효하지 않습니다.");
                    break;

                case "memberPw" :
                    alert("비밀번호가 유효하지 않습니다.");
                    break;

                case "memberPwConfirm" :
                    alert("비밀번호 확인이 유효하지 않습니다.");
                    break;

                case "memberNickname" : 
                    alert("닉네임이 유효하지 않습니다.");
                    break;

                case "memberTel" :
                    alert("휴대폰 번호가 유효하지 않습니다.");
                    break;

                case "sample6_postcode" : 
                    alert("주소를 모두 입력해 주세요.");
                    break;
            }
            
            document.getElementById(key).focus();

            e.preventDefault();

            return; 
        }
    }
})

/* ---------------------------------------------------------------------- */

/* 이메일, 휴대폰 번호 인증 시 타이머 함수 */

function startTimer(count, mode) { // 타이머시간, 모드(1:sms, 2:email)
    if(mode==1){ // sms 인증일 때

        let minutes, seconds;

        smsTimer = setInterval(function () {
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            smsTimerSpan.innerText = minutes + ":" + seconds;

            // 타이머 종료
            if (--count < 0) {
                clearInterval(smsTimer);
                smsTimerSpan.innerText = "";
                smsIsRunning = false;
            }
        }, 1000);

        smsIsRunning = true;
    }
    else{ // email 인증일 때

        let minutes, seconds;

        emailTimer = setInterval(function () {
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            emailTimerSpan.innerText = minutes + ":" + seconds;

            // 타이머 종료
            if (--count < 0) {
                clearInterval(emailTimer);
                emailTimerSpan.innerText = "";
                emailIsRunning = false;
            }
        }, 1000);

        emailIsRunning = true;
    }
}

//쿠키 생성하는 함수
function set_cookie(name, value, minute) {
    let date = new Date();
    date.setTime(date.getTime(date.toUTCString(Math.floor((new Date()).getTime() / 1000))));
    date.setMinutes(date.getMinutes()+minute);
    document.cookie = encodeURIComponent(name) + '=' + encodeURIComponent(value) + ';expires=' + date.toUTCString() + ';path=/';
}

//쿠키 값 가져오는 함수
function get_cookie(name) {
    let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
}

//쿠키 삭제하는 함수
function delete_cookie(name) {
    document.cookie = encodeURIComponent(name) + '=; expires=Thu, 01 JAN 1999 00:00:10 GMT;path=/';
}

/* ---------------------------------------------------------------------- */

/* 이용 약관 전체 선택 */
function toggleAllAgree() {
    var chkAll = document.getElementById('chkAll');
    var chkBoxes = document.getElementsByName('chk');
  
    if (chkAll.checked) {
      for (var i = 0; i < chkBoxes.length; i++) {
        chkBoxes[i].checked = true;
      }
    } else {
      for (var i = 0; i < chkBoxes.length; i++) {
        chkBoxes[i].checked = false;
      }
    }
  }
  
  function checkIndividualAgreements() {
    var chkAll = document.getElementById('chkAll');
    var chkBoxes = document.getElementsByName('chk');
    var allChecked = true;
  
    for (var i = 0; i < chkBoxes.length; i++) {
      if (!chkBoxes[i].checked) {
        allChecked = false;
        break;
      }
    }
  
    chkAll.checked = allChecked;
  }