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

    if(document.querySelectorAll(".routine").length >= 5){
        alert("Routine은 5개까지 작성 가능합니다.🥲");
    }else{

        const routineAdd = document.querySelector(".routine-add"); 
    
        // routine 설명 영역(할머니)
        const div1 = document.createElement("div");
        // div1.setAttribute("class","routine"); 
        div1.classList.add("routine")
        div1.setAttribute("draggable", "true")
    
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

    }
    
})
// ------------------------------------------------
// 루틴 삭제 버튼

// 취소 버튼 이벤트 핸들러를 등록합니다.
document.addEventListener("click", function (e) {
    if (e.target.classList.contains("cancle")) {
        cancleRoutine(e);
    }
});

// 취소 버튼 눌렀을 때 해당 루틴 삭제하기
function cancleRoutine(e) {
    e.target.parentElement.parentElement.remove();
}

//-------------------------------------------------

// 루틴 드래그로 위치 바꾸기
const routineArea =$('.routine-area');
(()=>{
    // const $ = (select) => document.querySelectorAll("select");
    const routines = document.querySelectorAll('.routine');

    for (const el of routines) {
        // 드래그가 시작되었을 때 dragging 클래스 추가
        el.addEventListener('dragstart', () => {
            el.classList.add('dragging');
        });
    
        // 드래그가 끝났을 때 dragging 클래스 제거
        el.addEventListener('dragend', () => {
            el.classList.remove('dragging');
        });
        el.addEventListener('dragover', e => {
            e.preventDefault()
            const afterElement = getDragAfterElement(el, e.clientY);
            const draggable = document.querySelector('.dragging')
            // container.appendChild(draggable)
            el.insertBefore(draggable, afterElement)
        })
    };

    function getDragAfterElement( routineArea, y) {
        
        const draggableElements = [...routineArea.querySelectorAll('.routine:not(.dragging)')]
       
        return draggableElements.reduce((closest, child) => {
        const box = child.getBoundingClientRect() //해당 엘리먼트에 top값, height값 담겨져 있는 메소드를 호출해 box변수에 할당
        const offset = y - box.top - box.height / 2 //수직 좌표 - top값 - height값 / 2의 연산을 통해서 offset변수에 할당
            if (offset < 0 && offset > closest.offset) { // (예외 처리) 0 이하 와, 음의 무한대 사이에 조건
                return { offset: offset, element: child } // Element를 리턴
            } else {
                return closest
            }
        }, { offset: Number.NEGATIVE_INFINITY }).element 
        
        
    };

    
            
})();
    
    
    
    
    




//-------------------------------------------------------
// 사진 미리보기 관련 요소 모두 얻어오기

// img 5개 
const preview = document.getElementsByClassName("preview");
// file 5개
const input = document.getElementsByClassName("inputImage");
// X버튼 5개 
const deleteImage = document.getElementsByClassName("delete-image");




