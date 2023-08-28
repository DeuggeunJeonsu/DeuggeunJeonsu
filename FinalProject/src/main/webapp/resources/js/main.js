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

    $(window).scroll(function(e) {
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            didScroll = false;
            hasScrolled();
        }
    }, 250);

    const log01 = document.querySelector(".log01");  
    const log02 = document.querySelector(".log02"); //스크롤내렸을 때 보이게 될 로고
    const mainPage = document.querySelector("[name='mainPage']");

    // 스크롤 내렸을 때 배경 색 보이기

    if(mainPage.value == "mainPage"){

        function hasScrolled() {
    
            var scrollTop = $(window).scrollTop();
            if (scrollTop === 0) {
                //배경 변화
                headerNav.classList.add("no-background");
                headerNav.classList.remove("nav-container-bg");
    
                // 로고 변화
                log02.classList.remove("log-disply");
                log01.classList.add("log-disply");
                return;
            } else {
                headerNav.classList.remove("no-background");
                headerNav.classList.add("nav-container-bg")
    
                log02.classList.add("log-disply");
                log01.classList.remove("log-disply");
                return;
            }
        }
        
    } else {

        headerNav.classList.add("nav-sticky");

        log02.classList.add("log-disply");
        log01.classList.remove("log-disply");

        return;

    }

});
// *********************메인페이지*******************************

// 메인페이지 동영상 컨트롤바 제거
$(document).ready(function(){
    if( document.querySelector('.home video') != null){

        // JavaScript 방법으로 컨트롤 숨기기
        const videoElement = document.querySelector('.home video');
        videoElement.controls = false;
    }
});