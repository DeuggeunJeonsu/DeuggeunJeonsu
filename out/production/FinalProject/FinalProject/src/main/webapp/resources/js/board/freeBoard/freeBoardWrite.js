// 해시태그

// 해시태그 입력 영역
const hashtagTextArea = document.getElementById("hashtag-textArea");

// 해시태그가 추가되는 영역
const hashtagMakingArea = document.getElementById("hashtag-making-area");

// 해시태그 글자수 제한
hashtagTextArea.addEventListener("input", e=>{

    /* 해시태그 내용이 11글자 이상일 경우 */
    if(hashtagTextArea.value.trim().length > 10){
        alert("해시태그는 10글자 이하로 입력해 주세요.");
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
        alert("특수문자와 자·모음은 입력할 수 없습니다.");
        hashtagTextArea.value = "";
        return;
    }
    
    // 해시태그 개수가 5개를 넘었을 경우
    if(divCount.length == 5) {
        alert("해시태그는 5개까지 등록 가능합니다.");
        hashtagTextArea.value = "";
        return;
    }
    
    // 공백 입력 후 엔터를 눌렀을 경우
    if(hashtagTextArea.value.trim().length == 0) {
        alert("해시태그를 입력해 주세요.");
        hashtagTextArea.value = "";
        return;
    }

    // 입력한 해시태그 내용이 이미 만들어진 해시태그 내용과 중복될 경우
    for(let i of divCount) {
        if(hashtagTextArea.value == i.innerText) {
            alert("이미 해당 해시태그를 입력하셨습니다.");
            hashtagTextArea.value = "";
            return;
        }
    }

    // 해시태그 앞에 #을 입력했을 경우
    if(hashtagTextArea.value.trim().substr(0,1) == '#'){

        if(hashtagTextArea.value.trim().split('#')[1] == ""){
            alert("해시태그를 입력해 주세요.");
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

    hashtag.append(xBtn);

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

      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','돋움체','바탕체'],
      fontSizes: ['9','10','11','12','14','16','18','20','22','24','28','30']

    })
});


// -----------------------------------------------------------------------------------------------

// form 태그 제출 시
const writeFrm = document.getElementById("write-form");

writeFrm.addEventListener("submit", e=>{

    // 제목 유효성 검사
    const title = document.getElementById("itle-textArea");

    if(title.value.trim().length == 0){
        alert("제목을 입력해 주세요.");
        title.value = "";
        title.focus();
        e.preventDefault();

        return;
    }

    // 내용 유효성 검사
    const content = document.getElementById("summernote");

    if(content.value.trim().length == 0){
        alert("내용을 입력해 주세요.");
        content.value = "";
        content.focus();
        e.preventDefault();

        return;
    }

})