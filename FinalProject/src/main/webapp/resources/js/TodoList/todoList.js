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

// if (document.querySelector(".todolist-area") != null) {
//     let checkedConut= 0;
    
//     // checkbox 
//     const checkboxes = document.querySelectorAll(".checkbox");
//     // checkbox 클릭시 취소선 
//     checkboxes.forEach((checkbox) => {
//         checkbox.addEventListener("change", function () {
//             if (this.checked) {
//                 const spanElement = this.nextElementSibling.nextElementSibling;
//                 spanElement.classList.add("complete");
            
//             } else {
//                 const spanElement = this.nextElementSibling.nextElementSibling;
//                 spanElement.classList.remove("complete");
//             }

//         });

//         if(checkbox.checked){
//             checkedConut++;
//         }

//         // 체크된 체크박스의 비율을 계산합니다.
//         const totalCheckboxes = checkboxes.length;
//         const checkedPercentage = (checkedConut / totalCheckboxes) * 100;
        
//         // 계산된 비율을 progress-num 요소의 너비로 설정합니다.
//         const progressNum = document.querySelector(".progress-num");
//         progressNum.style.width = `${checkedPercentage}%`;
    
//     });

//     console.log("checkedConut"+checkedConut)

//     //minus 버튼 눌렀을 시 List 삭제
//     const minusAll = document.querySelectorAll(".minus");
//     minusAll.forEach((minus) => {
//         minus.addEventListener("click", function(){
//             minus.parentElement.parentElement.remove();
//         })
//     })
// }

// const checkboxes = null;
// let checkedCount=0;
// const progressNum=null;
// const checkedPercentage=null;


if (document.querySelector(".todolist-area") != null) {
    
    checkboxes.forEach((checkbox) => {


    $(document).ready(function(){
        const checkboxes = document.querySelectorAll(".checkbox");
        let checkedConut=0; 
        if(checkbox.checked){
            checkedConut++;
        }
        const progressNum= document.querySelector(".progress-num")
        const checkedPercentage = (checkedConut / checkboxes.length) * 100;
        if (checkedConut == 0) {
            progressNum.style.width = "0%";
        } else {
            progressNum.style.width = `${checkedPercentage}%`;
        }

    });

    //let checkedCount = 0;
    // const checkboxes = document.querySelectorAll(".checkbox");
    // checkboxes.forEach((checkbox) => {

        
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

            const totalCheckboxes = checkboxes.length;
            const checkedPercentage = (checkedCount / totalCheckboxes) * 100;
            // const progressNum= document.querySelector(".progress-num")
            // if (checkedCount == 0) {
            //     progressNum.style.width = "0%";
            // } else {
            //     progressNum.style.width = `${checkedPercentage}%`;
            // }
        });

        const minus = checkbox.nextElementSibling.nextElementSibling.nextElementSibling;
        minus.addEventListener("click", function () {
            checkbox.parentElement.remove();
            if (checkbox.checked) {
                checkedCount--;
            }

            const totalCheckboxes = checkboxes.length;
            const checkedPercentage = (checkedCount / totalCheckboxes) * 100;

            if (checkedCount == 0) {
                progressNum.style.width = "0%";
            } else {
                progressNum.style.width = `${checkedPercentage}%`;
            }
        });
    });
}