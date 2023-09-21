// 해시태그

// 해시태그 입력 영역
const hashtagTextArea = document.getElementById("hashtag-textArea");

// 해시태그가 추가되는 영역
const hashtagMakingArea = document.getElementById("hashtag-making-area");

// 해시태그 글자수 제한
hashtagTextArea.addEventListener("input", e=>{

    /* 해시태그 내용이 11글자 이상일 경우 */
    if(hashtagTextArea.value.trim().length > 10){

        Swal.fire({
            icon: 'error',                     
            title: '해시태그는 10글자 이하로<br> 입력해 주세요.',    
            text: '', 
          });

        hashtagTextArea.value = hashtagTextArea.value.trim().substr(0,10);
    }

});

// keyup 됐을 때 해시태그 추가
hashtagTextArea.addEventListener("keyup", e => {
    
    // 엔터 또는 스페이스바로 해시태그 추가
    if(e.key === "Enter" | e.keyCode == 32){
        
        e.preventDefault();
        
        handleEnterKeyPress();
    }
});

// 해시태그 추가 함수
function handleEnterKeyPress() {
    
    // 해시태그 개수
    let divCount = document.querySelectorAll('#hashtag-making-area > div');

    const reqExp = /^[a-zA-Z0-9가-힣\#]*$/;
    
    if(!reqExp.test(hashtagTextArea.value.trim())){

        Swal.fire({
            icon: 'error',                     
            title: '특수문자와 자·모음은<br>입력할 수 없습니다.',    
            text: '', 
          });

        hashtagTextArea.value = "";
        return;
    }
    
    // 해시태그 개수가 5개를 넘었을 경우
    if(divCount.length == 5) {

        Swal.fire({
            icon: 'error',                     
            title: '해시태그는 5개까지<br>등록 가능합니다.',    
            text: '', 
          });

        hashtagTextArea.value = "";
        return;
    }
    
    // 공백 입력 후 엔터를 눌렀을 경우
    if(hashtagTextArea.value.trim().length == 0) {

        Swal.fire({
            icon: 'error',                     
            title: '해시태그를 입력해 주세요.',    
            text: '', 
        });
        
        hashtagTextArea.value = "";
        return;
    }

    // 입력한 해시태그 내용이 이미 만들어진 해시태그 내용과 중복될 경우
    for(let i of divCount) {
        if(hashtagTextArea.value == i.innerText) {

            Swal.fire({
                icon: 'error',                     
                title: '이미 해당 해시태그를 입력하셨습니다.',    
                text: '', 
            });

            hashtagTextArea.value = "";
            return;
        }
    }

    // 해시태그 앞에 #을 입력했을 경우
    if(hashtagTextArea.value.trim().substr(0,1) == '#'){

        if(hashtagTextArea.value.trim().split('#')[1] == ""){

            Swal.fire({
                icon: 'error',                     
                title: '#을 빼고 입력해 주세요.',    
                text: '', 
            });
            
            hashtagTextArea.value = "";
            return;
        }

        hashtagTextArea.value = hashtagTextArea.value.trim().substring(1);
    }

    // 해시태그 div 추가
    const xBtn = document.createElement("i");
    xBtn.classList.add("fa-solid", "fa-circle-xmark");
    xBtn.style.color="#ffffff;";

    const hashtag = document.createElement("div");
    hashtag.classList.add("hashtag");

    // 해시태그 div에 내용 추가
    hashtag.innerText = hashtagTextArea.value;
    
    // hashtag.setAttribute("name", "tagContent");

    hashtag.append(xBtn);
    
    const input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "tagContent");
    input.setAttribute("value", hashtag.innerText);

    hashtag.append(input);

    hashtagMakingArea.append(hashtag);

    // 해시태그 클릭 시 삭제 이벤트 추가
    hashtag.addEventListener("click", () => {
        hashtag.remove();
    });

    hashtagTextArea.value = "";
}

// 해시태그 누르면 삭제
if(document.querySelector('#hashtag-making-area > div:first-of-type')){
    
    let hashtags = document.querySelectorAll('#hashtag-making-area > div');
    
    for (let h of hashtags) {
    
        // console.log(h);
    
        h.addEventListener("click", ()=>{
            h.remove();
        })
    }
}

// -----------------------------------------------------------------------------------------------

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
        placeholder: '최대 2048자까지 쓸 수 있습니다. :)',
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

// -----------------------------------------------------------------------------------------------

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

    let url = "/board/3/list";

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