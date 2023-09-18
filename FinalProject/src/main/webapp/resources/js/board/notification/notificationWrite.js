const count = document.getElementById("ncTextCount");
const content = document.getElementsByClassName("ncContent")[0];
const ncCancle = document.getElementById("ncCancle");
const ncInsert = document.getElementById("ncInsert");
const img = document.getElementsByClassName("imgView")[0];
const imgChange = document.getElementById("ncPic");

const input = document.getElementById("title-textArea");
const summernote = document.getElementById("summernote");

const inputCheck = document.getElementById("ncBigCheck");
const checkFL = document.getElementById("checkFL");
const formTag = document.getElementById("write-form");

inputCheck.addEventListener("change", () => {

  if(inputCheck.checked != false){
    checkFL.value = 1;
  }
})




/* imgChange.addEventListener("change", e => {
  
  const imgFile = e.target.files[0]; // 선택된 파일 이미지
  
  input.value = content.innerText;
  input.value += "dfgsdf";
  // 이미지 파일이 선택 되었을 때
  if(imgFile != undefined){
    const imgReader = new FileReader(); // 파일 읽는 객체
    imgReader.readAsDataURL(imgFile);

    imgReader.onload = e => {
      img.setAttribute("src", e.target.result);

    }

  }else{ // 이미지 선택 후 취소 되었을 때

    img.removeAttribute("src");
  }


}) */



/* 
content.addEventListener("keydown", e => {

    
     count.innerHTML = content.value.trim().length; 

    if(content.value.trim().length ==  0){
        count.style.color = "black";
    }

    if(content.value.trim().length > 0){
        count.style.color = "yellowgreen";
    }

    if(content.value.trim().length > 1000){
        count.style.color = "orange";
    }


    if(content.value.trim().length > 1500){
        count.style.color = "red";
    }


})
*/


// summernote 에디터 불러오기
$(document).ready(function() {
  $('#summernote').summernote({

      height: 600,                 // 에디터 높이
      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
      lang: "ko-KR",               // 한글 설정
      callbacks: {
          onImageUpload : function(files){
              uploadSummernoteImageFile(files[0], this);
          }
      },
      placeholder: '최대 2048자까지 쓸 수 있습니다. :)',
      disableResizeEditor: true,   // 크기 조절 기능 삭제
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
      url : "/board/" +boardCode +"/uploadSummernoteImageFileNC",
      dataType : "JSON",
      contentType : false,
      processData : false,
      success : function(data){

          $(editor).summernote("insertImage", data.url);
      }
  });

}



/* 모달창 메인으로 버튼 alert 효과 */
$("#cancel-btn").click(function () {
    Swal.fire({
      title: '이전으로 이동 하시겠습니까?',
      text: "이전페이지로 이동합니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          '',
          '이전페이지로 이동합니다.',
          'success'
        )
      }
    })
  });

  /* form 태그 제출 시 */
 formTag.addEventListener("submit", e => {

  if(input.value.trim().length == 0){

    Swal.fire(
      '제목 미작성',
      '제목을 작성해주세요.',
      'error'

      )
      input.focus();
      e.preventDefault();

      return;
  }
   if(summernote.value.trim().length == 0){

    Swal.fire(
      '내용 미작성',
      '내용을 작성해주세요.',
      'error'
    )
    summernote.focus();
    e.preventDefault();

    return;

  }

 })
 


 function insertBtn(){

  // Summernote 에디터의 내용 가져오기
var editorContent = $('#summernote').summernote('code');

// 에디터 내용을 콘솔에 출력하여 확인
console.log("Editor Content:", editorContent);

// 이미지 추출
var images = $(editorContent).find('img');
console.log("Images:", images);

// 텍스트 추출
var text = $(editorContent).not('img').text();
console.log("Text:", text);
  return confirm("이대로 작성 하시겠습니까?");
  /* Swal.fire({
      title: '이대로 작성 하시겠습니까?',
      text: "공지사항 게시판에 추가됩니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          '작성 완료되었습니다.',
          '공지사항 게시판으로 이동합니다.',
          'success'
        )
      }
    }) */
  

 }

 