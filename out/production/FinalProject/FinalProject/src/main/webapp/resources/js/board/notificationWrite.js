const count = document.getElementById("ncTextCount");
const content = document.getElementsByClassName("ncContent")[0];
const ncCancle = document.getElementById("ncCancle");
const ncInsert = document.getElementById("ncInsert");



content.addEventListener("input", e => {

    
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


ncCancle.addEventListener("click", () => {

})



/* 모달창 메인으로 버튼 alert 효과 */
$(ncCancle).click(function () {
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

  $(ncInsert).click(function () {
    Swal.fire({
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
    })
  });