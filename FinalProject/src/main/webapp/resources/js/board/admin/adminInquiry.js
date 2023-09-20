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


  /* 답변 여부 */
  const adminCheckFl = document.getElementsByClassName("adminCheckFl");
  const adminCheckFl2 = document.getElementsByClassName("adminCheckFl2");
  
  const inquiryType = document.getElementsByClassName("inquiryType");
  const inquiryType2 = document.getElementsByClassName("inquiryType2");

  (() => {

    for(let i = 0 ; i < adminCheckFl.length ; i++ ){

      if(adminCheckFl2[i].value == 'N'){

        adminCheckFl[i].innerHTML = "미답변";
        adminCheckFl[i].style.color = "black";


      }else{
        adminCheckFl[i].innerHTML = "답변 완료";
      }


      if(inquiryType2[i].value == '1'){
        inquiryType[i].innerHTML = "1:1 문의";

      }else if(inquiryType2[i].value == '3'){
        inquiryType[i].innerHTML = "상품/교환";
      }else{
        inquiryType[i].innerHTML = "상품/취소";
      }
    }

  })();

/* 옵션 맞는 문의목록 조회 */
const option1 = document.getElementById("option1");
const option2 = document.getElementById("option2");

option1.addEventListener("click", () => {

  fetch("/admin/selectInquiry")
  .then()
  .then()
  .catch()

})
