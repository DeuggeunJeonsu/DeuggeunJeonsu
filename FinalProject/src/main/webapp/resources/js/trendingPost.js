// 메뉴 클릭 시 이동하는 효과
$(".trending-all").click(function() {
    $(".trending-all").addClass("active");
    $(".trending-all > .icon").addClass("active");
    $(".trending-info").removeClass("active");
    $(".trending-routine").removeClass("active");
    $(".trending-free").removeClass("active");
    $(".trending-info > .icon").removeClass("active");
    $(".trending-routine > .icon").removeClass("active");
    $(".trending-free > .icon").removeClass("active");
    $("#line").addClass("one");
    $("#line").removeClass("two");
    $("#line").removeClass("three");
    $("#line").removeClass("four");
})
  
$(".trending-info").click(function() {
    $(".trending-info").addClass("active");
    $(".trending-info > .icon").addClass("active");
    $(".trending-all").removeClass("active");
    $(".trending-routine").removeClass("active");
    $(".trending-free").removeClass("active");
    $(".trending-all > .icon").removeClass("active");
    $(".trending-routine > .icon").removeClass("active");
    $(".trending-free > .icon").removeClass("active");
    $("#line").addClass("two");
    $("#line").removeClass("one");
    $("#line").removeClass("three");
    $("#line").removeClass("four");
})
  
$(".trending-routine").click(function() {
    $(".trending-routine").addClass("active");
    $(".trending-routine > .icon").addClass("active");
    $(".trending-info").removeClass("active");
    $(".trending-all").removeClass("active");
    $(".trending-free").removeClass("active");
    $(".trending-info > .icon").removeClass("active");
    $(".trending-all > .icon").removeClass("active");
    $(".trending-free > .icon").removeClass("active");
    $("#line").addClass("three");
    $("#line").removeClass("two");
    $("#line").removeClass("one");
    $("#line").removeClass("four");
})
  
$(".trending-free").click(function() {
    $(".trending-free").addClass("active");
    $(".trending-free > .icon").addClass("active");
    $(".trending-info").removeClass("active");
    $(".trending-routine").removeClass("active");
    $(".trending-all").removeClass("active");
    $(".trending-info > .icon").removeClass("active");
    $(".trending-routine > .icon").removeClass("active");
    $(".trending-all > .icon").removeClass("active");
    $("#line").addClass("four");
    $("#line").removeClass("two");
    $("#line").removeClass("three");
    $("#line").removeClass("one");
})
  
$(".trending-all").click(function() {
    $("#first").addClass("active");
    $("#second").removeClass("active");
    $("#third").removeClass("active");
    $("#fourth").removeClass("active");
})
  
$(".trending-info").click(function() {
    $("#first").removeClass("active");
    $("#second").addClass("active");
    $("#third").removeClass("active");
    $("#fourth").removeClass("active");
})
  
$(".trending-routine").click(function() {
    $("#first").removeClass("active");
    $("#second").removeClass("active");
    $("#third").addClass("active");
    $("#fourth").removeClass("active");
})
  
$(".trending-free").click(function() {
    $("#first").removeClass("active");
    $("#second").removeClass("active");
    $("#third").removeClass("active");
    $("#fourth").addClass("active");
})

// --------------------------------------------------------------------------

/* ajax로 게시글 목록 조회 */

/* 왼쪽 사이드 메뉴 버튼 얻어오기 */
const trendingAll = document.getElementsByClassName("trending-all")[0];
const first = document.getElementById("first");

const trendingInfo = document.getElementsByClassName("trending-info")[0];
const second = document.getElementById("second");

const trendingRoutine = document.getElementsByClassName("trending-routine")[0];
const third = document.getElementById("third");

const trendingFree = document.getElementsByClassName("trending-free")[0];
const fourth = document.getElementById("fourth");

// 1. 전체 게시글 인기글 조회
trendingAll.addEventListener("click", ()=>{
    fetch("/trendingAll")
    .then(resp => resp.text())
    .then(result => {

        first.innerText = "";

        if(result != null){

            const board = JSON.parse(result);
    
            const boardNo = board.boardNo;
            const boardCode = board.boardCode;
            const boardTitle = board.boardTitle;
            const memberNickname = board.memberNickname;
            const commentCount = board.commentCount;
            const likeCount = board.likeCount;
            const originalThumbnail = board.thumbnail.replace("^^^", ",");

            // console.log("thumbnail : "+thumbnail1)
            const style = originalThumbnail.substr(originalThumbnail.indexOf("style=")+7)
            const dataFilename= originalThumbnail.substr(originalThumbnail.indexOf("data-filename=")+15);
            
            const fileName = dataFilename.replace('" style="width: 828px',"");
            const thumbnail = originalThumbnail.replace('" data-filename="img.png" style="width: 828px;', "");

            // <a> 요소를 생성합니다.
            const newA = document.createElement("a");
            newA.setAttribute("href", "/board/"+boardCode+"/"+boardNo);
    
            // <div> 요소 (trending-board-select)를 생성합니다.
            const newTrendingDiv = document.createElement("div");
            newTrendingDiv.classList.add("trending-board-select");
    
            // 이미지 요소를 생성하고 설정합니다.
            const newImg = document.createElement("img");
            newImg.setAttribute("src", thumbnail);
            newImg.setAttribute("data-filename", fileName);
            newImg.setAttribute("style", style);
            newImg.classList.add("trending-img");
    
            // trending-writer-info <div> 요소를 생성합니다.
            const newWriterInfoDiv = document.createElement("div");
            
    
            // 내부 <div> 요소를 생성합니다.
            const innerDiv1 = document.createElement("div");
            const innerDiv2 = document.createElement("div");
            innerDiv2.classList.add("trending-writer-info");
    
            // 첫 번째 <span> 요소 생성 및 설정 (fa-comment 아이콘과 텍스트)
            const span1 = document.createElement("span");
            const i1 = document.createElement("i");
            i1.classList.add("fa-regular", "fa-comment", "fa-xs");
            i1.setAttribute("style", "color: #99e1ed;")
            const commentCountText = document.createTextNode(commentCount);
            span1.appendChild(i1);
            span1.appendChild(commentCountText);
            
            // 두 번째 <span> 요소 생성 및 설정 (fa-heart 아이콘과 텍스트)
            const span2 = document.createElement("span");
            const i2 = document.createElement("i");
            i2.classList.add("fa-regular", "fa-heart", "fa-xs");
            i2.setAttribute("style", "color: #99e1ed;")
            const likeCountText = document.createTextNode(likeCount);
            span2.appendChild(i2);
            span2.appendChild(likeCountText);

            // by. 득근이를 나타내는 <div> 요소 생성 및 설정
            const authorDiv = document.createElement("div");
            authorDiv.innerText = "by. " + memberNickname;
    
            // 게시글 제목을 나타내는 <h1> 요소 생성 및 설정
            const h1 = document.createElement("h1");
            h1.innerText = boardTitle;

            // 요소를 계층 구조에 추가합니다.
            innerDiv1.appendChild(span1);
            innerDiv1.appendChild(span2);
            innerDiv2.appendChild(innerDiv1);
            innerDiv2.appendChild(authorDiv);
            newWriterInfoDiv.appendChild(innerDiv2);
            newTrendingDiv.appendChild(newImg);
            newTrendingDiv.appendChild(newWriterInfoDiv);
            newTrendingDiv.appendChild(h1);
            newA.appendChild(newTrendingDiv);
    
            first.appendChild(newA);

        } else {
            const div = document.createElement("div");
            div.innerHTML = "<h1>아직 인기글이 없습니다.</h1>"

            first.appendChild(div);
        }

    })
    .catch(err=>console.log(err))
})

// 2. 정보 공유 인기글 조회
trendingInfo.addEventListener("click", ()=>{
    fetch("trendingInfo")
    .then(resp => resp.json())
    .then(board => {


        

    })
    .catch(err=>console.log(err))
})

// 3. 루틴 공유 인기글 조회
trendingRoutine.addEventListener("click", ()=>{
    fetch("/trendingRoutine")
    .then(resp => resp.json())
    .then(result => {
        
    })
    .catch(err=>console.log(err))
})

// 4. 자유 게시판 인기글 조회
trendingFree.addEventListener("click", ()=>{
    fetch("/trendingFree")
    .then(resp => resp.json())
    .then(result => {
        
    })
    .catch(err=>console.log(err))
})