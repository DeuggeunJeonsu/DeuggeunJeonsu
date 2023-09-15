const checkObj = {
    "memberEmail" : false,
    "mameberPw" : false,
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

memberPw.addEventListener("input", ()=>{

    if(memberPw.value.trim().length == 0){
        memberPw.value = "";

        pwMessage.innerText = "영어,숫자,특수문자 8~16자 사이로 입력해주세요.";
        pwMessage.classList.remove("confirm", "error");

        checkObj.memberPw = false;
        return;
    }

    const regEx = /^[a-zA-z\d\!\@\#\-\_]{8,16}$/;

    if(regEx.test(memberPw.value)) {
        checkObj.mameberPw = true;

        if(memberPwConfirm.value.trim().length == 0){
            pwMessage.innerText = "유효한 비밀번호 방식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        }else{

            if(memberPw.value == memberPwConfirm.value){
                pwMessage.innerText = "일치한 비밀번호 입니다."
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.memberPwConfirm = true;
            }else{
                pwMessage.innerText = "일치하지 않는 비밀번호 입니다."
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.memberPwConfirm = false;
            }
        }
    }else{
        pwMessage.innerText = "유효하지 않은 비밀번호 방식입니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.memberPw = false;
    }

})

































function toggleAllAgree(){
    var chkAll = document.getElementById("chkAll");
    var checkboxes = document.querySelectorAll('input[name="chk"]')

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = chkAll.checked;
    }
}

function checkIndividualAgreements() {
    var chkALl = document.getElementById("chkAll");
    var checkboxes = document.querySelectorAll('input[name="chk"]')
    var allChecked = true;

    for (var i = 0; i < checkboxes.length; i++) {
        if(!checkboxes[i].checked) {
            allChecked = false;
            break;
        }
    }
    chkAll.checked = allChecked;
}