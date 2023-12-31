// 팔로잉, 언팔로우 버튼 토글

const customBtns = document.querySelectorAll('.customBtn');

customBtns.forEach((button) => {

    button.addEventListener('click', () => {

        if (button.classList.contains('unfollowBtn')) {
            button.classList.remove('unfollowBtn');
            button.classList.add('followingBtn');
            button.querySelector('div').textContent = 'following';

        } else {
            button.classList.remove('followingBtn');
            button.classList.add('unfollowBtn');
            button.querySelector('div').textContent = 'follow';
        }

    });

});

// 팔로우 함수
function followBtnClick(){
    const data = {
        "loginMemberNo" : loginMemberNo,
        "boardMemberNo" : memberNo
    }

        fetch("/myPage/memberFeed/" + memberNo + "/follow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(resp => resp.json())
        .then(result => {

            Swal.fire({
                icon: 'success',                     
                title: '팔로우 되었습니다. 🤩',    
                text: '회원님만의 득근 레시피를 함께 나눠 보세요!', 

              }).then(()=>{
                  location.reload();

              })
        })
        .catch(err => console.log(err))
}

// 언팔로우 함수
function unfollowBtnClick(){

    const data = {
        "loginMemberNo" : loginMemberNo,
        "boardMemberNo" : memberNo
    }

        fetch("/myPage/memberFeed/" + memberNo + "/unfollow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(resp => resp.json())
        .then(result => {

            Swal.fire({
                icon: 'success',                     
                title: '언팔로우 되었습니다. 🙏',    
                text: '회원님의 다른 득근 메이트를 찾아보세요!', 

              }).then(()=>{
                  location.reload();
                  
              })

        })
        .catch(err => console.log(err))
}

/* ------------------------------------------------------------------------------------------------ */

// 피드 주인의 팔로우 리스트 버튼
const followInfoAreas = document.querySelectorAll('.followInfoArea');

// 팔로우 목록 조회 영역
const followListArea = document.getElementById("followListArea");

// 팔로우, 팔로잉 중 누른 버튼만 색 바꾸기
followInfoAreas[0].addEventListener("click", ()=>{

    if(followInfoAreas[0].classList.contains("clickList")){
        followInfoAreas[0].classList.remove("clickList")
        followInfoAreas[1].classList.remove("clickList")

    } else {

        if(followInfoAreas[1].classList.contains("clickList")){
            followInfoAreas[0].classList.remove("clickList");
            followInfoAreas[1].classList.remove("clickList");
            return;
        }

        followInfoAreas[0].classList.add("clickList")
        followInfoAreas[1].classList.remove("clickList")
    }

})

followInfoAreas[1].addEventListener("click", ()=>{
  
    if(followInfoAreas[1].classList.contains("clickList")){
        followInfoAreas[1].classList.remove("clickList");
        followInfoAreas[0].classList.remove("clickList");
        
    } else {

        if(followInfoAreas[0].classList.contains("clickList")){
            followInfoAreas[1].classList.remove("clickList");
            followInfoAreas[0].classList.remove("clickList");
            return;
        }

        followInfoAreas[1].classList.add("clickList")
        followInfoAreas[0].classList.remove("clickList")
    }
    
})


// 리스트 토글 함수
function toggleFollowList() {
    const followListArea = document.getElementById("followListArea");
    if (followListArea.style.display === "none") {
        followListArea.style.display = "block";
    } else {
        followListArea.style.display = "none";
    }
}

/* ------------------------------------------------------------------------------------------------ */

// 팔로우 목록 버튼
const followingListBtn = document.getElementsByClassName("followingListBtn")[0];
const followerListBtn = document.getElementsByClassName("followerListBtn")[0];

// 피드 주인의 팔로잉 목록 조회
function selectFollowingList(){

    fetch("/myPage/memberFeed/" + memberNo + "/following", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : ""
    })
    .then(resp => resp.json())
    .then(map => {

        // 팔로잉 리스트
        const followingList = map.followingList;

        console.log(followingList.length);

        // 팔로잉 목록 조회 영역 비운 뒤 div 추가
        followListArea.innerHTML = "";

        if(followingList.length == 0){

            followListArea.innerHTML = "";
            const span = document.createElement("span");
            span.classList.add('textCenter');
            span.innerHTML = "<h4>목록이 비어 있습니다. 😅</h4>";
            followListArea.appendChild(span);

        } else{

            // 팔로잉 리스트에서 팔로워 하나씩 꺼내오기
            for (const following of followingList) {
                
                // 팔로잉 정보
                const memberNo = following.memberNo;
                const profileImage = following.profileImage;
                const memberNickname = following.memberNickname;

                // 팔로잉 리스트 목록 생성
                
                // jsp 내 58 ~ 59번째 줄 생성(follow-list 클래스 있는 div)
                const div = document.createElement("div");
                const a = document.createElement("a");
                
                div.classList.add("follow-list");
                a.setAttribute("href", "/myPage/memberFeed/" + memberNo);
                div.append(a);
                
                // 60 ~ 69번째 줄 생성(프로필 이미지 있는 div)
                const div2 = document.createElement("div");
                const img2 = document.createElement("img");
                
                div2.classList.add("followProfileImg");
                if (profileImage == null) {
                    img2.setAttribute("src", "/resources/images/user.png");
                } else {
                    img2.setAttribute("src", profileImage);
                }
                div2.appendChild(img2);
                
                // 71 ~ 75번째 줄 생성(닉네임 있는 div)
                const a2 = document.createElement("a");
                const div3 = document.createElement("div");

                a2.setAttribute("href", "/myPage/memberFeed/" + memberNo);
                div3.classList.add("followNickname");
                div3.innerHTML = memberNickname;
                a2.appendChild(div3);

                // 전체 요소 합치기
                div.appendChild(div2);
                div.appendChild(a2);
                followListArea.appendChild(div);
            }

        }


    })
    .catch(err => {console.log(err)})
}


// 피드 주인의 팔로워 목록 조회

// 팔로워 목록 조회 함수
function selectFollowerList(){
    
    fetch("/myPage/memberFeed/" + memberNo + "/follower", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : ""
    })
    .then(resp => resp.json())
    .then(map => {

        // 팔로워 리스트
        const followerList = map.followerList;

        if(followerList.length == 0){

            followListArea.innerHTML = "";
            const span = document.createElement("span");
            span.classList.add('textCenter');
            span.innerHTML = "<h4>목록이 비어 있습니다. 😅</h4>";
            followListArea.appendChild(span);

        } else{

            // 팔로워 목록 조회 영역 비운 뒤 div 추가
            followListArea.innerHTML = "";

            // 팔로워 리스트에서 팔로워 하나씩 꺼내오기
            for (const follower of followerList) {
                
                // 팔로워 정보
                const memberNo = follower.memberNo;
                const profileImage = follower.profileImage;
                const memberNickname = follower.memberNickname;

                // 팔로워 리스트 목록 생성
                
                // jsp 내 58 ~ 59번째 줄 생성(follow-list 클래스 있는 div)
                const div = document.createElement("div");
                const a = document.createElement("a");
                
                div.classList.add("follow-list");
                a.setAttribute("href", "/myPage/memberFeed/" + memberNo);
                div.append(a);
                
                // 60 ~ 69번째 줄 생성(프로필 이미지 있는 div)
                const div2 = document.createElement("div");
                const img2 = document.createElement("img");
                
                div2.classList.add("followProfileImg");
                if (profileImage == null) {
                    img2.setAttribute("src", "/resources/images/user.png");
                } else {
                    img2.setAttribute("src", profileImage);
                }
                div2.appendChild(img2);
                
                // 71 ~ 75번째 줄 생성(닉네임 있는 div)
                const a2 = document.createElement("a");
                const div3 = document.createElement("div");

                a2.setAttribute("href", "/myPage/memberFeed/" + memberNo);
                div3.classList.add("followNickname");
                div3.innerHTML = memberNickname;
                a2.appendChild(div3);

                // 전체 요소 합치기
                div.appendChild(div2);
                div.appendChild(a2);
                followListArea.appendChild(div);
            }
        }
    })
    .catch(err => {console.log(err)})
}
/* ------------------------------------------------------------------------------------------------ */

// 획득한 뱃지 호버 효과 주기
const animateBounce = document.querySelectorAll(".achieved");

animateBounce.forEach(element => {

    element.addEventListener("mouseover", ()=>{
        element.classList.add("animate__animated", "animate__tada", "animate__infinite");
    })

    element.addEventListener("mouseout", ()=>{
        element.classList.remove("animate__animated", "animate__tada", "animate__infinite");
    })
    
});

// 뱃지 캐러셀
const CAROUSEL_LENGTH = document.querySelectorAll(".badgeImg").length - 1;
let current = 0;

const $carousel = document.querySelector(".carousel");
const $prevBtn = document.querySelector(".prev-btn");
const $nextBtn = document.querySelector(".next-btn");

const nextEvent = () => {
    if (current !== CAROUSEL_LENGTH) {
      $carousel.style.transform = `translateX(${(current + 1) * -121}px)`;
      current++;
    } else {
      current = 0;
      $carousel.style.transform = `translateX(0px)`;
    }
  };
  
  const prevEvent = () => {
    if (current !== 0) {
      current--;
      $carousel.style.transform = `translateX(${current * -121}px)`;
    } else {
      current = CAROUSEL_LENGTH;
      $carousel.style.transform = `translateX(${CAROUSEL_LENGTH * -100}px)`;
    }
  };
  
  $nextBtn.addEventListener("click", nextEvent);
  $prevBtn.addEventListener("click", prevEvent);


  const container = document.getElementsByClassName("container")[0];
  const offsetLeft = container.offsetLeft;

/* ------------------------------------------------------------------------------------------------ */

/* 달력 */

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

        ///----------------------------------------------------------
        
        // 로그인 되었을 때 todolist 캘린더에 결과 보여주기
        if (loginMemberNo != "") {
            $.ajax({
                
                url: "/todolist",
                method: "POST",
                data: { "memberNo": memberNo },
                dataType: "JSON",
                success: function (todolistMap) {
                    for (let todos of todolistMap) {
                        const todoFl = todos.ALL_FL; // 진행여부! 'Y'- 동그라미 'N'- 세모
                        const todoDays = todos.L_CREATE_DT.split("-");
                        const todoYear2 = todoDays[0]; //년
                        const todoMonth2 = todoDays[1]; //월
                        const todoDay2 = todoDays[2]; //일
                        // newDIV2 엘리먼트 생성
                        newDIV2 = document.createElement("i");
                        
                        // console.log("todoFl:" + todoFl)
                        
                        if (todoFl == 'Y') {
                            newDIV2.classList.add("fa-solid", "fa-circle", "Circle");
                        } else {
                            
                            newDIV2.classList.add("fa-solid", "fa-caret-up", "triangle");
                        }
                        
                        findDateCell(todoYear2, todoMonth2, todoDay2, newDIV2);
                        
                    }
                },
                error: function () {
                    console.log("실패");
                }
            });
        
        }
        
        ///----------------------------------------------------------
    }
    // 마지막 tr이 비어 있을 경우 삭제
    if (nowRow.cells.length === 0) {
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }
}



//---------------------------------------------------

 // 달력 셀을 찾는 함수
 function findDateCell(year, month, day,newDIV2) {
    // console.log("day"+day)
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


//---------------------------------------------------




  
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
  
/* ------------------------------------------------------------------------------------------- */

/* 캘린더 말풍선 */
$(window).scroll(function() {
    $('#animatedElement').each(function(){
    const imagePos = $(this).offset().top;

    const topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+400) {
            $(this).addClass("slideUp");
        }
    });
});

/* ------------------------------------------------------------------------------------------- */
