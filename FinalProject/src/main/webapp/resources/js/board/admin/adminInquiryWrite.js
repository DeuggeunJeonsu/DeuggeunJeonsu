const boardTitle = document.getElementsByClassName("boardTitle")[0];
const boardContent = document.getElementsByClassName("boardContent")[0];
const formTag = document.getElementsByClassName("formTag")[0];

/* const submitBtn = document.getElementById("submit-button"); */
const cancelBtn = document.getElementById("cancel-button");


formTag.addEventListener("submit", e => {
    if(boardTitle.value.trim().length == 0){
        alert("제목을 작성 해주세요.");
        e.preventDefault();
        return;
        
    }else if(boardContent.value.trim().length == 0){
        alert("내용을을 작성 해주세요.");
        e.preventDefault();
        return;
    }

    
})


    function submitBtn(){
    
         return confirm("이대로 작성 하시겠습니까?");
        
    }

    cancelBtn.addEventListener("click", ()=>{

        
        location.href = "/admin/adminInquiry";
    })










