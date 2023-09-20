/* const checkObj = {
    "memberEmail" : false,
    "mameberPw" : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "authKey" : false
}

const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

memberEmail.addEventListener("input",()=>{

    if(memberEmail.value.trim().length == 0) {
        memberEmail.value = "";
        emailMessage.innerText = "메일을 받을 이메일을 작성해주세요.";

        emailMessage.classList.remove("confirm", "error");

        checkObj.memberEmail = false;
        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(memberEmail.value)){

        fetch("/signUp" + memberEmail.value)

        .then( response => response.text() )

        .then( count => {
            if(count == 0){
                emailMessage.innerText = "사용 가능한 이메일 입니다.";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");
                checkObj.memberEmail = true;
            } else{
                emailMessage.innerText = "사용하고 있는 이메일 입니다.";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");
                checkObj.memberEmail = false;
            }
        })

        .catch(err => {
            console.error(err)
        });

    } else{
        emailMessage.innerText = "이메일 형식이 올바르지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");
        checkObj.memberEmail = false;
    }
    
})

const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

memberPw.addEventListener("input", () => {
    if (memberPw.value.trim().length == 0) {
        memberPw.value = "";
        pwMessage.innerText = "영어, 숫자, 특수문자 8~16자 사이로 입력해주세요.";
        pwMessage.classList.remove("confirm", "error");
        checkObj.memberPw = false;
        return;
    }

    const regEx = /^[a-zA-Z\d\!\@\#\-\_]{8,16}$/; // 오타 수정: a-zA-z -> a-zA-Z

    if (regEx.test(memberPw.value)) {
        checkObj.memberPw = true;

        if (memberPwConfirm.value.trim().length == 0) {
            pwMessage.innerText = "유효한 비밀번호 방식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        } else {
            if (memberPw.value == memberPwConfirm.value) {
                pwMessage.innerText = "일치한 비밀번호입니다.";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.memberPwConfirm = true;
            } else {
                pwMessage.innerText = "일치하지 않는 비밀번호입니다.";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.memberPwConfirm = false;
            }
        }
    } else {
        pwMessage.innerText = "유효하지 않은 비밀번호 방식입니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.memberPw = false;
    }
});

memberPwConfirm.addEventListener("input", () => {
    if (checkObj.memberPw) {
        if (memberPw.value == memberPwConfirm.value) {
            pwMessage.innerText = "비밀번호가 일치합니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            checkObj.memberPwConfirm = true;
        } else {
            pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");
            checkObj.memberPwConfirm = false;
        }
    } else {
        alert("비밀번호를 다시 입력해주세요.");
        memberPwConfirm.value = "";
        memberPw.focus();
    }
});


const memberNickname = document.getElementById("memberNickname");

const nickMessage = document.getElementById("nickMessage");

memberNickname.addEventListener("input", () =>{
    if(memberNickname.value.trim().length == 0) {

        nickMessage.innerText = "한글,영어,숫자로만 2~10글자 사이로 입력해주세요";

        nickMessage.classList.remove("confirm", "error");

        checkObj.memberNickname = false;
        memberNickname.value = "";

        return;
    } else{
        const regEx = /^[가-힣A-Za-z0-9]{2,10}$/;

        if(regEx.test(memberNickname.value)) {

        fetch("/signUp" + memberNickname.value)

        .then( nickname => nickname.text() )
        .then( name => {
            if(name == 0){
                nickMessage.innerText = "사용 가능한 닉네임 입니다.";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");

                checkObj.memberNickname = true;

            } else {
                nickMessage.innerText = "이미 사용중인 닉네임 입니다.";
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

const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.memberEmail){


        fetch("/sendEmail/signUp?email=" + memberEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.");
                tempEmail.log("인증번호 발송 실패");
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        })

        alert("인증번호가 발송 되었습니다.");

        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");

        authTimer = window.setInterval(()=>{

            authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);

            if(authMin == 0 && authSec == 0){
                checkObj.authKey = false;
                clearInterval(authTimer);
                return;
            }

            if(authSec == 0){
                authSec = 60;
                authMin--;
            }

            authSec--;


        }, 1000)
    }else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        memberEmail.focus();
    }
});


const authKey = document.getElementById("authKey");


 */