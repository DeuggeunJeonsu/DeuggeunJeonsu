
// 회원 정보
const memberNickname = document.getElementById("memberNickname");
const updateInfo = document.getElementById("updateInfo");
const nickMessage = document.getElementById("nickMessage");
const memberTel = document.getElementById("memberTel");

if(updateInfo != null){
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

    });

    // 전화번호 유효성
    memberTel.addEventListener("input", () => {

        if(initTel == memberTel.value){
            memberTel.removeAttribute("style");

            return;
        }

        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

        if(regEx.test(memberTel.value)){

            memberTel.style.color = "#99E1ED";
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

}

// ----------------------------------------------------------------------------
// 전화번호 인증

// 휴대폰 인증
const memberTels = document.getElementsByName("memberTel");
let memberTel2 = "";

const sendSmsBtn = document.getElementById("sendSmsBtn");
const smsTimerSpan = document.getElementById("smsTimer");

const telAtKey = document.getElementById("tel-auth-key");
const telAuthBtn = document.getElementById("tel-auth-btn");

let smsTimer;
let smsIsRunning = false;

/* 휴대폰 인증 번호 버튼 클릭 시 */
sendSmsBtn.addEventListener("click", (e) => {

    memberTel2 = "";

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

        memberTel2 += i.value;
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
