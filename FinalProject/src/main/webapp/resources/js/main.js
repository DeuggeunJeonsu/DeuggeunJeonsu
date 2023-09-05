/*검색 버튼 눌렀을 때 창 사라지고 나타남*/

$(document).ready(function(){
    // 돋보기 버튼 눌렀을 시 검색 창 나타나거나 사라짐  
    $('.search').click( function (){
        $('.top-search').slideToggle();
    })

    //  X 버튼 눌렀을 시 검색창 사라짐
    $('.close-search').click(function(){
        $('.top-search').slideUp();
    })

    // 스크롤 여부 확인 후 header 변화 
    var didScroll = false; // 스크롤 여부를 확인하는 변수
    const headerNav = document.querySelector(".header-nav");
    const navContainer = document.querySelector(".nav-container")
    const log01 = document.querySelector(".log01");  
    const log02 = document.querySelector(".log02"); //스크롤내렸을 때 보이게 될 로고
    const body = document.querySelector("body")
   
    $(window).scroll(function(e) {
        didScroll = true;
    });


    // 메인페이지가 아닐때
    if(document.querySelector("[name='mainPage']") == null){
    
        navContainer.classList.add("nav-sticky");
        headerNav.classList.remove("no-background");
        headerNav.classList.add("nav-container-bg")
        body.classList.add("nav-padding")
        // log02.classList.add("log-disply");
        // log01.classList.remove("log-disply");

        return;

    }
    

    setInterval(function() {
        if (didScroll) {
            didScroll = false;
            hasScrolled();
        }
    }, 250);

   
    

    function hasScrolled() {

        var scrollTop = $(window).scrollTop();
        if (scrollTop === 0) {
            //배경 변화
            headerNav.classList.add("no-background");
            headerNav.classList.remove("nav-container-bg");

            // // 로고 변화
            // log02.classList.remove("log-disply");
            // log01.classList.add("log-disply");
            return;
        } else {
            headerNav.classList.remove("no-background");
            headerNav.classList.add("nav-container-bg")

            // log02.classList.add("log-disply");
            // log01.classList.remove("log-disply");
            return;
        }
    }
    

});
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

    
    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
        
        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
        
        let newDIV = document.createElement("p");
        
        
        let newDIV2 = document.createElement("i");
        newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
                // 추가한 열에 날짜 입력
        nowColumn.append(newDIV,newDIV2);

        if (nowDay.getDay() == 6) {                 // 토요일인 경우
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
            
        }

        if (nowDay < today) {                       // 지난날인 경우
            newDIV.className = "pastDay";
           
            
            newDIV.onclick = function () { choiceDate(this); }
        }
        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            newDIV.className = "today";
            newDIV.classList.add("choiceDay")
            newDIV.onclick = function () { choiceDate(this); }
        }
        else {                                      // 미래인 경우
            newDIV.className = "futureDay";
            
        }
        
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