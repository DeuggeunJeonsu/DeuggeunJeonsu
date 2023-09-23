const title = document.getElementById("QnATitle");

const content = document.getElementById("QnAContent");

const formTag = document.getElementById("QnAform");

formTag.addEventListener("submit", e => {

    if(title.value.trim().length == 0){

        Swal.fire(
            '제목 미작성',
            '제목을 입력해주세요',
            'error'
            )

            e.preventDefault();
            return;

    }else if(content.value.trim().length == 0){

        Swal.fire(
            '내용 미작성',
            '내용을 입력해주세요',
            'error'
            )

            e.preventDefault();
            return;
    }

})
