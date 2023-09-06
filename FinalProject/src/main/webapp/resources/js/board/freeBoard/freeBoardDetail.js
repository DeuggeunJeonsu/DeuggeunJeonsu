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

// 좋아요 하트 토글
const unlike = document.getElementsByClassName("unlike")[0];
const like = document.getElementsByClassName("like")[0];

unlike.addEventListener("click", ()=>{
    unlike.style.display = "none";
    like.style.display = "block";
})

like.addEventListener("click", ()=>{
    unlike.style.display = "block";
    like.style.display = "none";
})