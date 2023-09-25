const checkObj = {
    "memberNickname" : false
}


const changePwFrm = document.getElementById("changePwFrm");

const newPw = document.getElementById("newPw"); // 새 비밀번호
const newPwConfirm = document.getElementById("newPwConfirm");



if(changePwFrm != null){

    changePwFrm.addEventListener("submit", e=>{

        
        if(newPw.value != newPwConfirm.value){
            
            alert("두 비밀번호가 일치하지 않습니다.");
            
            newPwConfirm.focus();
            
            e.preventDefault();
            
            return;
        }
    });
}


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




