// 팔로우, 언팔로우 버튼 토글

// 팔로우 버튼
const followBtn = document.getElementById("follow-btn");

// 언팔로우 버튼
const followingBtn = document.getElementById("following-btn");

// /* 팔로우, 언팔로우 버튼 호버 시 아이콘 색 변경 */
$(document).ready(function() {
    $('#follow-btn').hover(function() {
        $('.whiteChk2').show();
        $('.blueChk2').hide();
    }, function() {
        $('.whiteChk2').hide();
        $('.blueChk2').show();
    })
});

$(document).ready(function() {
    $('#following-btn').hover(function() {
        $('.whiteChk').hide();
        $('.blueChk').show();
    }, function() {
        $('.whiteChk').show();
        $('.blueChk').hide();
    })
});

const data = {
    "boardMemberNo" : boardMemberNo,
    "loginMemberNo" : loginMemberNo
}

// 팔로우
if(followBtn != null){
    followBtn.addEventListener("click", (e) =>{

        fetch("/board/3/follow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(resp => resp.text())
        .then(result => {

            if(result == -1){
                console.log("처리 실패");
                return;
            } else {
                console.log("처리 성공")
                selectFollowCount();
            }

        })
        .catch(err => console.log(err))
    })
}

// 언팔로우
if(followingBtn != null){
    followingBtn.addEventListener("click", () => {
    
        fetch("/board/3/unfollow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(resp => resp.text())
        .then(result => {
            
            if(result == -1){
                console.log("처리 실패");
                return;
            } else {
                console.log("처리 성공");
                selectFollowCount()
            }
        })
        .catch(err => console.log(err))
    })
}
// --------------------------------------------------------------------------------
// 좋아요 버튼 이벤트
var check_status = false;
var like_cnt = $("#like-cnt");
var like_parent = $(".board-like");

var divToUseAsReference = $("#board-area");
var referencePosition = divToUseAsReference.offset();
var referenceHeight = divToUseAsReference.height();

var likeCntPosition = {
    top: referencePosition.top + referenceHeight - parseInt(like_cnt.css('margin-bottom')),
    left: like_cnt.offset().left - referencePosition.left
}

var burst = new mojs.Burst({
    top: likeCntPosition,
    left: likeCntPosition,
    parent: like_parent,
    radius:   { 20: 60 },
    count: 15,
    angle:{0:30},
    children: {
      delay: 250,
      duration: 700,
      radius:{10: 0},
      fill:   [ '#99E1ED' ],
      easing:     mojs.easing.bezier(.08,.69,.39,.97)
    }
});

document.getElementById("like-cnt").addEventListener("click", e => {

    if(loginMemberNo == ""){
        alert("로그인 후 이용해 주세요.");
        return;
    }

    let check;

    var t1 = new TimelineLite();
    var t2 = new TimelineLite();

    // 좋아요 버튼이 눌리지 않은 상태
    if(!check_status){
        like_cnt.css('background-color', '#ddd');
        check_status=true;
        check = 1;
    }

    // 좋아요 버튼이 눌린 상태
    else{
        t1.set(like_cnt, {scale:0});
        t1.set('.like-btn', {scale: 0});
        t1.to(like_cnt, 0.6, {scale:1, background: '#99E1ED',ease: Expo.easeOut});
        t2.to('.like-btn', 0.65, {scale: 1, ease: Elastic.easeOut.config(1, 0.3)}, '+=0.2');
        burst.replay();

        check_status=false;
        check = 0;
    }

    const data = {
        "boardNo" : boardNo,
        "memberNo" : loginMemberNo,
        "check" : check
    };

    fetch("/board/2/like", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(count => {

        if(count == -1){
            console.log("좋아요 처리 실패");
            return;
        }

    document.getElementsByClassName("likeCount")[0].innerHTML = count;

    })
    .catch(err => console.log(err))

})

// -------------------------------------------------------------------------------
//자 ToDOList 다시 해 보자,,,,,,
var today = new Date();
const todayYear = today.getFullYear();
const todayMonth = today.getMonth()+1;
const todayDate = today.getDate();
//오늘 날짜
var sysDate = todayYear + "-" + (todayMonth < 10 ? "0" : "") + todayMonth + "-" + (todayDate < 10 ? "0" : "") + todayDate;
if(loginMemberNo == ""){
    const div = document.createElement("div");
    div.innerText="로그인 후 나만의 ToDoList를 득근해보세요💪"
    div.style.fontWeight="bold"
    document.querySelector(".check-area").append(div);

}

document.addEventListener("click", function (e){
    if(e.target.classList.contains("addListBtn")){
       
        const addListInput = document.querySelector(".addList");
        const addListVal = addListInput.value.trim(); // 입력 값의 양 끝 공백을 제거합니다.
    
        const reqExp =/^(?=.*[\s가-힣A-Za-z]).{1,15}$/;
    
        const maxCheckboxes = 10;
        const currentCheckboxes = document.querySelectorAll(".checkbox").length;
        
        todoslist(sysDate);

        if(loginMemberNo == ""){
            Swal.fire({

                title : '로그인 후 이용해 주세요💪', 
                icon : 'error'
            })
            return;
        }
    
        if(addListVal.length == 0 ){
            Swal.fire({

                title : "내용을 입력해주세요👀", 
                icon : 'error'
            })
            return;
        }else{
    
            let spanContent = document.querySelectorAll('.check-area > div >span');
            
            for(let i of spanContent){
                if(addListVal == i.innerText){
                    Swal.fire({

                        title : "이미 입력한 루틴입니다.😊", 
                        icon : 'error'
                    })
                    addListInput.value = "";
                    return;
                }
                
            }
    
    
            if(currentCheckboxes >= maxCheckboxes){
                Swal.fire({

                    title :"10개 이상 입력할 수 없습니다. 😢", 
                    icon : 'error'
                })
                addListInput.value = "";
                return; // 입력 막기
            }else{
        
                if (!reqExp.test(addListVal)) {
                    Swal.fire({

                        title :"올바른 형식으로 입력해주세요💗", 
                        text: '15글자 이하로 입력해주세요',
                        icon : 'error'
                    })
                    addListInput.focus();
                        
                    return;;
                } else {
                    const inputTodo = {listContent: addListVal , lcreateDt : sysDate, memberNo : loginMemberNo}
                    insertTodo(inputTodo)
                  
            
                }
            }
        }

    }
})

document.querySelector(".addList").addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {
        const addListInput = document.querySelector(".addList");
        const addListVal = addListInput.value.trim(); // 입력 값의 양 끝 공백을 제거합니다.
    
        const reqExp =/^(?=.*[\s가-힣A-Za-z]).{1,15}$/;
    
        const maxCheckboxes = 10;
        const currentCheckboxes = document.querySelectorAll(".checkbox").length;
        
        todoslist(sysDate);

        if(loginMemberNo == ""){
            alert("로그인 후 이용해 주세요💪");
            return;
        }
    
        if(addListVal.length == 0 ){
            alert("내용을 입력해주세요👀");
            return;
        }else{
    
            let spanContent = document.querySelectorAll('.check-area > div >span');
            
            for(let i of spanContent){
                if(addListVal == i.innerText){
                    Swal.fire({

                        title : "이미 입력한 루틴입니다.😊", 
                        icon : 'error'
                    })
                    addListInput.value = "";
                    return;
                }
                
            }
    
    
            if(currentCheckboxes >= maxCheckboxes){
                Swal.fire({

                    title :"10개 이상 입력할 수 없습니다. 😢", 
                    icon : 'error'
                })
                addListInput.value = "";
                return; // 입력 막기
            }else{
        
                if (!reqExp.test(addListVal)) {
                    Swal.fire({

                        title :"올바른 형식으로 입력해주세요💗", 
                        text: '15글자 이하로 입력해주세요',
                        icon : 'error'
                    })
                    
                    addListInput.focus();
                    
                    return;
                } else {
                    const inputTodo = {listContent: addListVal , lcreateDt : sysDate, memberNo : loginMemberNo}
                    insertTodo(inputTodo)
                  
            
                }
            }
        }

    }
});



document.addEventListener("click", (e)=>{

    if(e.target.classList.contains("boardAddListBtn")){
        const add = e.target.parentElement.querySelector("span").innerText;
    
        let spanContent = document.querySelectorAll('.check-area > div >span');
           
            for(let i of spanContent){
                if(add == i.innerText){

                    Swal.fire({
    
                        title : "이미 입력한 루틴입니다.😊", 
                        icon : 'error'
                    })
                    return;
                }
                
            }
        const addTodo = {listContent:  add , lcreateDt : sysDate, memberNo : loginMemberNo}
        insertTodo(addTodo)
    }


})

function insertTodo(insertTodo){
    fetch("/todo/insert",{
        method : "POST", 
        headers: {"Content-Type": "application/json"},  
        body : JSON.stringify( insertTodo ) })
    .then( resp => resp.text())
    .then(result =>{
        if(result > 0){
            console.log("추가완료!")
            
            const addListInput = document.querySelector(".addList");
            addListInput.value="";
            
            location.reload(true);
            updateCheckedPercentage();

        }else{
            console.log("투두 추가시 오류발생")
        }

    })
    .catch(err => console.log(err + "투두 오류 발생"))
}






function todoslist(sysDate){
    // ajax을 할 예정
    if( loginMemberNo != ""){

        $.ajax({
            url: "/todoDetaile",
            method: "POST",
            data: { "choiceTodoDate": sysDate },
            dataType: "JSON",
            success: function (detailedTodoList) {
                // console.log('날짜 선택 성공');

                document.querySelector(".check-area").innerHTML="";
                for(let todo of detailedTodoList){
                    const DateDIV = document.createElement("div");
                    DateDIV.innerHTML=todo.lcreateDt;

                    // 새로운 div 요소 생성
                    const div = document.createElement("div");

                    // 체크 상세의 번호를 담은 input type = heddin
                    const input2 = document.createElement("input");
                    input2.setAttribute("type" , "hidden");
                    input2.value = todo.listNo;
                    input2.classList.add("list_no");
                
            
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
                    button.classList.add("minusBtn");
                    button.innerText="-";
                

                    const input3 = document.createElement("input")
                    input3.setAttribute("type", "hidden");
                    input3.classList.add("lcreateDt");
                    input3.value = todo.lcreateDt;

                    // 각 요소를 div에 추가
                    // div.append(DateDIV)
                    div.appendChild(input);
                    div.appendChild(label);
                    div.appendChild(span);
                    div.appendChild(button);
                    div.appendChild(input2);
                    div.append(input3)
            
                    // div를 원하는 위치에 추가
                    
                    // document.querySelector(".check-area").append(DateDIV);
                    document.querySelector(".check-area").append(div);
            
                    // initializeTodoList(choiceTodoDate);
                    updateCheckedPercentage();
                    
                }
                
                if(detailedTodoList == ""){
                    const none =document.createElement("div");
                    none.innerHTML="운동계획이 비어있어요!<br> 계획를 세워 득근해보세요💪";
                    none.style.fontWeight="bold"                    

                    document.querySelector(".check-area").append(none);
                }
            },
            error: function(){
                 console.log('실패')
            }
        })

    }
}

// 랜덤 아이디 생성 함수
function generateRandomId() {
    return Math.random().toString(36).substring(2, 10);
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

    
    const checkedPercentage = (checkedCount / totalCheckboxes) * 100;

    if (checkedCount === 0) {
        progressNum.style.width = "0%";
    } else {
        progressNum.style.width = `${checkedPercentage}%`;
    }
}

window.onload = () => { 
    todoslist(sysDate)
    selectFollowCount();

}


// 팔로잉, 팔로워 수 조회
const followingCountArea = document.getElementById("following-count-area");
const followerCountArea = document.getElementById("follower-count-area");

function selectFollowCount(){

    fetch("/myPage/followingFollower/selectFollowCount", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify({"memberNo" : boardMemberNo})
    })
    .then(resp => resp.json())
    .then(map => {

        const followingCount = map.followingTotalCount;
        const followerCount = map.followerTotalCount;

        followingCountArea.innerHTML = followingCount;
        followerCountArea.innerHTML = followerCount;

    })
    .catch(err => console.log(err))

}

function todoslist(sysDate){
    // ajax을 할 예정
    if( loginMemberNo != ""){

        $.ajax({
            url: "/todoDetaile",
            method: "POST",
            data: { "choiceTodoDate": sysDate },
            dataType: "JSON",
            success: function (detailedTodoList) {
                // console.log('날짜 선택 성공');

                document.querySelector(".check-area").innerHTML="";
                for(let todo of detailedTodoList){
                    const DateDIV = document.createElement("div");
                    DateDIV.innerHTML=todo.lcreateDt;

                    // 새로운 div 요소 생성
                    const div = document.createElement("div");

                    // 체크 상세의 번호를 담은 input type = heddin
                    const input2 = document.createElement("input");
                    input2.setAttribute("type" , "hidden");
                    input2.value = todo.listNo;
                    input2.classList.add("list_no");
                
            
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
                    button.classList.add("minusBtn");
                    button.innerText="-";
                

                    const input3 = document.createElement("input")
                    input3.setAttribute("type", "hidden");
                    input3.classList.add("lcreateDt");
                    input3.value = todo.lcreateDt;

                    // 각 요소를 div에 추가
                    // div.append(DateDIV)
                    div.appendChild(input);
                    div.appendChild(label);
                    div.appendChild(span);
                    div.appendChild(button);
                    div.appendChild(input2);
                    div.append(input3)
            
                    // div를 원하는 위치에 추가
                    
                    // document.querySelector(".check-area").append(DateDIV);
                    document.querySelector(".check-area").append(div);
            
                    // initializeTodoList(choiceTodoDate);
                    updateCheckedPercentage();
                    
                }
                
                if(detailedTodoList == ""){
                    const none =document.createElement("div");
                    none.innerHTML="운동계획이 비어있어요!<br> 계획를 세워 득근해보세요💪";
                    none.classList.add("guest");
                    none.style.fontSize="19px"

                    document.querySelector(".check-area").append(none);
                }
            },
            error: function(){
                // console.log('날짜 선택 실패')
            }
        })

    }
}


document.addEventListener('click', (e) => {
    const target = e.target;

    if (target.classList.contains("checkbox")) {
        const chDate =target.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
        
        updateTodo(target,target.checked, chDate.value );
        updateCheckedPercentage();
        //console.log(target)
    }
})



function updateTodo(checkbox,listFl,sysDate ) {

    // 체크 상태 저장 변수
    const completed = listFl;
    console.log(listFl)
    const ListNo = checkbox.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.value

    console.log(ListNo)        
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
           
            checkbox.nextElementSibling.nextElementSibling.classList.toggle("complete")
            console.log("성공")
            const checkboxes = document.querySelectorAll(".checkbox");
            let checkedCount = 0;
    
            const todayYear = today.getFullYear();
            const todayMonth = today.getMonth()+1;
            const todayDate = today.getDate();
            
            //오늘 날짜
            const sysDate = todayYear + "-" + (todayMonth < 10 ? "0" : "") + todayMonth + "-" + (todayDate < 10 ? "0" : "") + todayDate;

            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    checkedCount++;
                }
            });

            if(checkedCount == checkboxes.length) {
                fetch("/todo/allCompleted?date=" + sysDate )
                .then(resp => resp.text())
                .then(result=>{
                    //console.log(result)
                    if(result > 0){
                        Swal.fire({

                            title : "축하합니다🥳 목표를 득근하셨어요!", 
                            icon : 'success'
                        })
                        
                    }else{
                        console.log("실패ㅜㅜㅜ")
                    }
                })
                .catch( e=> console.log(e) )
            }else{

                fetch("/todo/unfinished?date=" + sysDate )
                .then(resp => resp.text())
                .then(result=>{
                    if(result == 0){
                    
                        console.log("실패ㅜㅜㅜ")
                    }
                })
                .catch( e=> console.log(e) )
            }
            

        } else {
            console.log('업데이트 실패ㅜㅜ');
        }
    })
    .catch(e => console.log(e));
}


document.addEventListener("click", function (e){
    
    if(e.target.classList.contains("minusBtn")){
        console.log(e.target)

        const todoNo = e.target.nextElementSibling.value;
        $.ajax({
            url: "/todo/delete",
            method: "POST",
            data: { "todoNo": todoNo },
            dataType: "JSON",
            success: function (result) {
                if(result > 0){
                    
                    e.target.parentElement.remove();

                    const checkboxes = document.querySelectorAll(".checkbox");
                    let checkedCount = 0;

                    checkboxes.forEach(checkbox => {
                        if (checkbox.checked) {
                            checkedCount++;
                        }
                    });
                    const todayYear = today.getFullYear();
                    const todayMonth = today.getMonth()+1;
                    const todayDate = today.getDate();
                    //오늘 날짜
                    const sysDate = todayYear + "-" + (todayMonth < 10 ? "0" : "") + todayMonth + "-" + (todayDate < 10 ? "0" : "") + todayDate;

                    if(checkedCount == checkboxes.length && checkboxes.length != 0) {
                        //console.log(choiceTodoDate)
                        fetch("/todo/allCompleted?date=" + sysDate )
                        .then(resp => resp.text())
                        .then(result=>{
                            if(result > 0){


                                Swal.fire({

                                    title : "축하합니다🥳 목표를 득근하셨어요!", 
                                    icon : 'success'
                                })


                            }else{
                                console.log("실패ㅜㅜㅜ")
                            }
                        })
                        .catch( e=> console.log(e) )
                    }else{
                        fetch("/todo/unfinished?date=" + sysDate )
                        .then(resp => resp.text())
                        .then(result=>{
                            if(result == 0){
                            
                                console.log("실패ㅜㅜㅜ")
                            }
                        })
                        .catch( e=> console.log(e) )
                    }

                    updateCheckedPercentage();

                }else{
                    console.log("투두 삭제 실패");
                }
            },
            error: function(){
                console.log("에러")
            }
        })

    }
});


// -------------------------------------------------------------------------------

// 게시글 수정 버튼 클릭 시

const updateBtn = document.getElementById("updateBtn");
if(updateBtn != null){

    updateBtn.addEventListener("click", ()=>{
    
        location.href
                = location.pathname.replace("board", "board2")
                + "/update"
                + location.search;
    })
}

// -------------------------------------------------------------------------------

// 게시글 삭제 버튼 클릭 시

const deleteBtn = document.getElementById("deleteBtn");
if(deleteBtn != null){
    
    deleteBtn.addEventListener("click", () => {

        Swal.fire({
            title: '정말 삭제하시겠습니까?',
            text: '삭제된 글은 다시 되돌릴 수 없습니다.',
            icon: 'warning',
            
            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정
            
            reverseButtons: false, // 버튼 순서 거꾸로
            
        }).then(result => {

            if (result.isConfirmed) {

                Swal.fire({
                    icon: 'success',
                    title: '게시글이 삭제되었습니다.',
                }).then(()=>{

                    location.href
                    = location.pathname.replace("board","board2")
                        + "/delete";
                        + location.search;
                })
            }
        });
    })
}

// -------------------------------------------------------------------------------

// 목록으로

const goToListBtn = document.getElementById("goToListBtn");

goToListBtn.addEventListener("click", ()=>{

    let url = "/board/2/list";

    const params = new URL(location.href).searchParams;

    let cp;
    if(params.get("cp") != null){ // 쿼리스트링에 cp가 있을 경우
        cp = "?cp=" + params.get("cp");
    } else {
        cp = "?cp=1";
    }

    url += cp;

    if(params.get("key") != null){
        const key = "&key=" + params.get("key");
        const query = "&query=" + params.get("query");

        url += key + query;
    }

    location.href = url;

})



//------------------------------------------------------------
/* 카카오톡 공유하기 */
function shareMessage() {
    Kakao.Share.sendCustom({
        templateId: 98809,
        templateArgs: {
            PROFILE : profile, // 작성자 프로필 이미지 주소 ${PROFILE}
            NICKNAME : nickname,    // 작성자 닉네임 ${NICKNAME}
            TITLE: title, // 제목 텍스트 ${TITLE}
            CONTENT: content, // 설명 텍스트 ${CONTENT}
            PATH: 'board/3/' + boardNo // 자유게시판 상세 게시글 주소
        },
    });
}
