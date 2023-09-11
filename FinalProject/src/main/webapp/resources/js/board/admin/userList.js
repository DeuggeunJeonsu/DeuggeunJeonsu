const userDelBtn = document.getElementsByClassName("userDel")[0];

/* 모달창 메인으로 버튼 alert 효과 */
$(".userDel").click(function () {
    Swal.fire({
      title: '회원을 탈퇴 시키겠습니까?',
      text: "다시 되돌릴 수 없습니다.",
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
            '탈퇴 성공',
            '회원 복구는 DB에서 가능합니다.',
            'success'
          )
        
        }
    })
  });
