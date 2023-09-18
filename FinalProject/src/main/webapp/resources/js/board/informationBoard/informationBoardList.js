// 글쓰기 버튼 누르면 write 페이지로
const writeBtn = document.getElementById("writeBtn");

writeBtn.addEventListener("click", ()=>{
    location.href="/board/1/write";
})


$(document).ready(function(){
    $(".slide_div").slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 5000
    });
});


const searchInput = document.getElementById("market-search");


(() => {

    const params = new URL(location.href).searchParams;


    const searchTitle = params.get("searchTitle");

    console.log(searchTitle);

    if(searchTitle != ""){
        searchInput.value = params.get("searchTitle");;
    }
})();
