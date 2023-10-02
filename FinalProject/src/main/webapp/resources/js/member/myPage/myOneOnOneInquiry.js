const boardTitle = document.getElementsByClassName("boardTitle");
const boardContent = document.getElementsByClassName("boardContent");

const realMarketTitle = document.getElementsByClassName("realMarketTitle");
const marketContent = document.getElementsByClassName("marketContent");

const realboardTitle = document.getElementsByClassName("boardTitle");
const marketTitle = document.getElementsByClassName("marketTitle");

const modalHeader = document.getElementsByClassName("modal-header")[0];
const modalHeader2 = document.getElementById("modal-header2");

const hiddenCheckFl = document.getElementsByClassName("hiddenCheckFl");
const hiddenCheckFl2 = document.getElementsByClassName("hiddenCheckFl2");

const checkFl = document.getElementsByClassName("checkFl");
const checkFl2 = document.getElementsByClassName("checkFl2");

const userBoardNo = document.getElementsByClassName("boardNo");

const QnAModal = document.getElementById("QnAModal");

const modalTitle = document.getElementById("modalTitle");
const QnAContent = document.getElementById("QnAContent");

const closeBtn = document.getElementById("close-button");



for(let i = 0 ; i < boardTitle.length ; i++){

    realboardTitle[i].addEventListener("click", () => {

        QnAModal.style.visibility = "visible";

        modalTitle.value = boardTitle[i].value;
        QnAContent.value = boardContent[i].value;

        console.log(checkFl[i].value);

    })
    
  

    if(hiddenCheckFl[i].value == 'N' ){

        checkFl[i].innerHTML = '미답변';

    }else if(hiddenCheckFl[i].value == 'Y'){

        checkFl[i].innerHTML = '답변 보기';
        checkFl[i].style.color = "#99e1ed";
        checkFl[i].style.cursor = "pointer";
        

    }

    
    
    checkFl[i].addEventListener('click', e => {

        const boardNo = { boardNo : userBoardNo[i].value}


        fetch('/myPage/inquiryAnswer?boardNo=' + boardNo.boardNo)
        .then(resp => resp.json())
        .then(data => {

            console.log(data.boardTitle);

            modalTitle.value = data.boardTitle;
             QnAContent.value = data.boardContent;
             QnAModal.style.visibility = "visible";
             modalHeader.innerHTML = "문의 답변 내용";
             modalHeader2.innerHTML = "회원님이 작성하신 문의글의 대한 답변입니다.🍀"

        })
        .catch(error => console.log(error))
    })
}



for(let i = 0 ; i < marketTitle.length ; i++){

    realMarketTitle[i].addEventListener("click", () => {

        QnAModal.style.visibility = "visible";

        modalTitle.value = marketTitle[i].value;
        QnAContent.value = marketContent[i].value;

        console.log(checkFl[i].value);

    })
    
  

    if(hiddenCheckFl2[i].value == 'N' ){

        checkFl2[i].innerHTML = '미답변';

    }else if(hiddenCheckFl2[i].value == 'Y'){

        checkFl2[i].innerHTML = '답변 보기';
        checkFl2[i].style.color = "#99e1ed";
        checkFl2[i].style.cursor = "pointer";
        

    }

    
    
    checkFl2[i].addEventListener('click', e => {



        fetch('/myPage/inquiryMarketAnswer?marketTitle=' + marketTitle[i].value)
        .then(resp => resp.json())
        .then(data => {

            console.log(data.boardTitle);

            modalTitle.value = data.boardTitle;
             QnAContent.value = data.boardContent;
             QnAModal.style.visibility = "visible";
             modalHeader.innerHTML = "문의 답변 내용";
             modalHeader2.innerHTML = "회원님이 작성하신 문의글의 대한 답변입니다.🍀"

        })
        .catch(error => console.log(error))
    })
}

/* modal 창 닫기 */
closeBtn.addEventListener("click", () => {
    QnAModal.style.visibility = "hidden";
});

for(let i = 0 ; i < marketTitle.length ; i++){

    realMarketTitle[i].addEventListener("click", () => {

        QnAModal.style.visibility = "visible";

        modalTitle.value = marketTitle[i].value;
        QnAContent.value = marketContent[i].value;


    })
    
  

    if(hiddenCheckFl2[i].value == 'N' ){

        checkFl2[i].innerHTML = '미답변';

    }else if(hiddenCheckFl2[i].value == 'Y'){

        checkFl2[i].innerHTML = '답변 보기';
        checkFl2[i].style.color = "#99e1ed";
        checkFl2[i].style.cursor = "pointer";
        

    }


}
