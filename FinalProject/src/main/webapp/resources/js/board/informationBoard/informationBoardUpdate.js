// 태그 불러오기
const hashtagSelect = document.getElementById("tagSelect");
const optionSelect = tagOption;
for(let option of hashtagSelect){
    if(option.value == optionSelect ) option.selected = true;
}

// summernote 에디터 불러오기
$(document).ready(function() {
    $('#summernote').summernote({

        height: 600,                 // 에디터 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '내용을 입력해주세요 :)',
        disableResizeEditor: true,	// 크기 조절 기능 삭제
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['fullscreen', 'help']]
        ],

        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','돋움체','바탕체'],
        fontSizes: ['9','10','11','12','14','16','18','20','22','24','28','30']

    })
});



// form 태그 제출 시
const writeFrm = document.getElementById("write-form");

writeFrm.addEventListener("submit", e=>{

    // 태그 유효성 검사
    const tagValue = (tagSelect.options[tagSelect.selectedIndex].value);
    if(tagValue==""){
        Swal.fire({
            icon: 'error',                     
            title: '태그를 선택해주세요.',    
            text: '', 
        });
        hashtagSelect.focus();
        e.preventDefault();
        return;
    }


    // 제목 유효성 검사
    const title = document.getElementById("title-textArea");

    if(title.value.trim().length == 0){

        Swal.fire({
            icon: 'error',                     
            title: '제목을 입력해 주세요.',    
            text: '', 
        });
        
        title.value = "";
        title.focus();
        e.preventDefault();

        
    }

    // 내용 유효성 검사
    const content = document.getElementById("summernote");

    if(content.value.trim().length == 0){

        Swal.fire({
            icon: 'error',                     
            title: '내용을 입력해 주세요.',    
            text: '', 
        });

        content.value = "";
        content.focus();
        e.preventDefault();

        return;
    }

    // 해쉬태그 삽입
    const tagContent = document.querySelector('input[name="tagContent"]');
    tagContent.value = tagValue;

    // 이미지 삽입
    const summernote = document.getElementById("summernote");
    const htmlContent = summernote.value;

    const image = htmlContent.substring(htmlContent.indexOf('data:image'), htmlContent.indexOf('">'));

    // 이미지가 있는지 확인
    if (image && image.length > 0) {
    
        const imgSrc = image;
        
        const imgSrcInput = document.querySelector('input[name="imgSrc"]');
        imgSrcInput.value = imgSrc;
    }

});

// 취소 버튼 클릭 시
const cancelBtn = document.getElementById("cancel-btn");
cancelBtn.addEventListener("click", ()=>{

    let url = "/board/1/" + boardNo + "?cp="
    
    const params = new URL(location.href).searchParams;

    let cp = params.get("cp");

    url += cp;

    location.href = url;
});