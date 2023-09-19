// 글쓰기 버튼 을 클릭했을 때 
const writeBtn = document.getElementById("writeBtn");

writeBtn.addEventListener("click", ()=>{
    location.href=`/board/${location.pathname.split("/")[2]}/write`
})
