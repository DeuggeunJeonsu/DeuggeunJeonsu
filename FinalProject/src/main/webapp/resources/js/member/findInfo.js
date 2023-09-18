// 아이디 찾기 관련
const idArea = document.getElementById("idArea");               // 아이디 찾기 영역
const memberTels = document.getElementsByName("memberTel");     // 입력한 전화번호
let memberTel ="";                                              // 전달될 전화번호
const sendSmsBtn = document.getElementById("sendSmsBtn");       // sms 인증번호 받기 버튼
const smsTimerSpan = document.getElementById("smsTimer");       // sms 인증번호 유효 시간
const idAtKey = document.getElementById("idAuthenticationKey"); // sms 인증번호 입력 input
const findIdBtn = document.getElementById("findIdBtn");         // 아이디 찾기 버튼
let smsTimer;                                                   // sms 타이머 인터벌함수
let smsIsRunning = false;                                       // sms 타이머 실행여부

// 비밀번호 찾기 관련
const pwArea = document.getElementById("pwArea");               // 비밀번호 찾기 영역
const memberEmail = document.getElementById("memberEmail");     // 입력한 이메일
const sendEmailBtn = document.getElementById("sendEmailBtn");   // email 인증번호 받기 버튼
const emailTimerSpan = document.getElementById("emailTimer");   // email 인증번호 유효 시간
const pwAtKey = document.getElementById("pwAuthenticationKey"); // email 인증번호 입력 input
const findPwBtn = document.getElementById("findPwBtn");         // 비밀번호 찾기 버튼
let emailTimer;                                                 // email 타이머 인터벌함수
let emailIsRunning = false;                                     // email 타이머 실행여부

// 아이디 찾기 sms 인증번호 전송
sendSmsBtn.addEventListener("click", e=>{
    memberTel ="";
    for( let i of memberTels){
        if(i.value.trim().length==0){
            alert("휴대폰번호를 입력해주세요");
            return;
        }
        memberTel += i.value;
    }

    // ajax 코드 작성
    fetch("/member/sendSms", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : memberTel
    })
    .then(response => response.text() )
    .then( ()=> {
        if(true){
            // 타이머 세팅
            if (smsIsRunning) clearInterval(smsTimer); // 이미 타이머가 실행중이면 초기화
            startTimer(60*5-1, 1); // sms 타이머 함수 실행

            // 1회이상 전송시 버튼 문구 변경
            e.target.innerText = "인증번호 재전송";
            
            alert("인증번호가 발송되었습니다. 휴대폰을 확인해주세요.");
        }
        else alert("해당 번호로 등록된 회원이 없습니다. 다시한번 확인해주세요.");
    })
    .catch(err =>{
        console.log("예외 발생");
        console.log(err);
    })

})

// sms 인증 후 아이디 찾기
findIdBtn.addEventListener("click",()=>{

    if(idAtKey.value.trim().length==0){
        alert("인증번호를 입력해주세요");
        return;
    }

    const data = {"memberTel" : memberTel,
                    "idAtKey" : idAtKey.value};

    // ajax 코드 작성
    fetch("/member/smsAuthentication", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(response => response.json() )
    .then(selectMember => {
        console.log(selectMember);

        if(selectMember !=null){ // 인증 성공 시
            alert("인증성공");
        }
        else alert("인증 실패");
        
    })
    .catch(err =>{
        console.log("예외 발생");
        console.log(err);
    })
})


// 타이머 함수 내용
function startTimer(count, mode) {
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