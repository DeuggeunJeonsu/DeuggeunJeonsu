const checkObj = {
    "memberEmail" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "authKey" : false
}


const memberTels = document.getElementsByName("memberTel");    
let memberTel ="";                                            
const sendSmsBtn = document.getElementById("sendSmsBtn");    
const smsTimerSpan = document.getElementById("smsTimer"); 
const idAtKey = document.getElementById("idAuthenticationKey");
let smsTimer;                                                
let smsIsRunning = false;   


sendSmsBtn.addEventListener("click", e=>{
    memberTel ="";
    for( let i of memberTels){
        if(i.value.trim().length==0){
            alert("휴대폰번호를 입력해주세요");
            return;
        }
        memberTel += i.value;
    }

    const phoneNumberRegex = /^(?:\+?\d{1,3}(?:[-.\s]?\d{1,})?|\d{1,4})?[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/;


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




const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

memberEmail.addEventListener("input",()=>{

    if(memberEmail.value.trim().length==0){
        memberEmail.value="";
        emailMessage.innerText="메일을 받을 수 있는 이메일을 입력해주세요.";

        emailMessage.classList.remove("confirm", "error");

        checkObj.memberEmail = false;
        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(memberEmail.value)){

        fetch("/checkEmail/email?email=" + memberEmail.value)
        
        .then( response => response.text() ) 
        
        .then( count => {
            
            if(count == 0){

                emailMessage.innerText="사용 가능한 이메일 입니다";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");
                checkObj.memberEmail = true;

            } else{

                emailMessage.innerText="이미 사용중인 이메일 입니다";
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

const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

memberPw.addEventListener("input", ()=>{

    if(memberPw.value.trim().length==0){
        memberPw.value="";

        pwMessage.innerText= "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.";
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
        alert("비밀번호를 다시 입력해주세요.");
        memberPwConfirm.value="";
        memberPw.focus();
    }
})

const memberNickname = document.getElementById("memberNickname");

const nickMessage = document.getElementById("nickMessage");

memberNickname.addEventListener("input", () => {


    if (memberNickname.value.trim().length == 0) {


        nickMessage.innerText = "한글,영어,숫자로만 2~10글자 사이로 입력해주세요.";

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

                    nickMessage.innerText = "사용 가능한 닉네임 입니다.";
                    nickMessage.classList.add("confirm");
                    nickMessage.classList.remove("error");

                    checkObj.memberNickname = true; 

                }else{

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


        fetch("/sendEmail/signUp?email="+memberEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.")
                tempEmail = memberEmail.value;
            }else{
                console.log("인증번호 발송 실패")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });
       


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


    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        memberEmail.focus();
    }


});




const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");


checkAuthKeyBtn.addEventListener("click", function(){


    if(authMin > 0 || authSec > 0){ 
        const obj = {"inputKey":authKey.value, "email":tempEmail}
        const query = new URLSearchParams(obj).toString()
        
        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer);
                authKeyMessage.innerText = "인증되었습니다.";
                authKeyMessage.classList.add("confirm");
                checkObj.authKey = true;


            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));




    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }


});

/* 주소 */
const sample6_postcode = document.getElementById("sample6_postcode");
const sample6_address = document.getElementById("sample6_address");




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
        alert("모든 약관에 동의해야 가입할 수 있습니다.");
        e.preventDefault();
    }

    if (
        sample6_postcode.value.trim() === "" ||
        sample6_address.value.trim() === "" 
    ) {
        alert("주소를 모두 입력해주세요.");
        e.preventDefault(); 
    }

    for(let key in checkObj){
        if(!checkObj[key]){

            switch(key){
                case "memberEmail" : alert("이메일이 유효하지 않습니다.");  break;
                case "memberPw" : alert("비밀번호가 일치하지 않습니다."); break;
                case "memberPwConfirm" : alert("비밀번호가 확인되지 않았습니다."); break;
                case "memberNickname" : alert("닉네임이 유효하지 않습니다.");  break;
                case "memberTel" : alert("전화번호가 유효하지 않습니다.");  break;
                case "memberAddress" : alert("주소가 유효하지 않습니다."); break;
            }
            
            document.getElementById(key).focus();

            e.preventDefault();
            return; 
        }
    }
})





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

