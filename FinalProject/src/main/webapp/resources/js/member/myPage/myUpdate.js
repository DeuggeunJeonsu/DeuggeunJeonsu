
// 회원 정보
const memberNickname = document.getElementById("memberNickname");
const updateInfo = document.getElementById("myPage-submit");


if(updateInfo != null){
    initNickname = memberNickname.value;
    initTel = memberTel.value;
    

    memberNickname.addEventListener("input", () => {

        if(initNickname == memberNickname.value){
            memberNickname.removeAttribute("style");

            return;
        }
        const regEx = /^[가-힣0-9\w\s]*[가-힣][가-힣0-9\w\s]{2,10}$/;

        if(regEx.test(memberNickname.value)){
            memberNickname.style.color = "#99E1ED";

        }else{
            memberNickname.style.color = "#ee4949";
        }
    });

    memberTel.addEventListener("input", () => {

        if(initTel == memberTel.value){
            memberTel.removeAttribute("style");

            return;
        }

        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

        if(regEx.test(memberTel.value)){

            memberTel.style.color = "#99E1ED";
        } else{
            memberTel.style.color = "#ee4949";
        }

    });

    

    updateInfo.addEventListener("submit" , e=>{

        if(memberNickname.style.color == "#ee4949"){

            alert("닉네임 형식이 유효하지 않습니다.");

            memberNickname.focus();

            e.preventDefault();

            return;
        }

        if(memberTel.style.color == "#ee4949"){

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
        

    })

}



    
    



