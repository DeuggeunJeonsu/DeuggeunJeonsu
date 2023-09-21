const boardTitle = document.getElementsByClassName("boardTitle");
const boardContent = document.getElementsByClassName("boardContent");

const realboardTitle = document.getElementsByClassName("realboardTitle");

const checkFl = document.getElementsByClassName("checkFl");

const QnAModal = document.getElementById("QnAModal");

const modalTitle = document.getElementById("modalTitle");
const QnAContent = document.getElementById("QnAContent");

const closeBtn = document.getElementById("close-button");

for(let i = 0 ; i < boardTitle.length ; i++){
    realboardTitle[i].addEventListener("click", () => {

        QnAModal.style.visibility = "visible";

        modalTitle.value = boardTitle[i].value;
        QnAContent.value = boardContent[i].value;

    })
    
    if(checkFl[i].innerHTML == 'N'){

        checkFl[i].innerHTML = '미답변';

    }else{
        checkFl[i].innerHTML = '답변 완료';
        checkFl[i].style.color = "#99e1ed";

    }
}

/* modal 창 닫기 */
closeBtn.addEventListener("click", () => {
    QnAModal.style.visibility = "hidden";
})