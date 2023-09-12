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