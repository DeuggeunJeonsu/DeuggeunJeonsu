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
searchQuery.addEventListener("input", e=>{
    if(e.target.value.trim().length > 10){ // 10글자
        Swal.fire({
            icon: 'error',                     
            title: '검색어는 열 글자까지<br>입력 가능합니다.',    
            text: ''
        });
        e.target.value = e.target.value.trim().substr(0,10);
    }
});

// 검색어 입력 폼 태그가 제출될 때
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
        location.href = "/board/1/list";
    });
}