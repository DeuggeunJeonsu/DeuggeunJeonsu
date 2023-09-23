// 획득한 뱃지 호버 효과 주기
const animateBounce = document.querySelectorAll(".animate__bounce");

animateBounce.forEach(element => {

    element.addEventListener("mouseover", ()=>{
        element.classList.add("animate__infinite");
    })

    element.addEventListener("mouseout", ()=>{
        element.classList.remove("animate__infinite");
    })
    
});

// 뱃지 획득 영역 호버 효과 주기
const countCircle = document.getElementById("count-circle");
const ballon = document.getElementsByClassName("ballon")[0];

countCircle.addEventListener("mouseover", ()=>{
    countCircle.classList.add("animate__animated", "animate__pulse", "animate__infinite")
    ballon.style.display = "block";
})

countCircle.addEventListener("mouseout", ()=>{
    countCircle.classList.remove("animate__animated", "animate__pulse", "animate__infinite")
    ballon.style.display = "none";
})