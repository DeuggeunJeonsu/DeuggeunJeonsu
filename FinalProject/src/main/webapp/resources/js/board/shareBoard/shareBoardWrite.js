//운동타입 SelectBox
const btn = document.querySelector('.btn-select');

const list = document.querySelector('.list-member');
btn.addEventListener('click', () => {
    btn.classList.toggle('on');
});
list.addEventListener('click', (event) => {
    if (event.target.nodeName === "BUTTON") {
        btn.innerText = event.target.innerText;
        btn.classList.remove('on');
    }
});


//-------------------------------------------------------

// 루틴 추가 버튼 클릭시 
const routineBtn = document.querySelector("#routineBtn");

routineBtn.addEventListener("click", function () {

    if(document.querySelectorAll(".routine").length > 5){
        alert("Routine은 5개까지 작성 가능합니다.🥲");
    }else{

        const routineAdd = document.querySelector(".routine-add"); 
    
        // routine 설명 영역(할머니)
        const div1 = document.createElement("div");
        // div1.setAttribute("class","routine"); 
        div1.classList.add("routine")
    
        // 사진 영역(큰 이모)
        const div2 = document.createElement("div");
        // div2.setAttribute("class", "boardImg");
        div2.classList.add("boardImg")
        
        // 사진 영역에 들어갈 부분
        const lable = document.createElement("label");
        const inputId = "img" + Date.now(); // 현재 시간을 이용한 난수 생성
        lable.setAttribute("for",inputId);
    
        // lable 안에 담을 사진 영역
        const img = document.createElement("img");
        // img.setAttribute("class","preview");
        img.classList.add("preview")
        img.setAttribute("src","");
    
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
        input2.setAttribute("type","test");
        input2.setAttribute("placeholder","운동명을 입력해주세요");
       
        const textarea = document.createElement("textarea");
        textarea.innerHTML="1.<br> 2.<br> 3.<br><br>꿀팁! ";
    
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
        div1.append(div2, div3, div4 );
        
        routineAdd.append(div1);

        //---------------------------------
        // 루틴 추가 버튼
        if(document.querySelectorAll(".routine").length == 4 && document.querySelectorAll(".routine").length > 5){

            // 루틴 추가 버튼
            // 부모 요소 선택
            const routineAddBtnArea = document.querySelector(".routine-add-btn-area");
    
            // 버튼 요소 생성
            const buttonElement = document.createElement("button");
            buttonElement.setAttribute("id", "routineBtn");
            buttonElement.setAttribute("type", "button");
    
            // 버튼 내용 설정
            buttonElement.textContent = "Routine";
    
            // Font Awesome 아이콘 요소 생성
            const iconElement = document.createElement("i");
            iconElement.setAttribute("class", "fa-solid fa-circle-plus");
    
            // 버튼에 아이콘 요소 추가
            buttonElement.appendChild(iconElement);
    
            // 버튼을 부모 요소에 추가
            routineAddBtnArea.appendChild(buttonElement);
            document.querySelector(".middle-write").append(routineAddBtnArea)
        }

        if(document.querySelectorAll(".routine").length == 5){
            document.querySelector(".routine-add-btn-area").remove();
        }

        
    }
    
})


const cancleBtns = document.getElementsByClassName("cancle");
// 삭제 버튼 눌렀을 때 해당 루틴 삭제하기 
function cancleRoutine(){
    
    for (const button of cancleBtns) {
        // console.log(cancleBtns.length)
        button.addEventListener("click", (e) => {
       
            e.target.parentElement.parentElement.remove();
            // // cancle이 4개일 경우 루틴 추가 버튼 띄우기
            // if(document.querySelectorAll(".routine").length == 4 && document.querySelectorAll(".routine").length > 5){

            //     // 루틴 추가 버튼
            //     // 부모 요소 선택
            //     const routineAddBtnArea = document.querySelector(".routine-add-btn-area");
        
            //     // 버튼 요소 생성
            //     const buttonElement = document.createElement("button");
            //     buttonElement.setAttribute("id", "routineBtn");
            //     buttonElement.setAttribute("type", "button");
        
            //     // 버튼 내용 설정
            //     buttonElement.textContent = "Routine";
        
            //     // Font Awesome 아이콘 요소 생성
            //     const iconElement = document.createElement("i");
            //     iconElement.setAttribute("class", "fa-solid fa-circle-plus");
        
            //     // 버튼에 아이콘 요소 추가
            //     buttonElement.appendChild(iconElement);
        
            //     // 버튼을 부모 요소에 추가
            //     routineAddBtnArea.appendChild(buttonElement);
            //     document.querySelector(".middle-write").append(routineAddBtnArea)
            // }
        });
    }   
}








//-------------------------------------------------------
// 사진 미리보기 관련 요소 모두 얻어오기

// img 5개 
const preview = document.getElementsByClassName("preview");
// file 5개
const input = document.getElementsByClassName("inputImage");
// X버튼 5개 
const deleteImage = document.getElementsByClassName("delete-image");



