const checkObj = {
    "mameberPw" : false,
    "memberPwConfirm" : false,
}

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





if(secessionFrm != null){
    secessionFrm.addEventListener("submit", e=>{

        if(agree.checked == false){

            alert("약관에 동의 후 탈퇴 버튼을 눌러주세요.");

            e.preventDefault();

            return;
        }

    })
}

const myPageFrm = document.getElementById("myPageFrm");

myPageFrm.addEventListener("submit", e=> {
    for(let key in checkObj){
        if(!checkObj[key]){

            switch(key){
                case "memberPw" : alert("유효한 비밀번호 형식이 아닙니다. 다시 시도해주세요"); break;
                case "memberPwConfirm" : alert("유효한 비밀번호 확인 형식이 아닙니다. 다시 시도해주세요"); break;
            }

            document.getElementById(key).focus();

            e.preventDefault();
            return;
        }
    }
})