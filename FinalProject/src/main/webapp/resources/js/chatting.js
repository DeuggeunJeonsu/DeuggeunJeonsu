// 메뉴
const buttons = document.querySelector("#buttons"); // 메뉴 버튼 영역
const menuBtns = document.querySelectorAll(".menu-btn"); // 메뉴 버튼 전체
const menuBtn = document.querySelector("#menuBtn"); // 메뉴 버튼
const menuArea = document.querySelector("#menus"); // 사이드 메뉴 영역
let menuFlag = 0; // 메뉴버튼 토글 플레그

// 팔레트
const palette = document.querySelector("#palette"); // 팔레트 설정 버튼
const palettePopupLayer = document.querySelector("#palettePopupLayer"); // 팝업 레이어
const closeBtn2 = document.querySelector("#paletteCloseBtn"); // 팝업 닫기 버튼
const palette1Color = document.querySelector("#palette1Color"); // 사이드 메뉴 색상 input
const menuIconColor = document.querySelector("#menuIconColor"); // 사이드메뉴 아이콘 색상 input
const palette2Color = document.querySelector("#palette2Color"); // 채팅방 목록 색상 input
const listFontColor = document.querySelector("#listFontColor"); // 목록 글꼴 색상 input
const palette3Color = document.querySelector("#palette3Color"); // 채팅방 내부 색상 input
const chatFontColor = document.querySelector("#chatFontColor"); // 내부 글꼴 색상 input
const saveThemaBtn = document.querySelector("#saveThemaBtn"); // 테마 저장 버튼

// 채팅방
const addTarget = document.querySelector("#addTarget"); // 채팅방 추가 버튼
const addTargetPopupLayer = document.querySelector("#addTargetPopupLayer"); // 팝업 레이어
const closeBtn1 = document.querySelector("#addTargetCloseBtn"); // 팝업 닫기 버튼
const targetInput = document.querySelector("#targetInput"); // 회원 검색창
const resultArea = document.querySelector("#resultArea"); // 회원 검색 결과
const roomSearchInput = document.querySelector("#roomSearchInput"); // 채팅방 목록 내 검색 input
const roomListArea = document.querySelector("#chattingRoomListArea"); // 채팅방 목록 영역
const roomDetail = document.querySelector("#chattingRoomDetail"); // 채팅방 내부 영역

let selectChattingNo; // 선택한 채팅방 번호
let selectTargetNo; // 현재 채팅 대상
let selectTargetName; // 대상의 이름
let selectTargetProfile; // 대상의 프로필

// 랜더링 시 회원 테마 적용
menuArea.style.backgroundColor=themas[0];
palette1Color.value=themas[0];
roomListArea.style.backgroundColor=themas[1];
palette2Color.value=themas[1];
roomDetail.style.backgroundColor=themas[2];
palette3Color.value=themas[2];

// 전송 textarea 자동으로 늘어나도록 설정
const inputChatting = document.getElementById("inputChatting");

inputChatting.addEventListener("input",()=>{
   let sendContent = inputChatting.value.split(/\r\n|\r|\n/);
   let rowCount = inputChatting.value.split(/\r\n|\r|\n/).length;
   if(rowCount < 2){ // textarea row=1일 때
      inputChatting.style.height="42px"; // 최소값
   }
   else if(rowCount <= 15){
      inputChatting.style.height= ((rowCount*21)+20) + "px";
   }
})

// 메뉴버튼 누르면 버튼들 등장
menuBtn.addEventListener("click",()=>{
   if(menuFlag==0) {
      buttons.style.height="200px";
      menuFlag=1;
   }
   else {
      buttons.style.height="40px";
      menuFlag=0;
   }
})

// 검색 팝업 레이어 열기
addTarget.addEventListener("click", e => {
   addTargetPopupLayer.classList.toggle("displayNone");
   palettePopupLayer.setAttribute("class","displayNone");
   targetInput.focus();
});
// 검색 팝업 레이어  닫기
closeBtn1.addEventListener("click", e => {
   addTargetPopupLayer.setAttribute("class","displayNone");
   resultArea.innerHTML = "";
});

// 팔레트 팝업 레이어 열기
palette.addEventListener("click", e => {
   palettePopupLayer.classList.toggle("displayNone");
   addTargetPopupLayer.setAttribute("class","displayNone");
   targetInput.focus();
});
// 팔레트 팝업 레이어  닫기
closeBtn2.addEventListener("click", e => {
   palettePopupLayer.setAttribute("class","displayNone");
});


// 채팅 상대 검색 ajax
targetInput.addEventListener("input", e => {

   const query = e.target.value.trim();

   // 입력된게 없을 때
   if(query.length == 0){
      resultArea.innerHTML = ""; // 이전 검색 결과 비우기
      return;
   }

   // 입력된게 있을 때
   if(query.length > 0){
      fetch("/chatting/selectTarget?query="+query)
      .then(resp => resp.json())
      .then(list => {
         resultArea.innerHTML = ""; // 이전 검색 결과 비우기

         if(list.length == 0){
            const li = document.createElement("li");
            li.classList.add("result-row");
            li.innerText = "일치하는 회원이 없습니다";
            resultArea.append(li);
         }

         for(let member of list){
            // li요소 생성(한 행을 감싸는 요소)
            const li = document.createElement("li");
            li.classList.add("result-row");
            li.setAttribute("data-id", member.memberNo);

            // 프로필 이미지 요소
            const img = document.createElement("img");
            img.classList.add("result-row-img");
            
            // 프로필 이미지 여부에 따른 src 속성 선택
            if(member.profileImage == null) img.setAttribute("src", "/resources/images/user.png");
            else   img.setAttribute("src", member.profileImage);

            let nickname = member.memberNickname;
            let email = member.memberEmail;

            const span = document.createElement("span");
            span.innerHTML = `${nickname} ${email}`.replace(query, `<mark>${query}</mark>`);

            // 요소 조립(화면에 추가)
            li.append(img, span);
            resultArea.append(li);

            // li요소에 클릭 시 채팅방에 입장하는 이벤트 추가
            li.addEventListener('click', chattingEnter);
         }

      })
      .catch(err => console.log(err) );
   }
});


// 채팅방 입장 또는 선택 함수
function chattingEnter(e){
   console.log(e.target); // 실제 클릭된 요소
   console.log(e.currentTarget); // 이벤트 리스트가 설정된 요소

   const targetNo = e.currentTarget.getAttribute("data-id");

   fetch("/chatting/enter?targetNo="+targetNo)
   .then(resp => resp.text())
   .then(chattingNo => {
      console.log(chattingNo);
      
      selectRoomList(); // 채팅방 목록 조회
      
      setTimeout(()=>{ 
         // 만약 채팅방 목록 중 이미 존재하는 채팅방이 있으면 클릭해서 입장
         const itemList = document.querySelectorAll(".chatting-item")
         for(let item of itemList) {      
            if(item.getAttribute("chat-no") == chattingNo){
               item.focus();
               item.click();
               addTargetPopupLayer.classList.toggle("displayNone");
               targetInput.value = "";
               resultArea.innerHTML = "";
               return;
            }
         }
      }, 200);
   })
   .catch(err => console.log(err));
}


// 채팅방 목록 조회
function selectRoomList(){

   fetch("/chatting/roomList")
   .then(resp => resp.json())
   .then(roomList => {

      // 채팅방 목록 출력 영역 선택
      const chattingList = document.querySelector("#chattingRoomList");

      // 채팅방 목록 지우기
      chattingList.innerHTML = "";

      // 조회한 채팅방 목록을 화면에 추가
      for(let room of roomList){
         const li = document.createElement("li");
         li.classList.add("chatting-item");
         li.setAttribute("chat-no", room.chattingNo);
         li.setAttribute("target-no", room.targetNo);

         if(room.chattingNo == selectChattingNo){
            li.classList.add("select");
         }

         // item-header 부분
         const itemHeader = document.createElement("div");
         itemHeader.classList.add("item-header");

         const listProfile = document.createElement("img");
         listProfile.classList.add("list-profile");

         if(room.targetProfile == undefined)   
            listProfile.setAttribute("src", "/resources/images/user.png");
         else                        
            listProfile.setAttribute("src", room.targetProfile);

         itemHeader.append(listProfile);

         // item-body 부분
         const itemBody = document.createElement("div");
         itemBody.classList.add("item-body");

         const p = document.createElement("p");

         const targetName = document.createElement("span");
         targetName.classList.add("target-name");
         targetName.innerText = room.targetNickName;
         
         const recentSendTime = document.createElement("span");
         recentSendTime.classList.add("recent-send-time");
         recentSendTime.innerText = room.sendTime;
         
         p.append(targetName, recentSendTime);
         
         
         const div = document.createElement("div");
         
         const recentMessage = document.createElement("p");
         recentMessage.classList.add("recent-message");

         if(room.lastMessage != undefined){
            recentMessage.innerHTML = room.lastMessage;
         }
         
         div.append(recentMessage);

         itemBody.append(p,div);

         // 현재 채팅방을 보고있는게 아니고 읽지 않은 개수가 0개 이상인 경우 -> 읽지 않은 메세지 개수 출력
         if(room.notReadCount > 0 && room.chattingNo != selectChattingNo ){
         // if(room.chattingNo != selectChattingNo ){
            const notReadCount = document.createElement("p");
            notReadCount.classList.add("not-read-count");
            notReadCount.innerText = room.notReadCount;
            div.append(notReadCount);
         }else{

            // 현재 채팅방을 보고있는 경우
            // 비동기로 해당 채팅방 글을 읽음으로 표시
            fetch("/chatting/updateReadFlag",{
               method : "PUT",
               headers : {"Content-Type": "application/json"},
               body : JSON.stringify({"chattingNo" : selectChattingNo, "memberNo" : loginMemberNo})
            })
            .then(resp => resp.text())
            .then(result => console.log(result))
            .catch(err => console.log(err));

         }
         

         li.append(itemHeader, itemBody);
         chattingList.append(li);
      }

      roomListAddEvent();
   })
   .catch(err => console.log(err));

}

// 채팅 메세지 영역
const display = document.getElementsByClassName("display-chatting")[0];

// 채팅방 목록에 이벤트를 추가하는 함수 
function roomListAddEvent(){
   const chattingItemList = document.getElementsByClassName("chatting-item");
   
   for(let item of chattingItemList){
      item.addEventListener("click", e => {
   
         // 클릭한 채팅방의 번호 얻어오기
         //const id = item.getAttribute("id");
         //const arr = id.split("-");
         // 전역변수에 채팅방 번호, 상대 번호, 상태 프로필, 상대 이름 저장
         selectChattingNo = item.getAttribute("chat-no");
         selectTargetNo = item.getAttribute("target-no");

         selectTargetProfile = item.children[0].children[0].getAttribute("src");
         selectTargetName = item.children[1].children[0].children[0].innerText;

         if(item.children[1].children[1].children[1] != undefined){
            item.children[1].children[1].children[1].remove();
         }
         // 채팅방 이름을 채팅상대로 변경
         const rt = document.getElementById("roomTitle");
         rt.innerText = selectTargetName;
   
         // 모든 채팅방에서 select 클래스를 제거
         for(let it of chattingItemList) it.classList.remove("select")
   
         // 현재 클릭한 채팅방에 select 클래스 추가
         item.classList.add("select");
   
         // 비동기로 메세지 목록을 조회하는 함수 호출
         selectChattingFn();
      });
   }
}




// 비동기로 메세지 목록을 조회하는 함수
function selectChattingFn() {

   fetch("/chatting/selectMessage?"+`chattingNo=${selectChattingNo}&memberNo=${loginMemberNo}`)
   .then(resp => resp.json())
   .then(messageList => {
      console.log(messageList);

      // <ul class="display-chatting">
      const ul = document.querySelector(".display-chatting");

      ul.innerHTML = ""; // 이전 내용 지우기

      // 메세지 만들어서 출력하기
      for(let msg of messageList){
         //<li>,  <li class="my-chat">
         const li = document.createElement("li");

         // 보낸 시간
         const span = document.createElement("span");
         span.classList.add("chatDate");
         span.innerText = msg.sendTime;

         // 메세지 내용
         const p = document.createElement("p");
         p.classList.add("chat");
         p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML

         // 내가 작성한 메세지인 경우
         if(loginMemberNo == msg.senderNo){ 
            li.classList.add("my-chat");
            
            li.append(span, p);
            
         }else{ // 상대가 작성한 메세지인 경우
            li.classList.add("target-chat");

            // 상대 프로필
            // <img src="/resources/images/user.png">
            const img = document.createElement("img");
            img.setAttribute("src", selectTargetProfile);
            
            const div = document.createElement("div");

            // 상대 이름
            const b = document.createElement("b");
            b.innerText = selectTargetName; // 전역변수

            const br = document.createElement("br");

            div.append(b, br, p, span);
            li.append(img,div);

         }

         ul.append(li);
         display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
      }

   })
   .catch(err => console.log(err));


}


// ----------------------------------------------------------------------------------------------------------------

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let chattingSock;

if(loginMemberNo != ""){
   chattingSock = new SockJS("/chattingSock");
}



// 채팅 입력
const send = document.getElementById("sendBtn");

const sendMessage = () => {
   const inputChatting = document.getElementById("inputChatting");

   if (inputChatting.value.trim().length == 0) {
      alert("채팅을 입력해주세요.");
      inputChatting.value = "";
   } else {
      var obj = {
         "senderNo": loginMemberNo,
         "targetNo": selectTargetNo,
         "chattingNo": selectChattingNo,
         "messageContent": inputChatting.value,
      };
      console.log(obj)

      // JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
      chattingSock.send(JSON.stringify(obj));

      inputChatting.value = "";
      inputChatting.style.height="42px";
   }
}

// 엔터 == 제출
// 쉬프트 + 엔터 == 줄바꿈
inputChatting.addEventListener("keyup", e => {
   if(e.key == "Enter"){ 
      if (!e.shiftKey) {
         sendMessage();
      }
   }
})


// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
chattingSock.onmessage = function(e) {
   // 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
   const msg = JSON.parse(e.data);
   console.log(msg);


   // 현재 채팅방을 보고있는 경우
   if(selectChattingNo == msg.chattingNo){


      const ul = document.querySelector(".display-chatting");
   
      // 메세지 만들어서 출력하기
      //<li>,  <li class="my-chat">
      const li = document.createElement("li");
   
      // 보낸 시간
      const span = document.createElement("span");
      span.classList.add("chatDate");
      span.innerText = msg.sendTime;
   
      // 메세지 내용
      const p = document.createElement("p");
      p.classList.add("chat");
      p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML
   
      // 내가 작성한 메세지인 경우
      if(loginMemberNo == msg.senderNo){ 
         li.classList.add("my-chat");
         
         li.append(span, p);
         
      }else{ // 상대가 작성한 메세지인 경우
         li.classList.add("target-chat");
   
         // 상대 프로필
         // <img src="/resources/images/user.png">
         const img = document.createElement("img");
         img.setAttribute("src", selectTargetProfile);
         
         const div = document.createElement("div");
   
         // 상대 이름
         const b = document.createElement("b");
         b.innerText = selectTargetName; // 전역변수
   
         const br = document.createElement("br");
   
         div.append(b, br, p, span);
         li.append(img,div);
   
      }
   
      ul.append(li)
      display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
   }



   selectRoomList();
}




// 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", ()=>{
   
   // 채팅방 목록에 클릭 이벤트 추가
   roomListAddEvent(); 

   // 보내기 버튼에 이벤트 추가
   send.addEventListener("click", sendMessage);
});


// 테마 컬러픽커 세팅
Coloris({
   parent: '#palettePopupLayer',
   el: '.color-input',
   rtl: false, // 색상 프리뷰 왼쪽 true, 오른쪽 false
   theme: 'default',     // default, large, polaroid, pill
   themeMode: 'light',   // light , dark 모드
   margin: 5,            // 입력 필드와 색선택창 사이 여백
   alpha: true,          // 불투명도 조절가능 여부
   format: 'hex',        // 포맷 hex rgb hsl auto mixed
   formatToggle: false,   // 포맷 토글 사용여부
   forceAlpha: false,    // 불투명도 미사용 시 값에 포함할지
   closeButton: true,
   closeLabel: '확인',
   swatches: [
      '#498792',
      '#99E1ED',
      '#FF6464',
      '#797979',
      '#DDD',
      'whitesmoke'
   ],
   inline: false
});

Coloris.setInstance('.instance1', {
   defaultColor: '#99E1ED'
});
Coloris.setInstance('.instance2', {
   defaultColor: 'whitesmoke'
});
Coloris.setInstance('.instance3', {
   defaultColor: 'white'
});


// 사이드메뉴 색상 변경
palette1Color.addEventListener("input",()=>{
   menuArea.style.backgroundColor = `${palette1Color.value}`;
   addTargetPopupLayer.style.borderColor = `${palette1Color.value}`;
   palettePopupLayer.style.borderColor = `${palette1Color.value}`;
   document.querySelector(".palette-title-area").style.borderColor = `${palette1Color.value}`;
   document.querySelector(".target-input-area").style.borderColor = `${palette1Color.value}`;
})
// 사이드메뉴 아이콘 색상 변경
menuIconColor.addEventListener("input",()=>{
   for(let btn of menuBtns){
      btn.style.color = `${menuIconColor.value}`;
   }
})

// 채팅방목록 색상 변경
palette2Color.addEventListener("input",()=>{
   roomListArea.style.backgroundColor = `${palette2Color.value}`;
   addTargetPopupLayer.style.backgroundColor = `${palette2Color.value}`;
   palettePopupLayer.style.backgroundColor = `${palette2Color.value}`;
})
// 채팅방목록 글꼴 색상 변경
listFontColor.addEventListener("input",()=>{
   roomListArea.style.color = `${listFontColor.value}`;
   roomSearchInput.style.color = `${listFontColor.value}`;
   targetInput.style.color = `${listFontColor.value}`;
})

// 채팅방내부 색상 변경
palette3Color.addEventListener("input",()=>{
   roomDetail.style.backgroundColor = `${palette3Color.value}`;
})
// 채팅방내부 글꼴 색상 변경
chatFontColor.addEventListener("input",()=>{
   roomDetail.style.color = `${chatFontColor.value}`;
})

saveThemaBtn.addEventListener("click",()=>{
   const equals = (a, b) => JSON.stringify(a) === JSON.stringify(b);
   const nowThemas = [
      palette1Color.value, menuIconColor.value,
      palette2Color.value, listFontColor.value,
      palette3Color.value, chatFontColor.value
   ];
   if(equals(themas, nowThemas)){
      alert("변경사항이 없습니다.")
   }
   else{ // 변경사항이 있을 때
      const newMemberThema = nowThemas.join(",,");
      memberThema = newMemberThema;
      const data = {
         "newMemberThema" : newMemberThema,
         "loginMemberNo" : loginMemberNo
      };

      fetch("/chatting/updateThema", {
         method : "POST",
         headers : {"Content-Type" : "application/json"},
         body : JSON.stringify(data)
      })
      .then(resp => resp.text())
      .then(chattingNo => {
         
         
      })
      .catch(err => console.log(err));
   }
})