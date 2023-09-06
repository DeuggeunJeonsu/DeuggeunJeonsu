// *********************메인페이지*******************************

// 메인페이지 동영상 컨트롤바 제거
$(document).ready(function(){
    if( document.querySelector('.home video') != null){

        // JavaScript 방법으로 컨트롤 숨기기
        const videoElement = document.querySelector('.home video');
        videoElement.controls = false;
    }
});

if(document.querySelector("#middle-Container")){
// 달력 생성
window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {
    
    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

    let tbody_Calendar = document.querySelector(".Calendar > tbody");
    const tbody = document.querySelectorAll("tbody > tr");
    
    document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
        
    }

    
    // 2주치 선택 가능하게 만들기
    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {
        let nowColumn = nowRow.insertCell();
        let newDIV = document.createElement("p");
        let newDIV2 = document.createElement("i");
        newDIV.innerHTML = leftPad(nowDay.getDate());
        nowColumn.append(newDIV, newDIV2);

        if (nowDay < today) {
            newDIV.className = "pastDay";
            newDIV.onclick = function () { choiceDate(this); }
        } else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {
            newDIV.className = "today";
            newDIV.classList.add("choiceDay");
            newDIV.onclick = function () { choiceDate(this); }
        } else {
            newDIV.className = "futureDay";

            // 날짜가 오늘부터 14일 이내인지 확인합니다.
            let fourteenDaysFromNow = new Date();
            fourteenDaysFromNow.setDate(today.getDate() + 14);

            if (nowDay >= today && nowDay <= fourteenDaysFromNow) {
                newDIV.onclick = function () { choiceDate(this); }
                newDIV.classList.remove("futureDay");
                newDIV.classList.add("possible-futureDay");
            }
        }

        if (nowDay.getDay() == 6) {
            nowRow = tbody_Calendar.insertRow();
        }

        // ajax,, 여기서 만들어야해
        // i 태그에db에서 가져와서 넣어보기 
        // 동그라미 또는 세모







    }
    // 마지막 tr이 비어 있을 경우 삭제
    if (nowRow.cells.length === 0) {
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }
}

// 날짜 선택
function choiceDate(newDIV) {
    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
    }
    newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
}

// 이전달 버튼 클릭
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    buildCalendar();    // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    buildCalendar();    // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}

}

// *****************************************************
// TodoList만들기!
let checkedCount = 0;
const checkboxes = document.querySelectorAll(".checkbox");
const progressNum = document.querySelector(".progress-num")
let totalCheckboxes = checkboxes.length;
let checkedPercentage =0;
$(document).ready(function(){

    
    checkboxes.forEach((checkbox) => {

        if(checkbox.checked){
            checkbox++;
        }

        const totalCheckboxes = checkboxes.length;
        checkedPercentage = (checkedCount / totalCheckboxes) * 100;
        // const progressNum = document.querySelector(".progress-num")
         if (checkedCount === 0) {
                progressNum.style.width = "0%";
            } else {
                progressNum.style.width = `${checkedPercentage}%`;
            }


    });

});

const addListBtn = document.querySelector(".addListBtn") 
addListBtn.addEventListener("click", function(){
    const addListInput = document.querySelector(".addList");
    const addListVal = addListInput.value.trim();  // 입력 값의 양 끝 공백을 제거합니다.

    const reqExp = /^[가-힣a-zA-Z\s]{1,10} \d{1,2}회 \d{1,2}세트$/;

    if (!reqExp.test(addListVal)) {
        if (confirm("운동 횟수와 세트 횟수를 입력해주세요")) {
            addListInput.focus();
            addListInput.value = "  회  세트";
        }
    } else {
        alert("정규식 성공! DB에 insert한 후 다시 목록조회 하자!");
        document.querySelector(".addList").value="";

        // 새로운 div 요소 생성
        const div = document.createElement("div");
        const checkboxes = document.querySelectorAll(".ck").length + 1; // 현재 체크박스 개수 + 1

        // input 요소 생성 및 속성 설정
        const input = document.createElement("input");
        input.setAttribute("type", "checkbox");
        input.setAttribute("id", "ck" + checkboxes);
        input.setAttribute("class", "none checkbox");

        // label 요소 생성 및 연결
        const label = document.createElement("label");
        label.setAttribute("for", "ck" + checkboxes);
        label.setAttribute("class", "ck");

        // span 요소 생성 및 텍스트 설정
        const span = document.createElement("span");
        span.textContent = addListVal;

        // button 요소 생성
        const button = document.createElement("button");
        button.setAttribute("type", "button");
        
        
        // i 요소 생성 및 클래스 및 스타일 설정
        const i = document.createElement("i");
        i.setAttribute("class", "fa-solid fa-minus minus");
        i.style.color = "#ffffff";

        // 각 요소를 div에 추가
        div.appendChild(input);
        div.appendChild(label);
        div.appendChild(span);
        div.appendChild(button);
        button.appendChild(i);

        // div를 원하는 위치에 추가
        document.querySelector(".check-area").append(div);
    }
})




if (document.querySelector(".todolist-area") != null) {
    const checkboxes = document.querySelectorAll(".checkbox");
    // const addListBtn = document.querySelector(".addListBtn") 

    checkboxes.forEach((checkbox) => {

            const minus = checkbox.nextElementSibling.nextElementSibling.nextElementSibling;
            minus.addEventListener("click", function () {
                checkboxes.length=0;
                checkbox.parentElement.remove();
                const totalCheckboxes= document.querySelectorAll(".ck").length; 
    
                if (checkbox.checked) {
                    
                    checkedCount--;
                }
    
                
                const checkedPercentage = (checkedCount / totalCheckboxes) * 100;
    
                if (checkedCount === 0) {
                    progressNum.style.width = "0%";
                } else {
                    progressNum.style.width = `${checkedPercentage}%`;
                }
            });




        
        checkbox.addEventListener("change", function () {
            if (this.checked) {
                const spanElement = this.nextElementSibling.nextElementSibling;
                spanElement.classList.add("complete");
                checkedCount++;
            } else {
                const spanElement = this.nextElementSibling.nextElementSibling;
                spanElement.classList.remove("complete");
                checkedCount--;
            }

            const totalCheckboxes= document.querySelectorAll(".ck").length; 
            checkedPercentage = (checkedCount / totalCheckboxes) * 100;
            // const progressNum = document.querySelector(".progress-num")
            if (checkedCount === 0) {
                progressNum.style.width = "0%";
            } else {
            }
            progressNum.style.width = `${checkedPercentage}%`;
        });

    
    });


    // addListBtn.addEventListener("click", function(){
    //     const addListInput = document.querySelector(".addList");
    //     const addListVal = addListInput.value.trim();  // 입력 값의 양 끝 공백을 제거합니다.
    
    //     const reqExp = /^[가-힣a-zA-Z\s]{1,10} \d{1,2}회 \d{1,2}세트$/;
    
    //     if (!reqExp.test(addListVal)) {
    //         if (confirm("운동 횟수와 세트 횟수를 입력해주세요")) {
    //             addListInput.focus();
    //             addListInput.value = "  회  세트";
    //         }
    //     } else {
    //         alert("정규식 성공! DB에 insert한 후 다시 목록조회 하자!");
    //         document.querySelector(".addList").value="";

    //         // 새로운 div 요소 생성
    //         const div = document.createElement("div");
    //         const checkboxes = document.querySelectorAll(".ck").length + 1; // 현재 체크박스 개수 + 1
    
    //         // input 요소 생성 및 속성 설정
    //         const input = document.createElement("input");
    //         input.setAttribute("type", "checkbox");
    //         input.setAttribute("id", "ck" + checkboxes);
    //         input.setAttribute("class", "none checkbox");
    
    //         // label 요소 생성 및 연결
    //         const label = document.createElement("label");
    //         label.setAttribute("for", "ck" + checkboxes);
    //         label.setAttribute("class", "ck");
    
    //         // span 요소 생성 및 텍스트 설정
    //         const span = document.createElement("span");
    //         span.textContent = addListVal;
    
    //         // button 요소 생성
    //         const button = document.createElement("button");
    //         button.setAttribute("type", "button");
            
            
    //         // i 요소 생성 및 클래스 및 스타일 설정
    //         const i = document.createElement("i");
    //         i.setAttribute("class", "fa-solid fa-minus minus");
    //         i.style.color = "#ffffff";
    
    //         // 각 요소를 div에 추가
    //         div.appendChild(input);
    //         div.appendChild(label);
    //         div.appendChild(span);
    //         div.appendChild(button);
    //         button.appendChild(i);
    
    //         // div를 원하는 위치에 추가
    //         document.querySelector(".check-area").append(div);
    //     }
    // })



}


