//운동타입 SelectBox

const btn = document.querySelector('.btn-select');
const list = document.querySelector('.list-member');
const routineType = document.querySelector('.routineType');

// 버튼에 포커스 이벤트 리스너를 추가합니다.
btn.addEventListener('focus', () => {
    btn.classList.add('on');
});

list.addEventListener('click', (event) => {
    if (event.target.nodeName === "BUTTON") {
        btn.innerText = event.target.innerText;
        routineType.value = event.target.innerText;
        btn.classList.remove('on');
    }
});

//-------------------------------------------------------

// 루틴 추가 버튼 클릭시 
const routineBtn = document.querySelector("#routineBtn");

routineBtn.addEventListener("click", function () {

    if(document.querySelectorAll(".routine").length >= 5){
        alert("Routine은 5개까지 작성 가능합니다.🥲");
    }else{

        const routineAdd = document.querySelector(".routine-add"); 
    
        // routine 설명 영역(할머니)
        const li = document.createElement("li");
        // div1.setAttribute("class","routine"); 
        li.classList.add("routine")
        li.setAttribute("draggable", "true")
    
        // 사진 영역(큰 이모)
        const div2 = document.createElement("div");
        // div2.setAttribute("class", "boardImg");
        div2.classList.add("boardImg")
        
        let inputId;
        do {
            inputId = "img" + getRandomInt(1, 5); // 1부터 5까지 랜덤한 숫자 생성
        } while (document.getElementById(inputId));

        // 사진 영역에 들어갈 부분
        const lable = document.createElement("label");
        lable.setAttribute("for",inputId);
    
        // lable 안에 담을 사진 영역
        const img = document.createElement("img");
        // img.setAttribute("class","preview");
        img.classList.add("preview")
        img.setAttribute("src","/resources/images/boardDetaile/noneImage.png");
    
        // 파일 입력 부분
        const input = document.createElement("input");
        input.setAttribute("type","file");
        input.setAttribute("name","images");
        // input.setAttribute("class","inputImage");
        input.classList.add("inputImage")
    
        input.setAttribute("id", inputId);
        input.setAttribute("accept","image/*");
    
        // 사진 삭제 부분
        const span = document.createElement("span");
        // span.setAttribute("class", "delete-image");
        span.classList.add("delete-image")
        span.innerHTML="&times;"
        
        // 사진 영역 합체 
        lable.append(img);
        div2.append(lable, input, span);
    
       
        // 루틴 글 작성 영역(작은 이모)
        const div3 = document.createElement("div");
        // div3.setAttribute("class","routine-write-area");
        div3.classList.add("routine-write-area")
        // 루틴 글 안 영역
        const input2 = document.createElement("input");
        input2.setAttribute("type","text");
        input2.setAttribute("placeholder","예) 스쿼트 20회 30세트");
        input2.setAttribute("name","routineName")
       
        const textarea = document.createElement("textarea");
        textarea.value= "1.\n2.\n3.\n\n꿀팁!"
        textarea.setAttribute("name","routineContent");
        
        //루틴 글 작성 (작은 이모) 합체
        div3.append(input2, textarea); 
    
        // routine 취소 버튼 영역(막내 이모)
        const div4 = document.createElement("div");
        // div4.setAttribute("class","routine-cancle");
        div4.classList.add("routine-cancle")
    
        //routine 취소 버튼 영역 안에 넣을 영역
        const button = document.createElement("button");
        button.setAttribute("type","button");
        button.classList.add("cancle");
        button.setAttribute("onclick","cancleRoutine()")
        button.innerHTML="&times;";
        div4.append(button);
    
        // 할머니에 합체 
        li.append(div2, div3, div4 );
        
        routineAdd.append(li);

        if (document.querySelectorAll(".routine").length >= 2) {
            const ballon = document.querySelector(".ballon");
            ballon.style.display = "block"; 
        }
    }
    
})



// 최소값(min)부터 최대값(max)까지의 랜덤한 정수를 생성하는 함수
function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
// ------------------------------------------------
// 루틴 삭제 버튼


// 취소 버튼 이벤트 핸들러를 등록합니다.
document.addEventListener("click", function (e) {
    if (e.target.classList.contains("cancle")) {
        if(document.querySelectorAll(".routine").length >= 2){
            cancleRoutine(e);
        }else{
            alert("1개 이상의 루틴을 입력해주세요👌");
        }
    }
});
    
// 취소 버튼 눌렀을 때 해당 루틴 삭제하기
function cancleRoutine(e) {
    e.target.parentElement.parentElement.remove();
}



//-------------------------------------------------

// 루틴 드래그로 위치 바꾸기

const routineArea =document.querySelector(".routine-add")

let currentRoutineIndex = null;
let currentRoutine = null;
// 루틴이 두개 이상일 때
// if(document.querySelectorAll(".routine").length  >1){

    routineArea.addEventListener('dragstart', (e) => {
        currentRoutine = e.target;
        const listArr = [...currentRoutine.parentElement.children];
        currentRoutineIndex = listArr.indexOf(currentRoutine);
    });
    
    routineArea.addEventListener('dragover',(e)=>{
       
        e.preventDefault();
    });
    
    routineArea.addEventListener('drop',(e)=>{
        e.preventDefault();
    
        const currentDropRoutine = e.target;
        const listArr =[...currentRoutine.parentElement.children];
        const dropRoutineIndex =  listArr.indexOf(currentDropRoutine);
        
        if(currentRoutineIndex< dropRoutineIndex){
            currentDropRoutine.after(currentRoutine);
        }else{
            currentDropRoutine.before(currentRoutine);
        }
    });
// }

//-------------------------------------------------------

// form 태그 유효성 검사
document.getElementById("boardWriteFrm").addEventListener("submit", e => {
    e.preventDefault();
    // 각 input과 textArea 대한 유효성 검사 
    
    // 정규식 : 특수문자를 포함하지 않는 정규식
    const reqExp1 = /^[a-zA-Z0-9가-힣\#]*$/;

    // 제목을 입력하지 않았을 경우
    const title = document.querySelector('[name="boardTitle"]');
    if(title.value.trim().length == 0){
        alert("제목을 입력해주세요❗");
        title.value="";
        title.focus();
        e.preventDefault();
        return;
    }

    //selectbox 선택이 되어 있지 않은 경우 
    const selectBox = document.querySelector(".btn-select");
    if(selectBox.innerHTML == '운동타입'){
        alert("운동타입을 선택해주세요❗");
        selectBox.focus();
        e.preventDefault();
        return;
    }

    // 루틴 설명이 공백인 경우 
    const content = document.querySelector('[name="boardContent"]');
    if(content.value.trim().length == 0){
        alert("루틴 설명을 입력해주세요😊");
        content.value="";
        content.focus();
        e.preventDefault();
        return;
    }

    // 루틴들 유효성 검사
    
    // 해당 루틴에 대한 제목 유효성 
    // 자동완성 되게 만들기 ⭐
    const reqExp2 = /^[가-힣a-zA-Z\s]{1,10} \d{1,2}회 \d{1,2}세트$/;

    const routineName = document.getElementsByName("routineName");
    for (let i = 0; i < routineName.length; i++) {
        if (routineName[i].value.trim().length == 0 //|| !reqExp2.test(routineName[i].value
        ) {
            alert("세부 운동을 입력해 주세요😊");
            routineName[i].focus();
            e.preventDefault();
            return;
        } 
    }


    const routineContent = document.querySelectorAll('textarea[name="routineContent"]');
    const reqExp3 = /^1\.\s2\.\s3\.\s\n\n꿀팁!$/;

    for (let i = 0; i < routineContent.length; i++) {
        const textareaValue = routineContent[i].value; // textarea의 내용을 가져옴
        if (textareaValue.trim().length == 0 || reqExp3.test(textareaValue)
        ) {
            alert("세부 운동 내용을 입력해주세요😊");
            routineContent[i].focus();
            routineContent[i].value = "1.\n2.\n3.\n\n꿀팁!";
            e.preventDefault();
            return;
        }
    }



    // 이미지 파일이 비어 있을 경우 
    const inputImage = document.getElementsByClassName("inputImage");
    for(let i = 0; i < inputImage.length; i++ ){
        if(inputImage[i].value==""){
            alert("이미지 첨부는 필수입니다.😊")
            inputImage[i].focus();
            e.preventDefault();
            return;
        }
    }

    document.getElementById("boardWriteFrm").submit();

});




//-------------------------------------------------------
// 사진 미리보기 관련 요소 모두 얻어오기
document.addEventListener("click", function (event) {
    if(event.target.classList.contains("inputImage")){

        // img 6개 
        const preview = document.getElementsByClassName("preview");
        // file 6개
        const inputImage = document.getElementsByClassName("inputImage");
        // X버튼 6개 
        const deleteImage = document.getElementsByClassName("delete-image");
        
        for( let i=0; i<inputImage.length; i++){
            
            inputImage[i].addEventListener("change", e=>{
                
                const file = e.target.files[0];     
                
                if(file != undefined){
        
                    const reader = new FileReader();
        
                    reader.readAsDataURL(file);
        
                    reader.onload = e => {
                        preview[i].setAttribute("src", e.target.result);
                    }
        
                }else{
                    preview[i].removeAttribute("src");
                }
        
            });
        
            // 미리보기 삭제버튼(x버튼)
            deleteImage[i].addEventListener("click", ()=>{
                
                if(preview[i].getAttribute("src")!= ""){
        
                    preview[i].setAttribute("src","/resources/images/boardDetaile/noneImage.png");
                    inputImage[i].value="";
                }
            })
        
        }
    }
})

/* 캘린더 말풍선 */
// $(window).scroll(function() {
//     $('#animatedElement').each(function(){
//     var imagePos = $(this).offset().top;

//     var topOfWindow = $(window).scrollTop();
//         if (imagePos < topOfWindow+400) {
//             $(this).addClass("slideUp");
//         }
//     });
// });
if (document.querySelectorAll(".routine").length >= 2) {
    const balloon = document.querySelector(".balloon");
    balloon.style.display = "block"; 
}
