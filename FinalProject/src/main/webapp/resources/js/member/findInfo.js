// 아이디찾기 영역
const idArea = document.getElementById("idArea");               // 아이디 찾기 영역
const memberTels = document.getElementsByName("memberTel");     // 입력한 전화번호
let memberTel ="";                                              // 전달될 전화번호
const sendSmsBtn = document.getElementById("sendSmsBtn");       // sms 인증번호 받기 버튼
const smsTimerSpan = document.getElementById("smsTimer");       // sms 인증번호 유효 시간
const idAtKey = document.getElementById("idAuthenticationKey"); // sms 인증번호 입력 input
const findIdBtn = document.getElementById("findIdBtn");         // 아이디 찾기 버튼
let smsTimer;                                                   // sms 타이머 인터벌함수
let smsIsRunning = false;                                       // sms 타이머 실행여부

// 아이디찾기 결과창 영역
const resultArea = document.getElementById("resultArea");       // 아이디찾기 결과 모달창
const idResult = document.getElementById("idResult");           // 찾은 아이디 표시 할 span
const loginBtn = document.getElementById("resultRoginBtn");     // 모달창 로그인 버튼
const goToPwBtn = document.getElementById("resultFindPwBtn");   // 모달창 비밀번호찾기 버튼
const CloseBtn = document.getElementById("resultCloseBtn");     // 모달창 닫기 버튼

// 비밀번호찾기 영역
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
    .then( resultIdAtKey => {
        if(resultIdAtKey!=""){
            // 타이머 세팅
            if (smsIsRunning) clearInterval(smsTimer); // 이미 타이머가 실행중이면 초기화
            startTimer(60*5-1, 1); // sms 타이머 함수 실행
            // 1회이상 전송시 버튼 문구 변경
            e.target.innerText = "인증번호 재전송";
            // 5분간 유효한 쿠키 생성
            set_cookie(memberTel+"_idAtKey", resultIdAtKey, 5);
            // 안내문구 출력
            alert("인증번호가 전송되었습니다. 휴대폰을 확인해주세요.");
        }
        else alert("해당 번호로 등록된 회원이 없습니다. 다시한번 확인해주세요.");
    })
    .catch(err =>{
        console.log("예외 발생");
        console.log(err);
    })
})

// sms 인증 확인 및 회원아이디 불러오기
findIdBtn.addEventListener("click",()=>{
    const smsCookieValue = get_cookie(memberTel+"_idAtKey");
    
    if(smsCookieValue == null){ // 쿠키없음 == 인증번호 미발송 == 인증번호 만료
        alert("인증번호를 전송해주세요");
        return;
    }
    else{console.log(smsCookieValue);}

    if(idAtKey.value.trim().length==0){ // 인증번호 입력 칸이 비었을 때
        alert("인증번호를 입력해주세요");
        return;
    }

    if(idAtKey.value==smsCookieValue){ // 인증 성공 시
        const data = {"memberTel" : memberTel};

        // ajax 코드 작성
        fetch("/member/smsAuthentication", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(response => response.json())
        .then(selectMember => {
            if(selectMember !=null){
                // 찾은 아이디 결과 표시
                idResult.innerText = selectMember.memberEmail;

                // 모달 창 띄우기
                resultArea.style.display="flex";

                // sms 타이머 초기화
                clearInterval(smsTimer);
                smsTimerSpan.innerText="";

                // 전송버튼 내용 초기값으로 변경
                sendSmsBtn.innerText = "인증번호 전송";

                // 인증번호 쿠키 삭제
                delete_cookie(memberTel+"_idAtKey");
            }
            else alert("일치하는 회원 정보가 없습니다.");
        })
        .catch(err =>{
            console.log("예외 발생");
            console.log(err);
        })
    }
    else alert("인증번호가 일치하지 않습니다. 다시한번 확인해주세요.");
})

// 아이디찾기 결과창에서 로그인 버튼 클릭 시
loginBtn.addEventListener("click",()=>{
    location.href= location.href.replace('findInfo','login'); //로그인 화면으로
})

// 아이디찾기 결과창에서 비밀번호찾기 버튼 클릭 시
goToPwBtn.addEventListener("click",()=>{
    resultArea.style.display="none"; // 아이디 결과창 닫고
    memberEmail.value = idResult.innerText; // 비밀번호찾기 아이디 자동완성
    memberEmail.focus(); // 비밀번호 찾기 input으로 포커스 이동
})

// 아이디찾기 결과창 닫기 버튼 클릭 시
CloseBtn.addEventListener("click",()=>{
    resultArea.style.display="none";
})

// ---------------------------------------------------------------------------------------------

// 비밀번호찾기 email 인증번호 전송
sendEmailBtn.addEventListener("click", e=>{
    
    // ajax 코드 작성
    fetch("/member/sendEmail", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : memberEmail.value
    })
    .then(response => response.text())
    .then( resultPwAtKey => {
        if(resultPwAtKey!=""){
            // 타이머 세팅
            if (emailIsRunning) clearInterval(emailTimer); // 이미 타이머가 실행중이면 초기화
            startTimer(60*5-1, 2); // sms 타이머 함수 실행

            // 1회이상 전송시 버튼 문구 변경
            e.target.innerText = "인증번호 재전송";

            // 5분간 유효한 쿠키 생성
            set_cookie(memberEmail.value.replace("@","_")+"_pwAtKey", resultPwAtKey, 5);

            // 안내문구 출력
            alert("인증번호가 전송되었습니다. 이메일을 확인해주세요.");
        }
        else alert("해당 이메일로 등록된 회원이 없습니다. 다시한번 확인해주세요.");
    })
    .catch(err =>{
        console.log("예외 발생");
        console.log(err);
    })
})

// email 인증 확인 및 회원번호 불러오기
findPwBtn.addEventListener("click",()=>{
    const emailCookieValue = get_cookie(memberEmail.value.replace("@","_")+"_pwAtKey");

    if(emailCookieValue == null){ // 쿠키없음 == 인증번호 미발송 == 인증번호 만료
        alert("인증번호를 전송해주세요");
        return;
    }

    if(pwAtKey.value.trim().length==0){ // 인증번호 입력 칸이 비었을 때
        alert("인증번호를 입력해주세요");
        return;
    }

    if(pwAtKey.value==emailCookieValue){ // 인증 성공 시
        
        const data = {"memberEmail" : memberEmail.value};

        // ajax 코드 작성
        fetch("/member/emailAuthentication", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(response => response.json())
        .then(selectMember => {
            if(selectMember !=null){
                // 찾은 회원번호 저장
                const findPwMemberNo = document.createElement("input");
                findPwMemberNo.setAttribute("type","hidden");
                findPwMemberNo.setAttribute("name","findPwMemberNo");
                findPwMemberNo.setAttribute("id","findPwMemberNo");
                findPwMemberNo.setAttribute("value",""+selectMember.memberNo);

                // 비밀번호 찾기 영역 초기화
                pwArea.innerText="";

                // 비밀번호 재설정 폼태그
                const pwChangeFrm = document.createElement("form");
                pwChangeFrm.setAttribute("action","/member/changePw");
                pwChangeFrm.setAttribute("method","post");
                pwChangeFrm.setAttribute("id","pwChangeFrm");
                pwChangeFrm.setAttribute("onSubmit","return pwValidation();");

                // 타이틀
                const changePwTitle = document.createElement("p");
                changePwTitle.innerText="비밀번호 재설정";

                // 비밀번호 유효성검사 안내
                const section1 = document.createElement("section");
                section1.classList.add("regExSection");
                const regExDisplay = document.createElement("div");
                regExDisplay.setAttribute("id","regExDisplay");
                regExDisplay.innerText="영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.";
                section1.append(regExDisplay);

                // 비밀번호 입력
                const section2 = document.createElement("section");
                section2.classList.add("input-box");
                const inputPw = document.createElement("input");
                inputPw.classList.add("width100");
                inputPw.setAttribute("type","password");
                inputPw.setAttribute("name","changePw");
                inputPw.setAttribute("id","changePw");
                inputPw.setAttribute("placeholder","비밀번호");
                section2.append(inputPw);

                // 비밀번호확인 입력
                const section3 = document.createElement("section");
                section3.classList.add("input-box");
                const inputPwCheck = document.createElement("input");
                inputPwCheck.classList.add("width100");
                inputPwCheck.setAttribute("type","password");
                inputPwCheck.setAttribute("name","changePwCheck");
                inputPwCheck.setAttribute("id","changePwCheck");
                inputPwCheck.setAttribute("placeholder","비밀번호 확인");
                section3.append(inputPwCheck);

                // 비밀번호 설정 버튼
                const changePwBtn = document.createElement("button");
                changePwBtn.classList.add("findInfo-btn");
                changePwBtn.setAttribute("id","changePwBtn");
                changePwBtn.innerText = "비밀번호 설정하기";

                // 비밀번호 재설정 영역으로 리뉴얼
                pwChangeFrm.append(findPwMemberNo,changePwTitle,section1,section2,section3,changePwBtn);
                pwArea.append(pwChangeFrm);
                inputPw.focus();

                // 안내문구 출력
                alert(selectMember.memberNickname+"님 인증완료 되었습니다, 비밀번호를 재설정해주세요");
            }
            else alert("일치하는 회원 정보가 없습니다.");
        })
        .catch(err =>{
            console.log("예외 발생");
            console.log(err);
        })
    }
    else alert("인증번호가 일치하지 않습니다. 다시한번 확인해주세요.");
})

// 비밀번호 설정 버튼 눌렀을 때 예외처리 함수
function pwValidation(){

    const changePw = document.getElementById("changePw");
    const changePwCheck = document.getElementById("changePwCheck");

    // 정규 표현식을 이용한 비밀번호 유효성 검사
    const regEx = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/;

    if(changePw.value.trim().length==0){
        changePw.value="";
        changePw.focus();
        alert("비밀번호를 입력 해주세요.");
        return false;
    }
    if(changePwCheck.value.trim().length==0){
        changePwCheck.value="";
        changePwCheck.focus();
        alert("비밀번호 확인을 입력 해주세요.");
        return false;
    }
    if(!regEx.test(changePw.value)){
        alert("비밀번호가 유효하지 않은 형식입니다.");
        changePw.focus();
        return false;
    }
    if(!regEx.test(changePwCheck.value)){
        alert("비밀번호 확인이 유효하지 않은 형식입니다.");
        changePwCheck.focus();
        return false;
    }
    if(changePw.value != changePwCheck.value){
        changePw.value="";
        changePwCheck.value="";
        changePw.focus();
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    return true;
}

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