
// 회원 정보
const memberNickname = document.getElementById("memberNickname");
const updateInfo = document.getElementById("updateInfo");
const nickMessage = document.getElementById("nickMessage");
const memberTel = document.getElementById("memberTel");


initNickname = memberNickname.value;
initTel = memberTel.value;


// 닉네임 유효성
memberNickname.addEventListener("input", () => {
    if(initNickname == memberNickname.value){
        memberNickname.removeAttribute("style");

        return;
    }
    const regEx = /^[가-힣0-9\w\s]*[가-힣][가-힣0-9\w\s]{2,10}$/;

    if(regEx.test(memberNickname.value)){

        fetch("/checkNick/nickname?nickname=" + memberNickname.value)
        .then(nickname => nickname.text())
        .then(name => {
            if(name == 0){
                nickMessage.innerText="사용 가능한 닉네임입니다."
                memberNickname.style.color = "#99E1ED";
            }else{
                nickMessage.innerText="이미 사용 중인 닉네임입니다."
                memberNickname.style.color = "red";
            }
        })
        .catch(err => console.log(err))
    }else{
        memberNickname.style.color = "red";
    
    }
    console.log(initTel)
});

// 전화번호 유효성
memberTel.addEventListener("input", () => {

    if(initTel == memberTel.value){
        memberTel.removeAttribute("style");

        return;
    }

    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regEx.test(memberTel.value)){

        memberTel.style.color = "red";
    } else{
        memberTel.style.color = "red";
    }

});



updateInfo.addEventListener("submit" , e=>{

    
    
    // 닉네임이 중복
    if(memberNickname.style.color == "red"){

        alert("닉네임 형식이 유효하지 않습니다.");

        memberNickname.focus();

        e.preventDefault();

        return;
    }

    if(memberTel.style.color == "red"){

        alert("전화번호 형식이 유효하지 않습니다.");

        memberTel.focus();

        e.preventDefault();

        return;

    }

    const newPw = document.getElementById("newPw");
    const newPwConfirm = document.getElementById("newPwConfirm");
    
    
    if(newPw.value.trim().length != 0){
            
        const regEx = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/;
    
        if(!regEx.test(newPw.value)){
            alert("비밀번호가 유효하지 않습니다.");
            
            e.preventDefault();
            newPw.focus();
            
            return;
        
        }
        
        if(newPw.value != newPwConfirm.value){
            
            alert("두 비밀번호가 일치하지 않습니다.");
            
            newPwConfirm.focus();
            e.preventDefault();
            
            return;
        }
    }

    document.getElementById("updateInfo").submit();
    

})



// ----------------------------------------------------------------------------
// 전화번호 인증
// 아이디 찾기 sms 인증번호 전송
const sendSmsBtn = document.getElementById("sendSmsBtn");       // sms 인증번호 받기 버튼
const findIdBtn = document.getElementById("tel-auth-btn");         // 아이디 찾기 버튼

const idAtKey = document.getElementById("idAuthenticationKey"); // sms 인증번호 입력 input

let memberTel2 =""; 
let smsTimer;  
let smsIsRunning = false; 
const smsTimerSpan = document.getElementById("smsTimer");  

let resultKey="";

sendSmsBtn.addEventListener("click", e=>{
    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regEx.test(memberTel.value)){
        // ajax 코드 작성
        fetch("/member/sendSms/update", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : memberTel.value
        })
        .then(response => response.text() )
        .then( resultIdAtKey => {
        
            if(resultIdAtKey!=""){
                // 타이머 세팅
                if (smsIsRunning) clearInterval(smsTimer); // 이미 타이머가 실행중이면 초기화
                startTimer(60*5-1, 1); // sms 타이머 함수 실행
                // 1회이상 전송시 버튼 문구 변경
                e.target.innerText = "재전송";
                // 5분간 유효한 쿠키 생성
                set_cookie(memberTel.value+"_idAtKey", resultIdAtKey, 5);
                // 안내문구 출력
                Swal.fire({
                    icon: 'success',                     
                    title: '인증번호가 전송되었습니다.',
                    text: '휴대폰을 확인해주세요.'
                });
                resultKey=resultIdAtKey;
            }
            
        })
        .catch(err =>{
            console.log("예외 발생");
            console.log(err);
        })
        
    }else {
        Swal.fire({
            icon: 'error',                     
            title: '전화번호 형식이 유효하지 않습니다.',
            
        });


    }
    
})

findIdBtn.addEventListener("click",()=>{
    

    if(resultKey == idAtKey.value){
        Swal.fire({
            icon: 'success',                     
            title: '인증되었습니다.',
        });

        memberTel.style.color = "#99E1ED";
        
    }else{
        Swal.fire({
            icon: 'error',                     
            title: '인증번호가 일치하지 않습니다.',
        });

    }
    
})

// 타이머 함수
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