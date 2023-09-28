
// 회원 정보
const memberNickname = document.getElementById("memberNickname");
const updateInfo = document.getElementById("updateInfo");
const nickMessage = document.getElementById("nickMessage");

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



    
    



