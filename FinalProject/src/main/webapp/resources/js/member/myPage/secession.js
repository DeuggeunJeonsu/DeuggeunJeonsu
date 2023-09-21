const secessionFrm = document.getElementById("secessionFrm");
const memberPw = document.getElementById("memberPw");
const agree = document.getElementById("agree");


if(secessionFrm != null){
    secessionFrm.addEventListener("submit", e=>{

        if(memberPw.value.trim().length == 0){

            alert("비밀번호를 작성해주시길 바랍니다.");

            memberPw.focus();
            memberPw.value = "";

            e.preventDefault();
            
            return;
        }

        if(agree.checked == false){

            alert("약관에 동의 후 탈퇴 버튼을 눌러주세요.");

            e.preventDefault();

            return;
        }

        if(!confirm("정말 탈퇴하시겠습니까?")){
            e.preventDefault();
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