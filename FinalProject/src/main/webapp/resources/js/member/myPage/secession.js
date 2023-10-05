const secessionFrm = document.getElementById("secessionFrm");
const memberPw = document.getElementById("memberPw");
const agree = document.getElementById("agree");

if(secessionFrm != null){

    secessionFrm.addEventListener("submit", e=>{

        if(memberPw.value.trim().length == 0){

            Swal.fire({
                icon: 'error',                     
                title: '비밀번호를 작성해 주세요.',    
            });

            memberPw.focus();
            memberPw.value = "";

            e.preventDefault();
            
            return;
        }

        if(agree.checked == false){

            Swal.fire({
                icon: 'error',                     
                title: '약관 동의 후 탈퇴 버튼을 눌러 주세요.',    
            });

            e.preventDefault();

            return;
        }

        if(!confirm("정말 탈퇴하시겠습니까? 😥")){
            e.preventDefault();
        }
    })
}