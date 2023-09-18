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
    
    fetch("/board/4/like", {
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


const ncUpdate = document.getElementById("ncUpdate");
const ncDelete = document.getElementById("ncDelete");

function boardUpdate(){

    // 수정 버튼 클릭 시
    ncUpdate.addEventListener("click", () => {
    
        location.href = location.pathname 
        + "/update"
        + location.search;
    
        
    })

    return confirm("게시글을 수정하시겠습니까?");
}


function boardDelete(){

    ncDelete.addEventListener("click", () => {

        location.href = location.pathname 
        + "/delete"
        + location.search;

    })

    return confirm("게시글을 삭제하시겠습니까?");

}

const listbtn = document.getElementById("listbtn2");

/* 목록으로 가기 버튼 클릭 시 */
listbtn.addEventListener("click", () => {

       // 이동할 주소 저장
       let url = "/board/" + 4  + "/list"; 

       // URL 내장 객체 : 주소 관련 정보를 나타내는 객체
       // URL.searchParams : 쿼리스트링만 별도 객체로 반환
   
       const params = new URL(location.href).searchParams;
   
       let cp;
       if(params.get("cp") != ""){ // 쿼리스트링에 cp가 있을 경우
           cp = "?cp=" + params.get("cp");
       }else{
           cp= "?cp=1"
       }
   
       // 조립
       url += cp;
   
       // 검색 key, query가 존재하는 경우 url에 추가
       if(params.get("searchTitle") != null){
           const searchTitle = "&searchTitle=" + params.get("searchTitle");
   
           url +=  searchTitle; // url 뒤에 붙이기
       }
   
       // location.href = "주소"; -> 해당 주소로 이동
       location.href = url;

})
