// ----- 해시태그 추가 -----

// 해시태그 입력 영역
const hashtagTextArea = document.getElementById("hashtag-textArea");

// 해시태그가 추가되는 영역
const hashtagMakingArea = document.getElementById("hashtag-making-area");

// 유효성 검사 여부 확인용 객체
const checkObj = {
    "hashtag" : false
}


hashtagTextArea.addEventListener("input", e=>{
    
    /* 해시태그 내용이 11글자 이상일 경우 */
    if(hashtagTextArea.value.trim().length > 10){
        alert("해시태그는 10글자 이하로 입력해 주세요.");
        hashtagTextArea.value = hashtagTextArea.value.trim().substr(0,10);
    }
    
});


hashtagTextArea.addEventListener("keyup", e => {
    
    if(e.key === "Enter"){
        
        e.preventDefault();
        
        handleEnterKeyPress();
    }
});


function handleEnterKeyPress() {
    
    // 해시태그 개수
    let divCount = document.querySelectorAll('#hashtag-making-area > div');
    
    if (divCount.length == 5) {
        alert("해시태그는 5개까지 등록 가능합니다.");
        hashtagTextArea.value = "";
        return;
    }
    
    /* 공백 입력 후 엔터를 눌렀을 경우 */
    if (hashtagTextArea.value.trim().length == 0) {
        alert("해시태그를 입력해 주세요.");
        hashtagTextArea.value = "";
        return;
    }

    /* 입력한 해시태그 내용이 이미 만들어진 해시태그 내용과 중복될 경우 */
    for (let i of divCount) {
        if (hashtagTextArea.value == i.innerText) {
            alert("이미 해당 해시태그를 입력하셨습니다.");
            hashtagTextArea.value = "";
            return;
        }
    }

    const hashtag = document.createElement("div");
    hashtag.classList.add("hashtag");
    hashtag.innerText = hashtagTextArea.value;

    hashtagMakingArea.append(hashtag);

    hashtagTextArea.value = "";
}

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

$(document).ready(function() {
    $('#summernote').summernote({

        height: 600,                 // 에디터 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '회원님의 이야기를 들려주세요 :)',
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

      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
      fontSizes: ['9','10','11','12','14','16','18','20','22','24','28','30']

    })
});
