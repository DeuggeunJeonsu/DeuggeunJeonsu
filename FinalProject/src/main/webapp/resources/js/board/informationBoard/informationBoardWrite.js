// form 태그 유효성 검사
document.getElementById("write-form").addEventListener("submit", e =>{

    for(let key in checkObj){

        if(!checkObj[key]){

            switch(key){
                case "hashtag" : break;
            }

        }

        e.preventDefault();
        return;

    }

})

// -----------------------------------------------------------------------------------------------

// summernote 에디터 불러오기
$(document).ready(function() {
    $('#summernote').summernote({

        height: 600,                 // 에디터 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '내용을 입력해주세요',
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

const editer =  document.getElementById("summernote");
let charCount = document.getElementById("charCount");

