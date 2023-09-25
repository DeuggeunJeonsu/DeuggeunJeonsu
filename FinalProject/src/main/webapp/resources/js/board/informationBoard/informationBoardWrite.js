// summernote 에디터 불러오기
$(document).ready(function() {
    $('#summernote').summernote({

        height: 600,                 // 에디터 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        callbacks: {
                onImageUpload : function(files){
                uploadSummernoteImageFile(files[0], this);
            }
        },
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

// summernote 에디터 내에서 이미지 업로드 했을 때 이미지 경로 변경
function uploadSummernoteImageFile(file, editor){
    var data = new FormData();
    data.append("file", file);
    console.log(file);

    $.ajax({

        data : data,
        type : "POST",
        url : "uploadSummernoteImageFile",
        dataType : "JSON",
        contentType : false,
        processData : false,
        success : function(data){

            $(editor).summernote("insertImage", data.url);
        }
    });

}

// form 태그 제출 시
const writeFrm = document.getElementById("write-form");

writeFrm.addEventListener("submit", e=>{

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

        return;
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

    // 이미지 삽입
    const summernote = document.getElementById("summernote");
    const htmlContent = summernote.value;

    const images = htmlContent.match(/<img[^>]+src="([^"]+)"/g);

    // 이미지가 있는지 확인
    if (images && images.length > 0) {
    
        // 첫 번째 이미지의 소스 속성을 추출합니다.
        const imgSrcMatch = images[0].match(/<img[^>]+src="\/summernoteImage\/([^"]+)"/);

        if (imgSrcMatch && imgSrcMatch.length > 1) {
            const imgSrc = imgSrcMatch[1];
            
            const imgSrcInput = document.querySelector('input[name="imgSrc"]');
            imgSrcInput.value = imgSrc;
        }
    }

})

// 취소 버튼 클릭 시
const cancelBtn = document.getElementById("cancel-btn");
cancelBtn.addEventListener("click", ()=>{

    let url = "/board/1/list";

    const params = new URL(location.href).searchParams;

    let cp;

    if(params.get("cp") != null){ // 쿼리스트링에 cp가 있을 경우
        cp = "?cp=" + params.get("cp");
    } else {
        cp = "?cp=1";
    }

    url += cp;

    location.href = url;
})