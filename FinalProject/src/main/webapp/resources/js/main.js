// 채팅 카운트 최신화
let chattingCount;
//let chattingCountIsRunning = false; 
//if (chattingCountIsRunning) clearInterval(chattingCount); // 실행중이면 초기화

// 로그인 후 채팅아이콘이 존재 할 때만
if($('#chatting-count').length){
    console.log("채팅아이콘 존재");
    realTimeUpdates();
}
else console.log("채팅아이콘 없음");

function realTimeUpdates(){
    chattingCount = setInterval(function () {
        $.ajax({
            type: "GET",
            url: "/chattingCount",
            dataType: "text",
            success: function(response) {
                if (parseInt(response) > 0) {
                    $('#chatting-count').text(response).show();
                } else {
                    $('#chatting-count').hide();
                }
            },
            error: function(error) {
                console.error("데이터 가져오기 오류: ", error);
            }
        });
    }, 1000);
    //chattingCountIsRunning = true;
}

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
    
    $(".schedule-scroll").click(function() {
    // .tdl-btnArea 요소의 위치(offset)를 가져옵니다.
    var tdlBtnAreaPosition = $("#schedule-area").offset().top - 130;

    // 화면을 tdlBtnArea의 위치로 스크롤합니다.
    $("html, body").animate({ scrollTop: tdlBtnAreaPosition }, 600); // 500은 스크롤 애니메이션의 속도(ms)를 나타냅니다. 필요에 따라 조절하세요.
});

});


const adminPageBtn = document.getElementById("adminPage");
const logoutBtn = document.getElementById("logoutBtn");


$(document).ready(function() {
    setTimeout(function() {
        $("#loading").fadeOut();
    }, 1500);
});


(() => {

    if(adminPageBtn != null){

        logoutBtn.style.borderBottomLeftRadius = "0px";
        logoutBtn.style.borderBottomRightRadius = "0px";
        logoutBtn.style.borderBottom = "1px solid #ccc";


        adminPageBtn.style.borderTopLeftRadius = "0px";
        adminPageBtn.style.borderTopRightRadius = "0px";

    }


})();

// 페이지가 준비되면 장바구니 수량 업데이트 함수를 호출
$(document).ready(function() {
    updateShoppingCount();
});

function updateShoppingCount() {
    const url = "/shoppingCount";
    $.ajax({
        type: "GET",
        url: url,
        dataType: "text",
        success: function(response) {
            if (parseInt(response) > 0) {
                $('#shopping-count').text(response).show();
            } else {
                $('#shopping-count').hide();
            }
        },
        error: function(error) {
            console.error("데이터 가져오기 오류: ", error);
        }
    });
}












