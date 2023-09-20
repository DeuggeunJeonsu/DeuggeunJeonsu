const userDelBtn = document.getElementsByClassName("userDel")[0];
const memberNo = document.getElementById("memberNo").value;

/* 모달창 메인으로 버튼 alert 효과 */
$(".userDel").click(function () {
    Swal.fire({
      title: '회원을 탈퇴 시키겠습니까?',
      text: "회원 목록에서 사라집니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then((result) => {
      if (result.isConfirmed) {

         fetch("/admin/userDel", {
          method : "POST",
          headers : {"Content-Type" : "application/json"},
          body : JSON.stringify({memberNo : memberNo})
        })
        .then(resp => resp.json())
        .then( result => {

          if(result > '0'){
            Swal.fire(
              '탈퇴 성공',
              '회원 복구는 DB에서 가능합니다.',
              'success'
            )
          }
          
          return location.reload(true);
          

        })
        .catch(err => console.log(err))


       
        
        }
    })
  });
