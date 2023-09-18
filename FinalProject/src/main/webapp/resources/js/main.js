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

(() => {

    if(adminPageBtn != null){

        logoutBtn.style.borderBottomLeftRadius = "0px";
        logoutBtn.style.borderBottomRightRadius = "0px";
        logoutBtn.style.borderBottom = "1px solid #ccc";


        adminPageBtn.style.borderTopLeftRadius = "0px";
        adminPageBtn.style.borderTopRightRadius = "0px";

    }


})();











