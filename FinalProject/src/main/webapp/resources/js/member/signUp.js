/* 유효성 검사용 객체 */
const checkObj = {
    "memberEmail" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "memberTel" : false,
    "memberAddress" : false
}

/* input 요소 얻어오기 */
const emailMessage = document.getElementById("emailMessage");
const memberEmail = document.getElementById("memberEmail");
const sendEmailBtn = document.getElementById("sendEmailBtn");
const emailTimerSpan = document.getElementById("emailTimer");
const pwAtKey = document.getElementById("pwAuthenticationKey");
const findPwBtn = document.getElementById("findPwBtn");    

/* ------------------------------------------------------------------------------ */

/* 이메일 인증 */

/* 이메일 인증용 변수 선언 */
let emailTimer;                                               
let emailIsRunning = false;

memberEmail.addEventListener("input",()=>{

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(memberEmail.value)){

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
    
    else{
        emailMessage.innerText="이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");
        checkObj.memberEmail = false;
    }

})

// 이메일 인증 번호 전송
sendEmailBtn.addEventListener("click", e=>{
    
    if(checkObj.memberEmail){
        
        fetch("/member/ajaxEmail", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : memberEmail.value
        })
        .then(response => response.text())
        .then( resultPwAtKey => {
            if(resultPwAtKey!=""){
                if (emailIsRunning) clearInterval(emailTimer);
                startTimer(60*5-1, 2);
    
                e.target.innerText = "인증 번호 재전송";
    
                set_cookie(memberEmail.value.replace("@","_")+"_pwAtKey", resultPwAtKey, 5);
                
                Swal.fire({
                    icon: 'success',                     
                    title: '인증 번호 전송 성공',    
                    text: '이메일을 확인해 주세요.', 
                });

                checkObj.memberEmail = false;
    
            } else{
                
                Swal.fire({
                    icon: 'error',                     
                    title: '인증 번호 전송 실패',    
                    text: '이메일을 확인해 주세요.', 
                });

                checkObj.memberEmail = false;
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

    }
})

const authMessage = document.getElementById("authMessage");

// 이메일 인증 번호 일치 확인
findPwBtn.addEventListener("click", ()=>{

    const emailCookieValue = get_cookie(memberEmail.value.replace("@","_")+"_pwAtKey");

    if(emailCookieValue == null){

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호 전송에 실패했습니다.',
        });

        checkObj.memberEmail = false;
        return;
    }

    if(pwAtKey.value.trim().length == 0){

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 입력해 주세요.',    
        });

        checkObj.memberEmail = false;
        return;
    }

    if(emailCookieValue == pwAtKey.value){
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
        e.preventDefault();
    }

})


// 휴대폰 인증
const memberTels = document.getElementsByName("memberTel");
let memberTel = "";
const sendSmsBtn = document.getElementById("sendSmsBtn");
const smsTimerSpan = document.getElementById("smsTimer");
const idAtKey = document.getElementById("idAuthenticationKey");
const findIdBtn = document.getElementById("findIdBtn");

let smsTimer;
let smsIsRunning = false;

sendSmsBtn.addEventListener("click", (e) => {

    memberTel = "";

    for (let i of memberTels) {
        if (i.value.trim().length == 0) {

            Swal.fire({
                icon: 'error',                     
                title: '인증 번호 전송 실패',    
                text: '휴대폰 번호를 입력해 주세요.', 
            });

            return;
        }
        memberTel += i.value;
    }

    // 기존 쿠키 삭제
    delete_cookie(memberTel + "_idAtKey");

    // ajax 코드 작성
    fetch("/member/sendSms", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: memberTel,
    })
        .then((response) => response.text())
        .then((resultIdAtKey) => {
            if (resultIdAtKey != "") {
                // 타이머 세팅
                if (smsIsRunning) clearInterval(smsTimer); // 이미 타이머가 실행중이면 초기화
                startTimer(60 * 5 - 1, 1); // sms 타이머 함수 실행
                // 1회 이상 전송시 버튼 문구 변경
                e.target.innerText = "인증 번호 재전송";
                // 5분간 유효한 쿠키 생성
                set_cookie(memberTel + "_idAtKey", resultIdAtKey, 5);
                // 안내문구 출력

                Swal.fire({
                    icon: 'success',                     
                    title: '인증 번호 전송 성공',    
                    text: '휴대폰을 확인해 주세요.', 
                });

            } else {

                Swal.fire({
                    icon: 'success',                     
                    title: '인증 번호 전송 실패',    
                    text: '휴대폰 번호를 다시 확인해 주세요.', 
                });
            }
        })
        .catch((err) => {
            console.log("예외 발생");
            console.log(err);
        });
});

const telMessage = document.getElementById("telMessage");

findIdBtn.addEventListener("click", () => {
    const smsCookieValue = get_cookie(memberTel + "_idAtKey");

    /* 인증 실패 */
    if (smsCookieValue == null) {

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 전송해 주세요.',    
        });

        return;

    } else {
        console.log(smsCookieValue);
    }

    if (idAtKey.value.trim().length == 0) {

        Swal.fire({
            icon: 'error',                     
            title: '인증 번호를 입력해 주세요.',    
        });

        return;
    }

    /* 인증 성공 */
    if (smsCookieValue == idAtKey.value) {

        telMessage.innerText = "인증되었습니다.";
        telMessage.classList.add("confirm");
        telMessage.classList.remove("error");
        clearInterval(emailTimer);
        emailTimerSpan.innerText = "";

        checkObj.memberTel = true;
    
    /* 인증 실패 */
    } else {
        telMessage.innerText = "인증 번호가 일치하지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");

        checkObj.memberTel = false;
    }
});

/* ----------------------------------------------------------------------------- */

/* 비밀번호 유효성 검사 */
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

memberPw.addEventListener("input", ()=>{

    if(memberPw.value.trim().length==0){

        memberPw.value="";

        pwMessage.innerText= "영어, 숫자, 특수문자(!,@,#,-,_) 6~20자 사이로 입력해 주세요.";
        pwMessage.classList.remove("confirm", "error");
        
        checkObj.memberPw = false;

        return;
    }

    const regEx = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/;

    if(regEx.test(memberPw.value)){

        checkObj.memberPw = true;

        if(memberPwConfirm.value.trim().length == 0){

            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

        } else{

            if (memberPw.value == memberPwConfirm.value) {
                pwMessage.innerText = "비밀번호가 일치합니다.";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");

                checkObj.memberPwConfirm = true;
            }
            else {
                pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");

                checkObj.memberPwConfirm = false;
            }
        }
    }

    else{ 
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.memberPw = false;
    }
})

/* 비밀번호 확인 유효성 검사 */
memberPwConfirm.addEventListener("input", ()=>{

    if(checkObj.memberPw){

        if(memberPw.value == memberPwConfirm.value){
            pwMessage.innerText = "비밀번호가 일치합니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

            checkObj.memberPwConfirm = true;
        }

        else{
            pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");

            checkObj.memberPwConfirm = false;
        }
    }

    else{

        Swal.fire({
            icon: 'error',                     
            title: '비밀번호를 다시 입력해 주세요.',    
        });

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

    if (memberNickname.value.trim().length == 0) {

        nickMessage.innerText = "한글, 영어, 숫자 2~10자 사이로 입력해주세요.";
        nickMessage.classList.remove("confirm", "error");

        checkObj.memberNickname = false; 
        memberNickname.value = "";

        return;

    } else {

        const regEx = /^[가-힣A-Za-z0-9]{2,10}$/;

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

        } else { 
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

signUpFrm.addEventListener("submit",e=>{

    let allChecked = true; 

    const chkBoxes = document.getElementsByName('chk');
    
    for (let i = 0; i < chkBoxes.length; i++) {
        if (!chkBoxes[i].checked) {
            allChecked = false; 
            break; 
        }
    }

    if (!allChecked) {

        Swal.fire({
            icon: 'error',                     
            title: '모든 약관에 동의해 주세요.',    
        });

        e.preventDefault();
        return; 
    }

    if (
        sample6_postcode.value.trim() === "" ||
        sample6_address.value.trim() === "" 
    ) {

        Swal.fire({
            icon: 'error',                     
            title: '주소를 모두 입력해 주세요.',    
        });

        sample6_postcode.focus();
        checkObj.memberAddress = false;
        e.preventDefault(); 
        return; 
    }

    for(let key in checkObj){

        if(!checkObj[key]){

            switch(key){

                case "memberEmail" : 
                    Swal.fire({
                        icon: 'error',                     
                        title: '이메일이 유효하지 않습니다.',    
                    }); break;

                case "memberPw" :
                    Swal.fire({
                        icon: 'error',                     
                        title: '비밀번호가 유효하지 않습니다.',    
                    }); break;

                case "memberPwConfirm" :
                    Swal.fire({
                        icon: 'error',                     
                        title: '비밀번호가 확인되지 않았습니다.',    
                    }); break;

                case "memberNickname" : 
                    Swal.fire({
                        icon: 'error',                     
                        title: '닉네임이 유효하지 않습니다.',    
                    }); break;

                case "memberTel" :
                    Swal.fire({
                        icon: 'error',                     
                        title: '휴대폰 번호가 유효하지 않습니다.',    
                    }); break;

                case "memberAddress" : 
                    Swal.fire({
                        icon: 'error',                     
                        title: '주소가 유효하지 않습니다.',    
                    }); break;
            }
            
            document.getElementById(key).focus();

            e.preventDefault();

            return; 
        }
    }
})

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

