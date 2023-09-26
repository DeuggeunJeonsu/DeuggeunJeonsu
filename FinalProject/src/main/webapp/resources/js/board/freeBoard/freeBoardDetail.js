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
                return;
            } else {
                location.reload();
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
                return;
            } else {
                location.reload();
            }
        })
        .catch(err => console.log(err))
    })
}


// --------------------------------------------------------------------------------

// 좋아요 버튼 이벤트
var check_status = false; // 좋아요 상태를 나타내는 변수
var like_cnt = $("#like-cnt");
var like_parent = $(".board-like");

var divToUseAsReference = $("#board-content-area");
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

        Swal.fire({
            icon: 'error',                     
            title: '로그인 후 이용해 주세요.',    
            text: '', 
          });

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
    
    fetch("/board/3/like", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(count => {
    
        if(count == -1){
            return;
        }

    document.getElementsByClassName("likeCount")[0].innerHTML = count;
    
    })
    .catch(err => console.log(err))
    
})

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

    let url = "/board/3/list";

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

/* ------------------------------------------------------------------------------------------- */

/* 카카오톡 공유하기 */
function shareMessage() {
    Kakao.Share.sendCustom({
        templateId: 98875,
        templateArgs: {
            PROFILE : profile, // 작성자 프로필 이미지 주소 ${PROFILE}
            NICKNAME : nickname,    // 작성자 닉네임 ${NICKNAME}
            TITLE: title, // 제목 텍스트 ${TITLE}
            CONTENT: content, // 설명 텍스트 ${CONTENT}
            PATH: 'board/3/' + boardNo // 자유게시판 상세 게시글 주소
        },
    });
}