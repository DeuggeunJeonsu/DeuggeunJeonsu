const profileImage = document.getElementById("profileImage");
const deleteImage = document.getElementById("deleteImage");
const imageInput = document.getElementById("imageInput")

let initCheck;

let deleteCheck = -1;

let originalImage;

if(imageInput != null){

    originalImage = profileImage.getAttribute("src");

    if(originalImage == "../../../../resources/images/user.png"){
        initCheck = false;

    } else {
        initCheck = true;
    }

    imageInput.addEventListener("change", e =>{

        const maxSize = 1 * 1024 * 1024 * 2;

        console.log(e.target);
        console.log(e.target.value);
        console.log(e.target.files);

        const file = e.target.files[0];

        if(file == undefined){
            console.log("파일 선택이 취소됨");
            deleteCheck = -1;

            profileImage.setAttribute("src",originalImage);

            return;

        }

        if(file.size > maxSize){
            alert("2MB 이하의 이미지를 선택해주세요.");

            imageInput.value = "";

            deleteCheck = -1;

            profileImage.setAttribute("src",originalImage);

            return;
        }

        const reader = new FileReader();

        reader.readAsDataURL(file);

        reader.onload = e => {

            const url = e.currentTarget.result;

            profileImage.setAttribute("src", url);

            deleteCheck = 1;
        }
    });

    deleteImage.addEventListener("click", e => {

        profileImage.setAttribute("src","../../../../resources/images/user.png");

        imageInput.value = "";

        deleteCheck = 0;
    });

    document.getElementById("profileFrm").addEventListener("submit", e => {
        let flag = true;

        if(!initCheck && deleteCheck == 1){
            flag = false;
        }

        if(initCheck && deleteCheck == 0){
            flag = false;
        }

        if(initCheck && deleteCheck == 1){
            flag = false;
        }

        if(flag){
            e.preventDefault();
            alert("이미지 변경 후 클릭하세요.");
        }

    });
}


// 회원 정보

const memberNickname = document.getElementById("memberNickname");
const memberEmail = document.getElementById("memberEmail");

if(updateInfo != null){
    initNickname = memberNickname.value;
    initTel = memberTel.value;
    initEmail = memberEmail.value;

    memberNickname.addEventListener("input", () => {

        if(initNickname == memberNickname.value){
            memberNickname.removeAttribute("style");

            return;
        }

        const regEx = /^[가-힣0-9\w]{2,10}$/;

        if(regEx.test(memberNickname.value)){
            memberNickname.style.color = "green";

        }else{
            memberNickname.style.color = "red";
        }
    });

    memberTel.addEventListener("input", () => {

        if(initTel == memberTel.value){
            memberTel.removeAttribute("style");

            return;
        }

        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

        if(regEx.test(memberTel.value)){

            memberTel.style.color = "green";
        } else{
            memberTel.style.color = "red";
        }

    });

    memberEmail.addEventListener("input", () => {

        if(initEmail == memberEmail.value){
            memberEmail.removeAttribute("style");

            return;
        }

        const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

        if(regEx.test(memberEmail.value)){
            memberEmail.style.color = "green";

        } else{
            memberEmail.style.color = "red";
        }
    });


    updateInfo.addEventListener("submit" , e=>{

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

        if(memberEmail.style.color == "red"){

            alert("이메일 형식이 유효하지 않습니다.");

            memberEmail.focus();

            e.preventDefault();

            return;

        }

    })

}

const chagePwFrm = document.getElementById("changepwFrm");

const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");



if (changePwFrm != null) {

    changePwFrm.addEventListener("submit", e =>{

        
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
})
    
    
}



