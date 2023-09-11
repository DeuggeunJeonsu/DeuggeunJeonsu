/* 모달창 메인으로 버튼 alert 효과 */
$(".iq-update").click(function () {
    Swal.fire({
      title: '답변 하시겠습니까?',
      text: "승인 시 작성 페이지로 이동합니다",
      icon: 'success',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then((result) => {
      if (result.isConfirmed) {

            location.href = "/adminIqWrite";
        
        }
    })
  });

  

  $(".market-update").click(function () {
    Swal.fire({
      title: '답변 하시겠습니까?',
      text: "승인 시 작성 페이지로 이동합니다",
      icon: 'success',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then((result) => {
      if (result.isConfirmed) {

            location.href = "/marketWrite";
        
        }
    })
  });