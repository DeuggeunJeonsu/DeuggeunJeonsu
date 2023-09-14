// 팔로잉, 언팔로우 버튼 토글
const followingBtn = document.getElementById("following-btn");
const followBtn = document.getElementById("follow-btn");

followingBtn.addEventListener("click", ()=>{
    followingBtn.style.display = "none";
    followBtn.style.display = "block";
})

followBtn.addEventListener("click", ()=>{
    followBtn.style.display = "none";
    followingBtn.style.display = "block";
})

/* 팔로우, 언팔로우 버튼 호버 시 아이콘 색 변경 */
$(document).ready(function() {
    $('#follow-btn').hover(function() {
        $('.whiteChk2').show();
        $('.blueChk2').hide();
    }, function() {
        $('.whiteChk2').hide();
        $('.blueChk2').show();
    });
});

$(document).ready(function() {
    $('#following-btn').hover(function() {
        $('.whiteChk').hide();
        $('.blueChk').show();
    }, function() {
        $('.whiteChk').show();
        $('.blueChk').hide();
    });
});

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
    
    fetch("/board/3/like", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(count => {
        
        console.log("count : " + count);
    
        if(count == -1){
            console.log("좋아요 처리 실패");
            return;
        }

    document.getElementsByClassName("likeCount")[0].innerHTML = count;
    
    })
    .catch(err => console.log(err))
    
})

// -------------------------------------------------------------------------------
