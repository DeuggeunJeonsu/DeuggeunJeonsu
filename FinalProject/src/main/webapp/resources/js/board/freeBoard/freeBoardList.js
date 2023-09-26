// 게시판 상세 검색

const boardSearch = document.getElementById("boardSearch");
const searchQuery = document.getElementById("searchQuery");

(()=>{

    const params = new URL(location.href).searchParams;

    const key = params.get("key");

    const query = params.get("query");

    if(key != null){
        searchQuery.value = query;
    }

})();

// 검색어 길이 제한
searchQuery.addEventListener("change", e=>{

    if(e.target.value.trim().length > 10){

        Swal.fire({
            icon: 'error',                     
            title: '검색어는 열 글자까지<br>입력 가능합니다.',    
            text: '', 
          });
        
        e.target.value = '';
    }

});

// 폼 태그가 제출될 때
boardSearch.addEventListener("submit", e=>{

    if(searchQuery.value.trim().length == 0){
        e.preventDefault();

        location.href = location.pathname;
    }

});

// 해시태그 클릭 시 삭제 이벤트 추가
const hashtag = document.getElementsByClassName("hashtag")[0];

if(hashtag != null){
    hashtag.addEventListener("click", () => {
        hashtag.remove();
        location.href = "/board/3/list";
    });
}

/* ------------------------------------------------------------------------------------------- */

//선택자
const sliderWrap = document.querySelector(".slider__wrap");
const sliderImg = sliderWrap.querySelector(".slider__img");         //보여지는 영역
const sliderInner = sliderWrap.querySelector(".slider__inner");     //움직이는 영역
const slider = sliderWrap.querySelectorAll(".slider");              //개별 이미지

let currentIndex = 0;                                               //현재 보이는 이미지
let sliderCount = slider.length;                                    //이미지 갯수
let sliderInterval = 5000;                                          //이미지 변경 간격 시간
let sliderWidth = slider[0].offsetWidth;                            //이미지 가로 값
let sliderClone = sliderInner.firstElementChild.cloneNode(true);    //첫번째 이미지 복사

// 복사한 첫 번째 이미지 마지막에 붙여넣기
sliderInner.appendChild(sliderClone);

function sliderEffect(){
    currentIndex++;

    sliderInner.style.transition = "all 0.6s";
    sliderInner.style.transform = "translateX(-"+ sliderWidth * currentIndex +"px)";

    //마지막 이미지에 위치 했을 때
    if(currentIndex == sliderCount){
        setTimeout(() => {
            sliderInner.style.transition = "0s";
            sliderInner.style.transform = "translateX(0px)";
        }, 700);

        currentIndex = 0;
    }

}

setInterval(sliderEffect, sliderInterval);