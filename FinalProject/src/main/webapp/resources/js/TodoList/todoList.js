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
let today = new Date();     // 페이지를 로드한 날짜를 저장
window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화




// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {
    const checkObj = {
        "flag" : false,
        
    };
    
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
        var newDIV = document.createElement("p");
        let newDIV2 = document.createElement("i");
        newDIV.innerHTML = leftPad(nowDay.getDate());
        nowColumn.append(newDIV);

        if (nowDay < today) {
            newDIV.className = "pastDay";
            newDIV.onclick = function () { choiceDate(this); }
        } else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {
            
            
            newDIV.className = "today";
            if (checkObj.flag == false || checkObj.flag == undefined) {
                newDIV.onclick = function () { choiceDate(this); }
                choiceDate(newDIV);
            } else if (checkObj.flag == true) {
                // 기존 .choiceDay에 이벤트를 할당
                const chosenDay = document.querySelector(".choiceDay");
                if (chosenDay) {
                    chosenDay.onclick = function () { choiceDate(this); }
                    choiceDate(chosenDay);
                }
                // checkObj.flag = false;
            }
            
            

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

        
       
    }

    // ajax,, 여기서 만들어야해
    // i 태그에db에서 가져와서 넣어보기 
    // 동그라미 또는 세모

    // 로그인 되었을 때 todolist 캘린더에 
    // 결과 보여주기 
    
    var newDIV2 = ""
    // 로그인 되었을 때 todolist 캘린더에 결과 보여주기
    if (loginMemberNo != "") {
        // console.log('로그인됨')
        $.ajax({
            
            url: "/todolist",
            method: "POST",
            data: { "memberNo": loginMemberNo },
            dataType: "JSON",
            success: function (todolistMap) {
                for (let todos of todolistMap) {
                    const todoFl = todos.LIST_FL; // 진행여부! 'Y'- 동그라미 'N'- 세모
                    const todoDays = todos.L_CREATE_DT.split("-");
                    const todoYear2 = todoDays[0]; //년
                    const todoMonth2 = todoDays[1]; //월
                    const todoDay2 = todoDays[2]; //일
                    // newDIV2 엘리먼트 생성
                    newDIV2 = document.createElement("i");
                    
                    console.log("todoFl:" + todoFl)
                    
                    if (todoFl == 'Y') {
                        newDIV2.classList.add("fa-solid", "fa-circle", "Circle");
                    } else {
                        
                        newDIV2.classList.add("fa-solid", "fa-caret-up", "triangle");
                    }

                    
                    const dateCell = findDateCell(todoYear2, todoMonth2, todoDay2, newDIV2);
                    
                }
            },
            error: function () {
                console.log("실패");
            }
        });

    }else{ // 로그인 안되어 있을 때 
        // console.log('로그인 안됨')
        const todoContent = document.querySelector(".check-area");
        todoContent.innerHTML=""

        // 비회원 일시
        const guest = document.createElement("div");
        guest.innerText="로그인후 나만의 ToDoList를 득근해보세요💪";
        guest.classList.add("guest");
        
        todoContent.append(guest);
    }




    // 달력 셀을 찾는 함수
    function findDateCell(year, month, day,newDIV2) {
        
        const calenderYaer = document.getElementById("calYear").innerText;  // 년
        const calendeMath = document.getElementById("calMonth").innerText; // 월
        const calendeDays = document.querySelectorAll("tbody p");
            // 현재 화면에 보이는 '일'을 배열로 가지고 옴!

        if(calenderYaer  == year){
            if(calendeMath == month){
                for ( let calendeDay of calendeDays) {
                    
                    if(calendeDay.innerText == day){
                        // console.log(newDIV2)
                        calendeDay.innerHTML="";
                        calendeDay.innerHTML=day;
                        calendeDay.append(newDIV2);
                    }
                }
            }
        }
    }

    // 마지막 tr이 비어 있을 경우 삭제
    if (nowRow.cells.length === 0) {
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }
    
}



//날짜 선택
function choiceDate(newDIV) {
    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
    }
    newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가 
    // 선택한 날짜 변수에 담아 불러오기 
    const yaer = document.getElementById("calYear").innerText;  // 년
    const math = document.getElementById("calMonth").innerText; // 월
    let day =  newDIV.innerText; // 일
   
    const choiceTodoDate = yaer+'-' + math+'-' + day
    // console.log('선택한 날짜 :'+ choiceTodoDate)
    
    // 오늘 날짜 가져오기
    // if(checkObj.flag== false || checkObj.flag== undefined){

        const todayYear = today.getFullYear();
        const todayMonth = today.getMonth()+1;
        const todayDate = today.getDate();
        //오늘 날짜
        const sysDate = todayYear + "-" + (todayMonth < 10 ? "0" : "") + todayMonth + "-" + (todayDate < 10 ? "0" : "") + todayDate;
    // }
    // console.log('오늘 날짜 :'+ sysDate)

    todoslist(choiceTodoDate);

}

function todoslist(choiceTodoDate){
    // ajax을 할 예정
    if( loginMemberNo != ""){

        $.ajax({
            url: "/todoDetaile",
            method: "POST",
            data: { "choiceTodoDate": choiceTodoDate },
            dataType: "JSON",
            success: function (detailedTodoList) {
                // console.log('날짜 선택 성공');
                console.log(detailedTodoList);

                document.querySelector(".check-area").innerHTML="";
                for(let todo of detailedTodoList){

                    // 새로운 div 요소 생성
                    const div = document.createElement("div");

                    // 체크 상세의 번호를 담은 input type = heddin
                    const input2 = document.createElement("input");
                    input2.setAttribute("type" , "hidden");
                    input2.classList.add("list_no");
                    input2.value = todo.listNo;
                
            
                    // 랜덤 아이디 생성
                    const randomId = "ck" + generateRandomId();
            
                    // input 요소 생성 및 속성 설정
                    const input = document.createElement("input");
                    input.setAttribute("type", "checkbox");
                    input.setAttribute("id", randomId);
                    input.setAttribute("class", "none checkbox");
                    
            
                    // label 요소 생성 및 연결
                    const label = document.createElement("label");
                    label.setAttribute("for", randomId);
                    label.setAttribute("class", "ck");
            
                    // span 요소 생성 및 텍스트 설정
                    const span = document.createElement("span");
                    span.textContent = todo.listContent;
                    if(todo.listFl){
                        input.checked = true;
                        span.classList.add("complete")
                    }
            
                    // button 요소 생성
                    const button = document.createElement("button");
                    button.setAttribute("type", "button");
            
                    // i 요소 생성 및 클래스 및 스타일 설정
                    const i = document.createElement("i");
                    i.setAttribute("class", "fa-solid fa-minus minus");
                    i.style.color = "#ffffff";

                    const input3 = document.createElement("input")
                    input3.setAttribute("type", "hidden");
                    input3.classList.add("lcreateDt");
                    input3.value = todo.lCreateDt;
                    console.log("lcreateDt :"+ todo.lCreateDt)

                    
            
                    // 각 요소를 div에 추가
                    div.appendChild(input);
                    div.appendChild(input2);
                    div.appendChild(label);
                    div.appendChild(span);
                    div.appendChild(button);
                    button.appendChild(i);
                    div.append(input3)
            
                    // div를 원하는 위치에 추가
                    
                    document.querySelector(".check-area").append(div);
            
                    // initializeTodoList(choiceTodoDate);
                    updateCheckedPercentage();


                }
            },
            error: function(){
                // console.log('날짜 선택 실패')
            }
        })

    }
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

if(document.querySelector(".addListBtn")!= null){

    const addListBtn = document.querySelector(".addListBtn");
    
    addListBtn.addEventListener("click", function() {
        const addListInput = document.querySelector(".addList");
        const addListVal = addListInput.value.trim(); // 입력 값의 양 끝 공백을 제거합니다.
    
        const reqExp = /^[가-힣a-zA-Z\s]{1,10} \d{1,2}회 \d{1,2}세트$/;
    
        const maxCheckboxes = 10;
        const currentCheckboxes = document.querySelectorAll(".checkbox").length;
        
        if(loginMemberNo == ""){
            alert("로그인후 이용해 주세요💪");
            return;
        }

        if(addListVal.length == 0 ){
            alert("내용을 입력해주세요👀");
            return;
        }else{

            let spanContent = document.querySelectorAll('.check-area > div >span');
            
            for(let i of spanContent){
                if(addListVal == i.innerText){
                    alert("이미 입력한 루틴입니다.😊");
                    addListInput.value = "";
                    return;
                }
                
            }

            if(currentCheckboxes >= maxCheckboxes){
                alert("10개 이상 입력할 수 없습니다. 😢");
                addListInput.value = "";
                return; // 입력 막기
            }else{
        
                if (!reqExp.test(addListVal)) {
                    if (confirm("운동 횟수와 세트 횟수를 입력해주세요💗")) {
                        addListInput.focus();
                        addListInput.value = "  회  세트";
                    }
                } else {
            
                    alert("정규식 성공! DB에 insert한 후 다시 목록조회 하자!");
                    addListInput.value = "";
            
                    // 새로운 div 요소 생성
                    const div = document.createElement("div");
            
                    // 랜덤 아이디 생성
                    const randomId = "ck" + generateRandomId();
            
                    // input 요소 생성 및 속성 설정
                    const input = document.createElement("input");
                    input.setAttribute("type", "checkbox");
                    input.setAttribute("id", randomId);
                    input.setAttribute("class", "none checkbox");
            
                    // label 요소 생성 및 연결
                    const label = document.createElement("label");
                    label.setAttribute("for", randomId);
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
            
                    initializeTodoList(choiceTodoDate);
                    updateCheckedPercentage();
                }
            }
        }
        
    });
}

// 랜덤 아이디 생성 함수
function generateRandomId() {
    return Math.random().toString(36).substring(2, 10);
}

// 페이지가 실행 되었을 때, 
$(document).ready(function(){
    // initializeTodoList(choiceTodoDate);
    updateCheckedPercentage();
});




function initializeTodoList(choiceTodoDate) {
    const checkboxes = document.querySelectorAll(".checkbox");

    checkboxes.forEach((checkbox) => {
        //console.log(checkbox.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling)
        const minus = checkbox.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
       if(minus){

           minus.addEventListener("click", function () {
               checkboxes.length = 0;
               checkbox.parentElement.remove();
           
               updateCheckedPercentage();
           });
       }

        
    });

}

// 체크박스의 상태를 저장할 객체
//  var checkboxStates = {};

document.addEventListener('click', (e) => {
    const target = e.target;

    if (target.classList.contains("checkbox")) {
        const chDate =target.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
        
       

        updateTodo(target,target.checked, chDate.value );
        updateCheckedPercentage();
        console.log(target)
    }
})



function updateTodo(checkbox,listFl,choiceTodoDate ) {

    // 체크 상태 저장 변수
    const completed = listFl;
    console.log(listFl)
    const ListNo = checkbox.nextElementSibling.value;
    const todosToUpdate = { listNo: ListNo, listFl: completed };

    // 서버로 업데이트할 정보를 전송
    fetch("/todo/update", {
        method: "POST",
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(todosToUpdate)
    })
    .then(resp => resp.text())
    .then(result => {
        if (result > 0) {
           
            console.log("성공")
            todoslist(choiceTodoDate)
            buildCalendar();
            if(checkObj.flag == undefined||
                checkObj.flag == false){
                    checkObj.flag = true;
            }


        } else {
            console.log('업데이트 실패ㅜㅜ');
        }
    })
    .catch(e => console.log(e));
}



// 진행률 조회 
function updateCheckedPercentage( ) {
    const progressNum = document.querySelector(".progress-num")
    const totalCheckboxes = document.querySelectorAll(".ck").length;
    const checkboxes = document.querySelectorAll(".checkbox")


    let checkedCount =0;
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
            checkedCount++;
        }
    })

    // console.log("totalCheckboxes"+ totalCheckboxes);
    // console.log("checkedCount"+ checkedCount);
    
    const checkedPercentage = (checkedCount / totalCheckboxes) * 100;

    if (checkedCount === 0) {
        progressNum.style.width = "0%";
    } else {
        progressNum.style.width = `${checkedPercentage}%`;
    }
}

// -------------------------------------------------------------------------------
// shareBoardDetail 페이지에서 
// addList 버튼 눌렀을 때 
// todolist 목록에 추가하기 


if(document.querySelector(".boardAddListBtn") != null){
    const addLists = document.querySelectorAll(".boardAddListBtn");
    const routineNmSpan = document.querySelector(".routineNm span");
    
    
    const maxCheckboxes = 10;

    addLists.forEach((addListBtn) => {
    
        addListBtn.addEventListener("click", function() {
            
            // 현재 체크박스 개수를 가져옵니다.
            const currentCheckboxes = document.querySelectorAll(".checkbox").length;

            if (currentCheckboxes >= maxCheckboxes) {
            alert("10개 이상 입력할 수 없습니다. 😢");
            return; // 입력 막기
            }
            
            // span 요소의 텍스트 내용을 가져옵니다.
            const routineText = routineNmSpan.textContent;
            
            //체크 박스 생성하기
            // 새로운 div 요소 생성
            const div = document.createElement("div");

            // 랜덤 아이디 생성
            const randomId = "ck" + generateRandomId();

            // input 요소 생성 및 속성 설정
            const input = document.createElement("input");
            input.setAttribute("type", "checkbox");
            input.setAttribute("id", randomId);
            input.setAttribute("class", "none checkbox");

            // label 요소 생성 및 연결
            const label = document.createElement("label");
            label.setAttribute("for", randomId);
            label.setAttribute("class", "ck");

            // span 요소 생성 및 텍스트 설정
            const span = document.createElement("span");
            span.textContent = routineText;

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

            initializeTodoList(choiceTodoDate);
            updateCheckedPercentage();
        
            // 진행률 표시 바를 업데이트하거나 관련 작업을 수행합니다.
            updateCheckedPercentage();
        });
    });
    
}



